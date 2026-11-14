import SwiftUI

struct ContentView: View {
    @Environment(AppModel.self) private var model
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        @Bindable var model = model

        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text(
            "Hello, world!"
        ) /*@END_MENU_TOKEN@*/
    }
}
