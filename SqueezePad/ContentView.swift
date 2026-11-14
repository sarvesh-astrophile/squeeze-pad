import SwiftUI

struct ContentView: View {
    @State private var draft = "  hello   world\n\n  second    line  "
    @State private var result = ""

    @AppStorage("collapseBlankLines") private var collapseBlankLines = true
    @AppStorage("uppercaseResult") private var uppercaseResult = false
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        VStack(spacing: 12) {
            Text("Squeeze")
                .font(.largeTitle)

            TextEditor(text: $draft)
                .font(.system(.body, design: .monospaced))
                .frame(minHeight: 120)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(.quaternary))

            HStack {
                Button {
                    result = squeeze(draft)
                } label: {
                    Label("Squeeze Text", systemImage: "wand.and.stars")
                }
                .keyboardShortcut("s", modifiers: [.command, .shift])   // ← ⌘⇧S
                .buttonStyle(.borderedProminent)

                Text("⌘⇧S")
                    .foregroundStyle(.secondary)

                Spacer()

                SettingsLink {
                    Text("Settings…")
                }
            }

            ScrollView {
                Text(result.isEmpty ? "Result appears here…" : result)
                    .font(.system(.body, design: .monospaced))
                    .textSelection(.enabled)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(minHeight: 120)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.quaternary))

            Spacer() 
        }
        .padding()
        .onAppear { print("ContentView appeared") }
        .onDisappear { print("ContentView disappeared") }
        .onChange(of: scenePhase) { _, newPhase in
            print("scenePhase changed to: \(newPhase)")
        }
    }

    private func squeeze(_ input: String) -> String {
        var lines: [String] = []
        for rawLine in input.components(separatedBy: .newlines) {
            let words = rawLine.components(separatedBy: .whitespaces).filter { !$0.isEmpty }
            var line = words.joined(separator: " ")
            if uppercaseResult { line = line.uppercased() }
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
