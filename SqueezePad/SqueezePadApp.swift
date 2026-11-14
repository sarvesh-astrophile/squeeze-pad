import SwiftUI

@main
struct SqueezePadApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(width: 640, height: 540)

        Settings {
            SettingsView()
        }
    }
}
