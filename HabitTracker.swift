import SwiftUI

var StarOne = "star"
var StarTwo = "star"
var StarThree = "star"
var StarFour = "star"

var Message = " "

struct HabitView: View {
    
    @EnvironmentObject var habits: Habits
    
    @AppStorage("CheckBox1") var CheckBox1: Bool = false
    @AppStorage("CheckBox2") var CheckBox2: Bool = false
    @AppStorage("CheckBox3") var CheckBox3: Bool = false
    @AppStorage("CheckBox4") var CheckBox4: Bool = false
    
    @AppStorage("isOn1") private var isOn1 = false
    @AppStorage("isOn2") private var isOn2 = false
    @AppStorage("isOn3") private var isOn3 = false
    @AppStorage("isOn4") private var isOn4 = false
    
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
                        .foregroundColor(.orange)
                        .opacity(0.8)
                }
                .frame(width: 90, height: 200, alignment: .bottom)
                
                VStack{
                    Image(systemName: StarTwo)
                        .font(.system(size: 80))
                        .foregroundColor(.orange)
                        .opacity(0.6)
                }
                .frame(width: 50, height: 50, alignment: .top)
                
                VStack{
                    Image(systemName: StarThree)
                        .font(.system(size: 100))
                        .foregroundColor(.orange)
                        .opacity(0.4)
                }
                .frame(width: 140, height: 140, alignment: .top)
                
                VStack {
                    Image(systemName: StarFour)
                        .font(.system(size: 150))
                        .foregroundColor(.orange)
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
                .toggleStyle(iOSCheckboxToggleStyle(number: 1))
                
                
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
                .toggleStyle(iOSCheckboxToggleStyle(number: 2))
                
                
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
                .toggleStyle(iOSCheckboxToggleStyle(number: 3))
                
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
                .toggleStyle(iOSCheckboxToggleStyle(number: 4))
                
            }
            
            Spacer()
            
        }
        .padding()
    }
    

    
    struct iOSCheckboxToggleStyle: ToggleStyle {
        
        let number: Int
        
        func makeBody(configuration: Configuration) -> some View {
            
            Button(action: {
                configuration.isOn.toggle()
                if number == 1 {
                    if configuration.isOn{
                        StarOne = "star.fill"
                    } else {
                        StarOne = "star"
                    }
                }
                
                if number == 2 {
                    if configuration.isOn{
                        StarTwo = "star.fill"
                    }  else {
                        StarTwo = "star"
                    }
                }
                
                if number == 3 {
                    if configuration.isOn {
                        StarThree = "star.fill"
                    } else {
                        StarThree = "star"
                    }
                }
                    
                if number == 4 {
                    if configuration.isOn {
                        StarFour = "star.fill"
                    } else {
                        StarFour = "star"
                    }
                }
                
                
                if StarOne == "star.fill" && StarTwo == "star.fill" && StarThree == "star.fill" && StarFour == "star.fill" {
                    Message = "Congrats! You completed 4 habits!"
                } else {
                    Message = ""
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
