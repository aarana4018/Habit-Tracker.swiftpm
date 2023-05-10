import SwiftUI

struct HabitView: View {
    
    @EnvironmentObject var habits: Habits
    
    @State var CheckBox1: Bool = false
    @State var CheckBox2: Bool = false
    @State var CheckBox3: Bool = false
    @State var CheckBox4: Bool = false
    
    @State private var isOn1 = false
    @State private var isOn2 = false
    @State private var isOn3 = false
    @State private var isOn4 = false
    
    var body: some View {
        
        VStack{
            
            Toggle(isOn: $isOn1){
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 5)
                        .frame(maxWidth: 250, maxHeight: 50)
                        .foregroundColor(.orange)
                        .opacity(0.5)
                        .padding()
                    
                    Text("\(habits.Habit1)")
                        .foregroundColor(.gray)
                }
            }
            .toggleStyle(iOSCheckboxToggleStyle())
           
            
            Toggle(isOn: $isOn2){
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 5)
                        .frame(maxWidth: 250, maxHeight: 50)
                        .foregroundColor(.orange)
                        .opacity(0.5)
                        .padding()
                    
                    Text("\(habits.Habit2)")
                        .foregroundColor(.gray)
                }
            }
            .toggleStyle(iOSCheckboxToggleStyle())
            
            
            Toggle(isOn: $isOn3){
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 5)
                        .frame(maxWidth: 250, maxHeight: 50)
                        .foregroundColor(.orange)
                        .opacity(0.5)
                        .padding()
                    
                    Text("\(habits.Habit3)")
                        .foregroundColor(.gray)
                }
            }
            .toggleStyle(iOSCheckboxToggleStyle())
            
            Toggle(isOn: $isOn4){
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 5)
                        .frame(maxWidth: 250, maxHeight: 50)
                        .foregroundColor(.orange)
                        .opacity(0.5)
                        .padding()
                    
                    Text("\(habits.Habit4)")
                        .foregroundColor(.gray)
                }
            }
            .toggleStyle(iOSCheckboxToggleStyle())
            
        }
        
    }
    
    
    struct iOSCheckboxToggleStyle: ToggleStyle {
        func makeBody(configuration: Configuration) -> some View {
            
            Button(action: {
                configuration.isOn.toggle()
            }, label: {
                HStack{
                    Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .opacity(0.5)
                        .foregroundColor(.orange)
                    configuration.label
                }
            })
        }
    }
}
