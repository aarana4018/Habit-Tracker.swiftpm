import SwiftUI

struct HabitView: View {
    
    @EnvironmentObject var habits: Habits
    
    @State var CheckBox1: Bool = false
    @State var CheckBox2: Bool = false
    @State var CheckBox3: Bool = false
    @State var CheckBox4: Bool = false
    
    var body: some View {
        
        VStack{
            ZStack{
                Text("\(habits.Habit1)")
            }
            
            Text("\(habits.Habit2)")
            
            Text("\(habits.Habit3)")
            
            Text("\(habits.Habit4)") 
            
        }
        
    }
}

