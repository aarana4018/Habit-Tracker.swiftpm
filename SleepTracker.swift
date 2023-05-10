
import SwiftUI

struct SleepView: View {
    
    @State var SleepGoalInput: Double? = 0.0 
    @State var SleepGoal: Double = 0.0
    @State var SleepIntake: Double = 0.0
    @State var SleepFill = 0.0
    @State var RestatedSleepGoal = "Your Goal Here"
    @State var SleepToggle: Bool = false
    
    @State var SleepSentence = ""
    @State var SleepInfoSentence = ""
    
    @State var ZOne: Color = .gray
    @State var ZTwo: Color = .gray
    @State var ZThree: Color = .gray
    @State var ZFour: Color = .gray
    
    
    var body: some View {
        
        VStack (spacing: 0) {
            
            Image("SleepTitle")
                .resizable()
                .frame(width: 500, height: 290)
            
            HStack (spacing: 10) {
                
                VStack{
                    Image(systemName: "zzz")
                        .font(.system(size: 50))
                        .foregroundColor(ZOne)
                        .opacity(0.8)
                }
                .frame(width: 90, height: 200, alignment: .bottom)
                
                VStack{
                    Image(systemName: "zzz")
                        .font(.system(size: 80))
                        .foregroundColor(ZTwo)
                        .opacity(0.6)
                }
                .frame(width: 50, height: 40, alignment: .top)
                
                VStack{
                    Image(systemName: "zzz")
                        .font(.system(size: 100))
                        .foregroundColor(ZThree)
                        .opacity(0.4)
                }
                .frame(width: 140, height: 140, alignment: .top)
                
                VStack {
                    Image(systemName: "zzz")
                        .font(.system(size: 150))
                        .foregroundColor(ZFour)
                        .opacity(0.2)
                }
                .frame(width: 150, height: 220, alignment: .top)
                
            }
            
            VStack {
                
                
                Text(SleepSentence)
                    .font(.system(size: 30))
                    .foregroundColor(.gray.opacity(0.5))
                
                ZStack (alignment: .leading) {
                    
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.blue.opacity(0.4))
                        .frame(width: SleepFill, height: 100, alignment: .leading)
                    
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(.blue.opacity(0.5), lineWidth: 10)
                        .frame(width: 600, height: 100, alignment: .leading)
                    
                }
            }
            
            Text("\(SleepIntake, specifier: "%.0f")")
                .font(.system(size: 30))
                .foregroundColor(.purple.opacity(0.5))
            
            Slider(
                value: $SleepIntake, 
                in: 0...SleepGoal
            ) { 
                Text("Sleep Intake") 
            } minimumValueLabel: {
                Text("0")
                    .foregroundColor(.purple.opacity(0.5))
            } maximumValueLabel: {
                Text("\(SleepGoal, specifier: "%.0f")")
                    .foregroundColor(.purple.opacity(0.5))
            } onEditingChanged: { editing in
                
                if SleepIntake / SleepGoal < 0.25 {
                    SleepFill = 0
                    
                    ZOne = .gray
                }
                
                if SleepIntake / SleepGoal >= 0.25 {
                    SleepFill = 150
                    
                    ZOne = .purple
                    
                } else {
                    ZOne = .gray
                    
                    SleepSentence = ""
                }
                
                if SleepIntake / SleepGoal >= 0.5 {
                    SleepFill = 300
                    
                    ZTwo = .purple
                } else {
                    ZTwo = .gray
                    
                    SleepSentence = ""
                    
                }
                
                if SleepIntake / SleepGoal >= 0.75 {
                    SleepFill = 450
                    
                    ZThree = .purple
                } else {
                    ZThree = .gray
                    
                    SleepSentence = ""
                    
                } 
                
                if SleepIntake / SleepGoal >= 1 {
                    SleepFill = 600
                    
                    ZFour = .purple
                    
                    SleepSentence = "Congrats! You met your water goal!"
                } else {
                    ZFour = .gray
                    
                    SleepSentence = ""
                    
                }
            }
            .tint(Color.purple.opacity(0.5)) 
            
            HStack {
                
                Text("Set Your Goal:")
                    .font(.system(size: 30))
                    .foregroundColor(.gray.opacity(0.5))
                
                Button(action: {
                    
                    SleepInfoSentence = "Reach your recommended water intake by drinking half your weight (in pounds) in ounces!"
                    
                    SleepToggle.toggle()
                    
                    if SleepToggle == false {
                        
                        SleepInfoSentence = ""
                        
                    }
                    
                }, label: {
                    Image(systemName: "info.circle")
                })
                .font(.system(size: 25))
                .foregroundColor(.gray.opacity(0.5))
            }
            
            
            HStack {
                
                TextField("Your Goal", value: $SleepGoalInput, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        RestatedSleepGoal = "\(SleepGoalInput ?? 8)"
                        
                        SleepGoal = SleepGoalInput ?? 8
                    }
                
                Text(RestatedSleepGoal)
                    .font(.system(size: 30))
                    .foregroundColor(.purple.opacity(0.3))
            }
            .padding()
            
            Text(SleepInfoSentence)
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .foregroundColor(.purple.opacity(0.3))
            
        }
        .padding()
        
    }
}
