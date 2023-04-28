import SwiftUI

struct ContentView: View {
    var body: some View {
    
            VStack {
                TabView {
                    HomepageView()
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                                .foregroundColor(.yellow)
                        }
                    
                    SettingsView()
                        .tabItem {
                            Label("Settings", systemImage:  "gearshape.fill")
                                .foregroundColor(.yellow)
                        }
                }
                .foregroundColor(.gray)
                .accentColor(.black)
        }
    }
}
