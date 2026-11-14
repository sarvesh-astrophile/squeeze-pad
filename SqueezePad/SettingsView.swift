import SwiftUI

struct SettingsView: View {
    @AppStorage("collapseBlankLines") private var collapseBlankLines = true
    @AppStorage("uppercaseResult") private var uppercaseResult = false

    var body: some View {
        Form {
            Section("Output") {
                Toggle("Drop blank lines", isOn: $collapseBlankLines)
                Toggle("Uppercase result", isOn: $uppercaseResult)
            }
        }
        .formStyle(.grouped)
        .frame(width: 380)
        .padding()
    }
}
