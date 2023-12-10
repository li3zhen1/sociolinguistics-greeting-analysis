import Foundation
import RegexBuilder

let isHanzi = #/\p{script=Han}/#
let notHanzi = #/[^\p{script=Han}]/#
let startOfString = #/^/#

let regex_你好 = Regex {
  ChoiceOf {
    Anchor.startOfLine
    notHanzi
  }
  "你好"
  notHanzi
}

// for match in "你好，你好,你好,你好!你好呀".matches(of: reg) {
//     print(match.0)
// }

// for match in "你好！你好！你好呀".matches(of: reg) {
//     print(match.0)
// }

// let TXT_PATH = "/Users/lizhen/Downloads/MagicData-RAMC/MDT2021S003/TXT"

// // read all files

let subtitlePath = "./captions/2020s"
let fileManager = FileManager.default
let enumerator: FileManager.DirectoryEnumerator = fileManager.enumerator(atPath: subtitlePath)!

// var files: [String: String] = [:]
extension String.Encoding {
  static let gb_18030_2000 = String.Encoding(
    rawValue: CFStringConvertEncodingToNSStringEncoding(
      CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue)))
}

while let element = enumerator.nextObject() as? String {
    if element.hasSuffix(".srt") || element.hasSuffix(".ass") || element.hasSuffix(".txt") {
        do {
            let fileContent = try String(contentsOfFile: subtitlePath + "/" + element, encoding: .utf8)
            // print(fileContent.split(separator: "\n")[0])
            print(element)
        } catch {
            let fileContent = try String(contentsOfFile: subtitlePath + "/" + element, encoding: .gb_18030_2000)
            print(element)
        }
    }
}
