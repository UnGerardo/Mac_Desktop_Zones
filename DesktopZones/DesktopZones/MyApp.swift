import SwiftUI

@main struct MyApp: App {
    
    var body: some Scene {
        MenuBarExtra("DesktopZones", systemImage: "hammer") {
            StatusMenu()
        }.menuBarExtraStyle(.window)
    }
}
