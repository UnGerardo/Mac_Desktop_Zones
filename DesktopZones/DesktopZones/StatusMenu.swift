import SwiftUI
import ApplicationServices

struct StatusMenu: View {
    @State private var permissionGranted = AXIsProcessTrusted()
    
    var body: some View {
        Text(permissionGranted ? "Granted" : "Not granted")
            .padding()
            .onAppear {
                permissionGranted = AXIsProcessTrusted()
            }
        
        if !permissionGranted {
            Button("Grant permissions") {
                let options = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String: true] as CFDictionary
                AXIsProcessTrustedWithOptions(options)
            }.padding()
        }
        
        Button("Quit") {
            NSApplication.shared.terminate(nil)
        }.padding()
    }
}
