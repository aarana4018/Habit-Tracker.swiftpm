import SwiftUI

struct SettingsView: View {
    
     @EnvironmentObject var habits: Habits
    
    @State var SetHabit1 = "Your Habit Here"
    @State var SetHabit2 = "Your Habit Here"
    @State var SetHabit3 = "Your Habit Here"
    @State var SetHabit4 = "Your Habit Here"
    
    var body: some View {
        
        VStack (spacing: 0) {
            
            VStack (spacing: 0) {
                
                Image("SettingsTitle")
                    .resizable()
                    .frame(width: 500, height: 290)
                
                Text("Set Your Habits:")
                    .foregroundColor(.pink)
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
                        .foregroundColor(.pink)
                    
                    Text("\(SetHabit1)")
                        .padding()
                        .foregroundColor(.pink)
                    
                }
                
                HStack{
                    
                    TextField("", text: $habits.Habit2)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .onSubmit {
                            SetHabit2 = habits.Habit2
                        }
                        .foregroundColor(.pink)
                    
                    Text("\(SetHabit2)")
                        .padding()
                        .foregroundColor(.pink)
                    
                }
                
                HStack{
                    
                    TextField("", text: $habits.Habit3)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .onSubmit {
                            SetHabit3 = habits.Habit3
                        }
                    
                    Text("\(SetHabit3)")
                        .padding()
                        .foregroundColor(.pink)
                    
                }
                
                HStack{
                    
                    TextField("", text: $habits.Habit4)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .onSubmit {
                            SetHabit4 = habits.Habit4
                        }
                    
                    Text("\(SetHabit4)")
                        .padding()
                        .foregroundColor(.pink)
                    
                }
            }
            
                        
            Divider()
                .frame(width: 400, height: 20)
            
            Text("Remove a Tracker:")
                .font(.title)
                .foregroundColor(.pink)
            
            Divider()
                .frame(width: 400, height: 20)
            
            VStack {
                
                HStack{
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 5)
                            .frame(maxWidth: 250, maxHeight: 50)
                            .foregroundColor(.pink)
                            .opacity(0.5)
                        
                        Text("Habit Tracker")
                            .foregroundColor(.gray)
                    }
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(.pink)
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(.pink)
                    })
                }
                
                
                
                HStack {
                    
                    ZStack{ 
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 5)
                            .frame(maxWidth: 250, maxHeight: 50)
                            .foregroundColor(.pink)
                            .opacity(0.5)
                        
                        Text("Water Tracker")
                            .foregroundColor(.gray)
                    }
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(.pink)
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(.pink)
                    })
                }
                
                
                
                HStack{
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 5)
                            .frame(maxWidth: 250, maxHeight: 50)
                            .foregroundColor(.pink)
                            .opacity(0.5)
                        
                        Text("Sleep Tracker")
                            .foregroundColor(.gray)
                    }
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(.pink)
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(.pink)
                    })
                }
                
                HStack{
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 5)
                            .frame(maxWidth: 250, maxHeight: 50)
                            .foregroundColor(.pink)
                            .opacity(0.5)
                        
                        Text("Exercise Tracker")
                            .foregroundColor(.gray)
                    }
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(.pink)
                        
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .foregroundColor(.pink)
                    })
                }
            }
        }
    }
}

