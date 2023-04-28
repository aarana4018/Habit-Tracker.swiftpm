import SwiftUI

struct HomepageView: View {
    var body: some View {
        NavigationView  {
            VStack {
                Text("Welcome!")
                
                NavigationLink("Habit Tracker") {
                    HabitView()
                }
                
                NavigationLink("Water Tracker") {
                    WaterView()
                }
                
                NavigationLink("Sleep Tracker") {
                    SleepView()
                }
                
                NavigationLink("Exercise Tracker") {
                    ExcerciseView()
                }
                
                
            }
        }
        .navigationViewStyle(.stack)
//        comment
    }
}

