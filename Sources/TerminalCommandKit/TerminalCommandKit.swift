import Foundation
import PathKit

public struct FileInfo {
    var path: String
}

enum FileType {
    case swift
    case objc
    case xib
    
    init?(ext: String) {
        switch ext.lowercased() {
        case "swift": self = .swift
        case "mm","m": self = .objc
        case "xib","storyboard": self = .xib
        default: return nil
        }
    }
    
    func searcher(extensions: [String]) -> RegexStringSearcher {
        switch self {
        case .swift: return SwiftSearcher(extensions: extensions)
        case .objc: return ObjcSearcher(extensions: extensions)
        case .xib: return XibSearcher(extensions: extensions)
//        default: return GeneralSearcher(extensions: extensions)
        }
    }
}

public struct TerminalCommandKit {
    let projectPath: Path
    let excludePaths: [Path]
    let resourceExtensions: [String]
    let fileExtensions: [String]
    
    public init(projectPath: String, excludePaths: [String], resourceExtensions:[String], fileExtensions:[String]) {
        let path = Path(projectPath).absolute()
        self.projectPath = path
        self.excludePaths = excludePaths.map{path + Path($0)}
        self.resourceExtensions = resourceExtensions
        self.fileExtensions = fileExtensions
    }
    
    public func unusedResources() -> [FileInfo] {
        fatalError()
    }
    
    func stringInUse() -> [String] {
        fatalError()
    }
    
    private func stringInUse(at path: Path) -> Set<String> {
        guard let subPaths = try? path.children() else {
            print("error path :\(path)")
            return []
        }
        
        var result = [String]()
        
        for subPath in subPaths {
            if subPath.lastComponent.hasPrefix(".") {
                continue
            }
            
            if excludePaths.contains(subPath) {
                continue
            }
            
            if subPath.isDirectory {
                result.append(contentsOf: stringInUse(at: subPath))
            }else {
                let fileExt = subPath.extension ?? ""
                guard fileExtensions.contains(fileExt) else {continue}
                
                let searcher: RegexStringSearcher
                if let fileType = FileType(ext: fileExt) {
                    searcher = fileType.searcher(extensions: fileExtensions)
                }else {
                    searcher = GeneralSearcher(extensions: fileExtensions)
                }
                
                let content = (try? subPath.read()) ?? ""
                result.append(contentsOf: searcher.search(in: content))
            }
        }
        
        return Set(result)
    }
    
    func resouceInUse() -> [String: String] {
        fatalError()
    }
    
    public func delect() {
        
    }
}






























