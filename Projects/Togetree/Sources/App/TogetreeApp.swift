import SwiftUI
import AuthenticationServices

@main
struct TogetreeApp: App {
    @State var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(authViewModel)
        }
    }
}
