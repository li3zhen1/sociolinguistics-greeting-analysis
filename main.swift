import Foundation
import RegexBuilder

print("你好，你好,你好呀".matches(of: #/你好[^\p{Han}]/#).count)

let TXT_PATH = "/Users/lizhen/Downloads/MagicData-RAMC/MDT2021S003/TXT"

// read all files
let fileManager = FileManager.default
let enumerator: FileManager.DirectoryEnumerator = fileManager.enumerator(atPath: TXT_PATH)!
var files: [String: String] = [:]

while let element = enumerator.nextObject() as? String {
  let fileContent = try String(contentsOfFile: TXT_PATH + "/" + element, encoding: .utf8)
  files.updateValue(fileContent, forKey: element)
}

let reg = #/\[[0-9,\.]+\]\s+[A-Z][0-9]+\s+\p{Han}+,\p{Han}+\s+(.+)/#

func extractConversations(_ textContent: Substring) -> String {
  if let result = textContent.firstMatch(of: reg) {
    return String(result.1)
  }
  return ""
}

// extractConversations(textContent: """
// [1.538,6.184]	G00000571	男,普通话	爱数智慧语音采集二零一九年十一月十日
// """)

var str = ""
for (key, value) in files {
  for l in value.split(separator: "\n") {
    str += extractConversations(l) + "\n"
  }
}

// try str.write(toFile: "./ramc.txt", atomically: true, encoding: .utf8)

print(str.matches(of: #/你好[^\p{Han}]/#).count)
