import SwiftUI

struct ContentView: View {
    @Environment(AppModel.self) private var model
    @Environment(\.scenePhase) private var scenePhase
    @FocusState private var isEditorFocused: Bool

    var body: some View {
        @Bindable var model = model

        VStack(alignment: .leading, spacing: 12) {
            Text("Squeeze")
                .font(.largeTitle)

            Text("Paste messy text below, then press ⌘⇧S.")
                .font(.callout)
                .foregroundStyle(.secondary)

            ZStack(alignment: .topLeading) {
                TextEditor(text: $model.draft)
                    .font(.system(.body, design: .monospaced))
                    .focused($isEditorFocused)
                    .accessibilityLabel("Text to squeeze")
                    .padding(6)
                    .frame(minHeight: 140)
                    .background(
                        RoundedRectangle(cornerRadius: 8).fill(
                            Color(nsColor: .textBackgroundColor)
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 8).stroke(.quaternary)
                    )

                if model.draft.isEmpty {
                    Text("Paste or type text here")
                        .foregroundStyle(.tertiary)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 10)
                        .allowsHitTesting(false)
                }
            }

            HStack {
                Button {
                    model.squeeze()
                } label: {
                    Label("Squeeze Text", systemImage: "wand.and.stars")
                }
                .buttonStyle(.borderedProminent)
                .disabled(!model.canSqueeze)
                .help("Squeeze the text (⌘⇧S)")

                Text("⌘⇧S")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Spacer()

                SettingsLink {
                    Label("Settings", systemImage: "gear")
                }
                .help("Open Settings (⌘,)")
            }

            ScrollView {
                Text(
                    model.result.isEmpty ? "Result appears here." : model.result
                )
                .font(.system(.body, design: .monospaced))
                .textSelection(.enabled)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(
                    model.result.isEmpty ? Color.secondary : Color.primary
                )
                .padding(6)
                .frame(minHeight: 140)
                .background(
                    RoundedRectangle(cornerRadius: 8).fill(
                        Color(nsColor: .textBackgroundColor)
                    )
                )
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(.quaternary))
                .accessibilityLabel("Squeezed result")

                if let status = model.statusMessage {
                    Text(status)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }.padding(20)
                .frame(minWidth: 560, minHeight: 480)
                .onAppear {
                    isEditorFocused = true
                    print("ContentView appeared")
                }
                .onDisappear { print("ContentView disappeared") }
                .onChange(
                    of: scenePhase,
                    {
                        _,
                        newPhase in print("scenePhase changed to: \(newPhase)")
                    }
                )

        }
    }
}
