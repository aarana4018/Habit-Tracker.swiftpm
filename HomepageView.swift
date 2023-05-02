import SwiftUI

struct HomepageView: View {
    var body: some View {
        NavigationView  {
            VStack (spacing: 35) {
                
                Image("TrackItTitle")
                    .resizable()
                    .frame(width: 600, height: 340)
                
                Text("Welcome!")
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                    .opacity(0.5)
                    
                
                NavigationLink("Habit Tracker") {
                    HabitView()
                }
                .frame(width: 400, height: 50, alignment: .center)
                .foregroundColor(.gray.opacity(0.4))
                .font(.system(size: 40))
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.yellow.opacity(0.5),lineWidth: 10)
                
                )
                
                NavigationLink("Water Tracker") {
                    WaterView()
                }
                .frame(width: 400, height: 50, alignment: .center)
                .foregroundColor(.gray.opacity(0.4))
                .font(.system(size: 40))
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.yellow.opacity(0.5),lineWidth: 10)
                    
                )
                
                NavigationLink("Sleep Tracker") {
                    SleepView()
                }
                .frame(width: 400, height: 50, alignment: .center)
                .foregroundColor(.gray.opacity(0.4))
                .font(.system(size: 40))
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.yellow.opacity(0.5),lineWidth: 10)
                    
                )
                
                NavigationLink("Exercise Tracker") {
                    ExcerciseView()
                }
                .frame(width: 400, height: 50, alignment: .center)
                .foregroundColor(.gray.opacity(0.4))
                .font(.system(size: 40))
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.yellow.opacity(0.5),lineWidth: 10)
                    
                )
                
                
            }
            .padding()
        }
        .navigationViewStyle(.stack)
    }
}

