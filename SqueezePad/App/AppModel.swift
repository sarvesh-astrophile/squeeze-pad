import Foundation
import Observation

enum SettingKey {
  static let uppercaseResult = "uppercaseResult"
  static let collapseBlankLines = "collapseBlankLines"

  static let defaults: [String: Any] = [
    uppercaseResult: false,
    collapseBlankLines: true,
  ]
}

@Observable
final class AppModel {
  var draft = ""
  var result = ""
  var statusMessage: String?

  init() {
    UserDefaults
      .standard
      .register(defaults: SettingKey.defaults)
  }

  var canSqueeze: Bool {
    !draft
      .trimmingCharacters(in: .whitespacesAndNewlines)
      .isEmpty
  }

  var uppercaseResult: Bool {
    UserDefaults
      .standard
      .bool(forKey: SettingKey.uppercaseResult)
  }

  var collapseBlankLines: Bool {
    UserDefaults
      .standard
      .bool(forKey: SettingKey.collapseBlankLines)
  }

  func squeeze() {
    guard canSqueeze else {
      result = ""
      statusMessage = "Nothing to squeeze - paste some text first."
      return
    }

    result = TextFormatter.squeeze(
      draft,
      uppercase: uppercaseResult,
      collapseBlankLines: collapseBlankLines
    )
    statusMessage = nil
  }
}
