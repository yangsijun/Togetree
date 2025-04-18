import SwiftUI

@main
struct TogetreeApp: App {
    @State private var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(authViewModel)
        }
    }
}
