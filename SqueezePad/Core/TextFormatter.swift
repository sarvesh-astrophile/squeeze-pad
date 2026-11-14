import Foundation

enum TextFormatter {

  static func squeeze(
    _ input: String,
    uppercase: Bool = false,
    collapseBlankLines: Bool = true
  ) -> String {
    var lines: [String] = []

    for rawLine in input.components(separatedBy: .newlines) {
      let words =
        rawLine
        .components(separatedBy: .whitespaces)
        .filter { !$0.isEmpty }

      var line = words.joined(separator: " ")
      if uppercase { line = line.uppercased() }

      if line.isEmpty {
        if collapseBlankLines { continue }
        lines.append("")
      } else {
        lines.append(line)
      }
    }
    return lines.joined(separator: "\n")
  }
}
