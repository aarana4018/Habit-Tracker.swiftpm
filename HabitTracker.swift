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
    
    @State var StarOne = "star"
    @State var StarTwo = "star"
    @State var StarThree = "star"
    @State var StarFour = "star"
    
    
    var body: some View {
        
        VStack {
            
            Image("HabitTitle")
                .resizable()
                .frame(width: 530, height: 330)
            
            Spacer()
            
            HStack (spacing: 10) {
                
                VStack{
                    Image(systemName: StarOne)
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                        .opacity(0.8)
                }
                .frame(width: 90, height: 200, alignment: .bottom)
                
                VStack{
                    Image(systemName: StarTwo)
                        .font(.system(size: 80))
                        .foregroundColor(.gray)
                        .opacity(0.6)
                }
                .frame(width: 50, height: 50, alignment: .top)
                
                VStack{
                    Image(systemName: StarThree)
                        .font(.system(size: 100))
                        .foregroundColor(.gray)
                        .opacity(0.4)
                }
                .frame(width: 140, height: 140, alignment: .top)
                
                VStack {
                    Image(systemName: StarFour)
                        .font(.system(size: 150))
                        .foregroundColor(.gray)
                        .opacity(0.2)
                }
                .frame(width: 120, height: 250, alignment: .top)
                
            }
            
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
            
            Spacer()
            
        }
        .padding()
    }
    
    
    struct iOSCheckboxToggleStyle: ToggleStyle {
        
        func makeBody(configuration: Configuration) -> some View {
            
            Button(action: {
                configuration.isOn.toggle()
                if configuration.isOn {
                }
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
