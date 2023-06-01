import SwiftUI

struct SettingsView: View {
    
     @EnvironmentObject var habits: Habits
    
    @AppStorage("SetHabit1") var SetHabit1: String = "Your Habit Here"
    @AppStorage("SetHabit2") var SetHabit2: String = "Your Habit Here"
    @AppStorage("SetHabit3") var SetHabit3: String = "Your Habit Here"
    @AppStorage("SetHabit4") var SetHabit4: String = "Your Habit Here"
    
    var body: some View {
        
        VStack (spacing: 0) {
            
            VStack (spacing: 0) {
                
                Image("SettingsTitle")
                    .resizable()
                    .frame(width: 500, height: 290)
                
                Spacer()
                
                Text("Set Your Habits:")
                    .foregroundColor(SettingsCustomColor.SettingsColorOne)
                    .font(.title)
                
                Divider()
                    .frame(width: 400, height: 20)
               
                HStack{
                    
                    TextField("", text: $habits.Habit1)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .onSubmit {
                            SetHabit1 = habits.Habit1 
                        }
                        .foregroundColor(SettingsCustomColor.SettingsColorOne)
                    
                    Text("\(SetHabit1)")
                        .padding()
                        .foregroundColor(SettingsCustomColor.SettingsColorOne)
                    
                }
                
                HStack{
                    
                    TextField("", text: $habits.Habit2)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .onSubmit {
                            SetHabit2 = habits.Habit2
                        }
                        .foregroundColor(SettingsCustomColor.SettingsColorOne)
                    
                    Text("\(SetHabit2)")
                        .padding()
                        .foregroundColor(SettingsCustomColor.SettingsColorOne)
                    
                }
                
                HStack{
                    
                    TextField("", text: $habits.Habit3)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .onSubmit {
                            SetHabit3 = habits.Habit3
                        }
                        .foregroundColor(SettingsCustomColor.SettingsColorOne)
                    
                    Text("\(SetHabit3)")
                        .padding()
                        .foregroundColor(SettingsCustomColor.SettingsColorOne)
                    
                }
                
                HStack{
                    
                    TextField("", text: $habits.Habit4)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .onSubmit {
                            SetHabit4 = habits.Habit4
                        }
                        .foregroundColor(SettingsCustomColor.SettingsColorOne)
                    
                    Text("\(SetHabit4)")
                        .padding()
                        .foregroundColor(SettingsCustomColor.SettingsColorOne)
                    
                }
            }
            
            Text("Remove a Tracker:")
                .font(.title)
                .foregroundColor(SettingsCustomColor.SettingsColorOne)
            
            VStack {
                
                HStack{
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 5)
                            .frame(maxWidth: 250, maxHeight: 50)
                            .foregroundColor(SettingsCustomColor.SettingsColorOne)
                        
                        Text("Habit Tracker")
                            .foregroundColor(.gray)
                    }
                    
                    Button(action: {
                        habits.buttonOpasity1 = 1.0
                    }, label: {
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(SettingsCustomColor.SettingsColorTwo)
                    })
                    
                    Button(action: {
                        habits.buttonOpasity1 = 0.3
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(SettingsCustomColor.SettingsColorTwo)
                    })
                    
                }
                
                
                
                HStack {
                    
                    ZStack{ 
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 5)
                            .frame(maxWidth: 250, maxHeight: 50)
                            .foregroundColor(SettingsCustomColor.SettingsColorOne)
                        
                        Text("Water Tracker")
                            .foregroundColor(.gray)
                    }
                    
                    Button(action: {
                        habits.buttonOpasity2 = 1.0
                    }, label: {
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(SettingsCustomColor.SettingsColorTwo)
                    })
                    
                    Button(action: {
                        habits.buttonOpasity2 = 0.3
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(SettingsCustomColor.SettingsColorTwo)
                    })
                }
                
                
                
                HStack{
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 5)
                            .frame(maxWidth: 250, maxHeight: 50)
                            .foregroundColor(SettingsCustomColor.SettingsColorOne)
                        
                        Text("Sleep Tracker")
                            .foregroundColor(.gray)
                    }
                    
                    Button(action: {
                        habits.buttonOpasity3 = 1.0
                    }, label: {
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(SettingsCustomColor.SettingsColorTwo)
                    })
                    
                    Button(action: {
                        habits.buttonOpasity3 = 0.3
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(SettingsCustomColor.SettingsColorTwo)
                    })
                }
                
                HStack{
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 5)
                            .frame(maxWidth: 250, maxHeight: 50)
                            .foregroundColor(SettingsCustomColor.SettingsColorOne)
                        
                        Text("Exercise Tracker")
                            .foregroundColor(.gray)
                    }
                    
                    Button(action: {
                        habits.buttonOpasity4 = 1.0
                    }, label: {
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(SettingsCustomColor.SettingsColorTwo)
                        
                    })
                    
                    Button(action: {
                        habits.buttonOpasity4 = 0.3
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(SettingsCustomColor.SettingsColorTwo)
                    })
                }
            }
            .padding()
            
           Spacer()
            
        }
        .padding()
    }
}

struct SettingsCustomColor {
    static let SettingsColorOne = Color("SettingsColorOne")
    
    static let SettingsColorTwo = Color("SettingsColorTwo")
}
