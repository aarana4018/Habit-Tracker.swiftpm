import SwiftUI

struct WaterView: View {
    
    @AppStorage("WaterGoalInput") var WaterGoalInput: Double? 
    
    @AppStorage("WaterGoal") var WaterGoal: Double = 0.0
    @AppStorage("WaterIntake") var WaterIntake: Double = 0.0
    @AppStorage("WaterFill") var WaterFill: Double = 0.0
    @AppStorage("RestatedWaterGoal") var RestatedWaterGoal: String = "Your Goal Here"
    @AppStorage("WaterToggle") var WaterToggle: Bool = false
    
    @AppStorage("WaterSentence") var WaterSentence: String = ""
    @AppStorage("WaterInfoSentence") var WaterInfoSentence: String = ""
    
    @AppStorage("CloudOne") var CloudOne: String = "cloud"
    @AppStorage("CloudTwo") var CloudTwo: String = "cloud"
    @AppStorage("CloudThree") var CloudThree: String = "cloud"
    @AppStorage("CloudFour") var CloudFour: String = "cloud"
    
    
    var body: some View {
        
        VStack (spacing: 0) {
            
            Image("WaterTitle")
                .resizable()
                .frame(width: 500, height: 290)
            
            Spacer()
            
            HStack (spacing: 10) {
                
                VStack{
                    Image(systemName: CloudOne)
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                        .opacity(0.8)
                }
                .frame(width: 90, height: 200, alignment: .bottom)
                
                VStack{
                    Image(systemName: CloudTwo)
                        .font(.system(size: 80))
                        .foregroundColor(.gray)
                        .opacity(0.6)
                }
                .frame(width: 50, height: 40, alignment: .top)
                
                VStack{
                    Image(systemName: CloudThree)
                        .font(.system(size: 100))
                        .foregroundColor(.gray)
                        .opacity(0.4)
                }
                .frame(width: 140, height: 140, alignment: .top)
                
                VStack {
                    Image(systemName: CloudFour)
                        .font(.system(size: 150))
                        .foregroundColor(.gray)
                        .opacity(0.2)
                }
                .frame(width: 150, height: 220, alignment: .top)
                
            }
            
            VStack {
                
                
                Text(WaterSentence)
                    .font(.system(size: 30))
                    .foregroundColor(.gray.opacity(0.5))
                
                ZStack (alignment: .leading) {
                    
                    RoundedRectangle(cornerRadius: 30)
                        .fill(WaterCustomColor.WaterColorTwo)
                        .frame(width: WaterFill, height: 100, alignment: .leading)
                    
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(WaterCustomColor.WaterColorThree, lineWidth: 10)
                        .frame(width: 600, height: 100, alignment: .leading)
                    
                }
            }
            
            Text("\(WaterIntake, specifier: "%.0f")")
                .font(.system(size: 30))
                .foregroundColor(WaterCustomColor.WaterColorThree)
            
            Slider(
                value: $WaterIntake, 
                in: 0...WaterGoal
            ) { 
                Text("Water Intake") 
            } minimumValueLabel: {
                Text("0")
                    .foregroundColor(WaterCustomColor.WaterColorTwo)
            } maximumValueLabel: {
                Text("\(WaterGoal, specifier: "%.0f")")
                .foregroundColor(WaterCustomColor.WaterColorTwo)
            } onEditingChanged: { editing in
                
                if WaterIntake / WaterGoal < 0.25 {
                    WaterFill = 0
        
                    CloudOne = "cloud"
                }
                
                if WaterIntake / WaterGoal >= 0.25 {
                    WaterFill = 150
                    
                    CloudOne = "cloud.fill"
                    
                } else {
                    CloudOne = "cloud"
                    
                    WaterSentence = ""
                }
                
                if WaterIntake / WaterGoal >= 0.5 {
                    WaterFill = 300
                    
                    CloudTwo = "cloud.drizzle.fill"
                } else {
                    CloudTwo = "cloud"
                 
                    WaterSentence = ""
                    
                }
                
                if WaterIntake / WaterGoal >= 0.75 {
                    WaterFill = 450
                    
                    CloudThree = "cloud.rain.fill"
                } else {
                    CloudThree = "cloud"
                    
                    WaterSentence = ""
                    
                } 
                
                if WaterIntake / WaterGoal >= 1 {
                    WaterFill = 600
                    
                    CloudFour = "cloud.heavyrain.fill"
                    
                    WaterSentence = "Congrats! You met your water goal!"
                } else {
                    CloudFour = "cloud"
                    
                    WaterSentence = ""
                    
                }
            }
            .tint(WaterCustomColor.WaterColorThree)
            
            HStack {
                
                Text("Set Your Goal:")
                    .font(.system(size: 30))
                    .foregroundColor(.gray.opacity(0.5))
                
                Button(action: {
                    
                    WaterInfoSentence = "Reach your recommended water intake by drinking half your weight (in pounds) in ounces!"
                    
                    WaterToggle.toggle()
                    
                    if WaterToggle == false {
                        
                        WaterInfoSentence = ""
                        
                    }
                }, label: {
                    Image(systemName: "info.circle")
                })
                .font(.system(size: 25))
                .foregroundColor(.gray.opacity(0.5))
            }
            
            
            HStack {
                
                TextField("Your Goal", value: $WaterGoalInput, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        RestatedWaterGoal = "\(WaterGoalInput ?? 72)"
                        
                        WaterGoal = WaterGoalInput ?? 72
                    }
                
                Text(RestatedWaterGoal)
                    .font(.system(size: 30))
                    .foregroundColor(WaterCustomColor.WaterColorTwo)
            }
            .padding()
            
            Text(WaterInfoSentence)
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .foregroundColor(WaterCustomColor.WaterColorTwo)
          
            Spacer()
            
        }
        .padding()
        
    }
}

struct WaterCustomColor {
    static let WaterColorOne = Color("WaterColorOne")
    
    static let WaterColorTwo = Color("WaterColorTwo")
    
    static let WaterColorThree = Color("WaterColorThree")
    
    static let WaterColorFour = Color("WaterColorFour")
}
