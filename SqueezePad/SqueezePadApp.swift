import SwiftUI

@main
struct SqueezePadApp: App {
    @State private var appModel = AppModel()

    var body: some Scene {
        Window("SqueezePad", id: "main") {
            ContentView()
                .environment(appModel)
        }
        .defaultSize(width: 680, height: 560)
        .windowResizability(.contentSize)
        .commands {
            CommandMenu("Squeeze") {
                Button("Squeeze Text") {
                    appModel.squeeze()
                }
                .keyboardShortcut("s", modifiers: [.command, .shift])
            }
        }
        Settings {
            SettingsView()
                .environment(appModel)
        }
    }
}
