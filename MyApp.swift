import SwiftUI

@main
struct MyApp: App {
    
     @StateObject var habits = Habits()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(habits)
        }
    }
}
