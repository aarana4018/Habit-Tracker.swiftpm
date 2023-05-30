import SwiftUI

struct ContentView: View {
    var body: some View {
    
            VStack {
                TabView {
                    HomepageView()
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                                .foregroundColor(.gray)
                        }
                    
                    SettingsView()
                        .tabItem {
                            Label("Settings", systemImage:  "gearshape.fill")
                                .foregroundColor(.gray)
                        }
                    
                    CalendarView()
                        .tabItem { 
                            Label("Calendar", systemImage: "calendar")
                                .foregroundColor(.gray)
                        }
                    
                }
                .foregroundColor(.gray)
                .accentColor(.black)
        }
    }
}
