import Foundation
import CommandLineKit
import Rainbow
import TerminalCommandKit

let cli = CommandLineKit.CommandLine()

let projectPathOption = StringOption(shortFlag: "p", longFlag: "project", helpMessage: "Path of the project.")
let excludePathOption = MultiStringOption(shortFlag: "e", longFlag: "excludepath", helpMessage: "Exclude path which not search in.")
let resourceExtensionsOption = MultiStringOption(shortFlag: "r", longFlag: "resources-extensions",helpMessage: "extension of search.")

let fileExtensionsOption = MultiStringOption(shortFlag: "f", longFlag: "file-extensions", helpMessage: "File extensions to search with.")
let help = BoolOption(shortFlag: "h", longFlag: "help",
                      helpMessage: "Prints a help message.")

cli.addOptions(projectPathOption, resourceExtensionsOption, fileExtensionsOption, help)

cli.formatOutput = { s, type in
    var str: String
    switch(type) {
    case .error:
        str = s.red.bold
    case .optionFlag:
        str = s.green.underline
    case .optionHelp:
        str = s.blue
    default:
        str = s
    }
    
    return cli.defaultFormat(s:str, type: type)
}

do {
    try cli.parse()
} catch {
    cli.printUsage(error)
    exit(EX_USAGE)
}

if help.value {
    cli.printUsage()
    exit(EX_USAGE)
}

print("sjdlfa")

let projectPath = projectPathOption.value ?? "."
let excludePath = excludePathOption.value ?? []
let resourceExtensions = resourceExtensionsOption.value ?? ["png","jpg","imageset"]
let fileExtensions = fileExtensionsOption.value ?? ["swift","m","mm","storyboard","xib"]

