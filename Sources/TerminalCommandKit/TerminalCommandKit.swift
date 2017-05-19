import Foundation
import PathKit

public struct FileInfo {
    var path: String
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
    
    func resouceInUse() -> [String: String] {
        fatalError()
    }
    
    public func delect() {
        
    }
}






























