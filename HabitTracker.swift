import SwiftUI

struct HabitView: View {
    
    @EnvironmentObject var habits: Habits
    
    @State var CheckBox1: Bool = false
    @State var CheckBox2: Bool = false
    @State var CheckBox3: Bool = false
    @State var CheckBox4: Bool = false
    
    @State private var isOn = false
    
    var body: some View {
        
        VStack{
            
            Toggle(isOn: $isOn){
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 5)
                    .frame(maxWidth: 250, maxHeight: 50)
                    .foregroundColor(.orange)
                    .opacity(0.5)
                
                Text("\(habits.Habit1)")
                    .foregroundColor(.gray)
            }
            .toggleStyle(iOSCheckboxToggleStyle())
            //            HStack{
            //                
            //                Rectangle()
            //                    .stroke(lineWidth: 5)
            //                    .frame(width: 40, height: 40)
            //                    .foregroundColor(.orange)
            //                    .opacity(0.5)
            //                                    
            //                ZStack{
            
            
            HStack{
                
                ZStack{
                    Rectangle()
                        .stroke(lineWidth: 5)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.orange)
                        .opacity(0.5)
                }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 5)
                        .frame(maxWidth: 250, maxHeight: 50)
                        .foregroundColor(.orange)
                        .opacity(0.5)
                    
                    Text("\(habits.Habit2)")
                        .foregroundColor(.gray)
                }
                .padding()
            }
            
            
            HStack{
                
                Rectangle()
                    .stroke(lineWidth: 5)
                    .frame(width: 40, height: 40)
                    .foregroundColor(.orange)
                    .opacity(0.5)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 5)
                        .frame(maxWidth: 250, maxHeight: 50)
                        .foregroundColor(.orange)
                        .opacity(0.5)
                    
                    Text("\(habits.Habit3)")
                        .foregroundColor(.gray)
                }
                .padding()
            }
            
            HStack{
                
                Rectangle()
                    .stroke(lineWidth: 5)
                    .frame(width: 40, height: 40)
                    .foregroundColor(.orange)
                    .opacity(0.5)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 5)
                        .frame(maxWidth: 250, maxHeight: 50)
                        .foregroundColor(.orange)
                        .opacity(0.5)
                    
                    Text("\(habits.Habit4)")
                        .foregroundColor(.gray)
                }
                .padding()
            }
            
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
                    configuration.label
                }
            })
        }
    }
}
