import SwiftUI

struct SettingsView: View {
    @AppStorage(SettingKey.uppercaseResult) private var uppercaseResult = false
    @AppStorage(SettingKey.collapseBlankLines) private var collapseBlankLines = true
    
    var body: some View {
        Form {
            Section("Output") {
                Toggle("Drop blank lines", isOn: $collapseBlankLines)
                Toggle("Uppercase result", isOn: $uppercaseResult)
            }
            
            Section {
                Button("Reset to Defaults") {
                    uppercaseResult = false
                    collapseBlankLines = true
                }
            }
        }
        .formStyle(.grouped)
        .frame(width: 380)
        .padding()
    }
}
