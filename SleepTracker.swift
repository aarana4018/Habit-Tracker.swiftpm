
import SwiftUI

struct SleepView: View {
    
    @AppStorage("SleepGoalInput") var SleepGoalInput: Double?
    
    @AppStorage("SleepGoal") var SleepGoal: Double = 0.0
    @AppStorage("SleepIntake") var SleepIntake: Double = 0.0
    @AppStorage("SleepFill") var SleepFill: Double = 0.0
    @AppStorage("RestatedSleepGoal") var RestatedSleepGoal: String = "Your Goal Here"
    @AppStorage("SleepToggle") var SleepToggle: Bool = false
    
    @AppStorage("SleepSentence") var SleepSentence: String = ""
    @AppStorage("SleepInfoSentence") var SleepInfoSentence: String = ""

    @State var ZOne: Color = .gray
    @State var ZTwo: Color = .gray
    @State var ZThree: Color = .gray
    @State var ZFour: Color = .gray
    
//    @AppStorage("ZOne") var ZOne: Color = .gray
//    @AppStorage("ZTwo") var ZTwo: Color = .gray
//    @AppStorage("ZThree") var ZThree: Color = .gray
//    @AppStorage("ZFour") var ZFour: Color = .gray
    
    var body: some View {
        
        VStack (spacing: 0) {
            
            Image("SleepTitle")
                .resizable()
                .frame(width: 500, height: 290)
            
            Spacer()
            
            HStack (spacing: 10) {
                
                VStack {
                    Image(systemName: "bed.double.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                        .opacity(0.5)
                }
                .frame(width: 10, height: 200, alignment: .bottom)
                
                VStack{
                    Image(systemName: "zzz")
                        .font(.system(size: 50))
                        .foregroundColor(ZOne)
                        .opacity(0.2)
                }
                .frame(width: 90, height: 150, alignment: .bottom)
                
                VStack{
                    Image(systemName: "zzz")
                        .font(.system(size: 80))
                        .foregroundColor(ZTwo)
                        .opacity(0.4)
                }
                .frame(width: 30, height: 80, alignment: .top)
                
                VStack{
                    Image(systemName: "zzz")
                        .font(.system(size: 100))
                        .foregroundColor(ZThree)
                        .opacity(0.6)
                }
                .frame(width: 140, height: 160, alignment: .top)
                
                VStack {
                    Image(systemName: "zzz")
                        .font(.system(size: 125))
                        .foregroundColor(ZFour)
                        .opacity(0.8)
                }
                .frame(width: 70, height: 220, alignment: .top)
                
            }
            
            VStack {
                
                Text(SleepSentence)
                    .font(.system(size: 30))
                    .foregroundColor(.gray.opacity(0.5))
                
                ZStack (alignment: .leading) {
                    
                    RoundedRectangle(cornerRadius: 30)
                        .fill(SleepCustomColor.SleepColorTwo)
                        .frame(width: SleepFill, height: 100, alignment: .leading)
                    
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(SleepCustomColor.SleepColorOne, lineWidth: 10)
                        .frame(width: 600, height: 100, alignment: .leading)
                }
            }
            
            Text("\(SleepIntake, specifier: "%.0f")")
                .font(.system(size: 30))
                .foregroundColor(SleepCustomColor.SleepColorOne)
            
            Slider(
                value: $SleepIntake, 
                in: 0...SleepGoal
            ) { 
                Text("Sleep Intake") 
            } minimumValueLabel: {
                Text("0")
                    .foregroundColor(SleepCustomColor.SleepColorTwo)
            } maximumValueLabel: {
                Text("\(SleepGoal, specifier: "%.0f")")
                    .foregroundColor(SleepCustomColor.SleepColorTwo)
            } onEditingChanged: { editing in
                
                if SleepIntake / SleepGoal < 0.25 {
                    SleepFill = 0
                    
                    ZOne = .gray
                }
                
                if SleepIntake / SleepGoal >= 0.25 {
                    SleepFill = 150
                    
                    ZOne = SleepCustomColor.SleepColorOne
                    
                } else {
                    ZOne = .gray
                    
                    SleepSentence = ""
                }
                
                if SleepIntake / SleepGoal >= 0.5 {
                    SleepFill = 300
                    
                    ZTwo = SleepCustomColor.SleepColorOne
                } else {
                    ZTwo = .gray
                    
                    SleepSentence = ""
                    
                }
                
                if SleepIntake / SleepGoal >= 0.75 {
                    SleepFill = 450
                    
                    ZThree = SleepCustomColor.SleepColorOne
                } else {
                    ZThree = .gray
                    
                    SleepSentence = ""
                    
                } 
                
                if SleepIntake / SleepGoal >= 1 {
                    SleepFill = 600
                    
                    ZFour = SleepCustomColor.SleepColorOne
                    
                    SleepSentence = "Congrats! You met your sleep goal!"
                } else {
                    ZFour = .gray
                    
                    SleepSentence = ""
                    
                }
            }
            .tint(SleepCustomColor.SleepColorOne)
            
            HStack {
                
                Text("Set Your Goal:")
                    .font(.system(size: 30))
                    .foregroundColor(.gray.opacity(0.5))
                
                Button(action: {
                    
                    SleepInfoSentence = "It is recommended to get 9.25 hours of sleep every night, especially for students!"
                    
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
                    .foregroundColor(SleepCustomColor.SleepColorTwo)
            }
            .padding()
            
            Text(SleepInfoSentence)
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .foregroundColor(SleepCustomColor.SleepColorTwo)
            
            Spacer()
            
        }
        .padding()
        
    }
}
    
struct SleepCustomColor {
    static let SleepColorOne = Color("SleepColorOne")
    
    static let SleepColorTwo = Color("SleepColorTwo")
}
