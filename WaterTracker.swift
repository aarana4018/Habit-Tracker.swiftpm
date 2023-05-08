import SwiftUI

struct WaterView: View {
    
    @State var WaterGoalInput: Double? = 0.0 
    @State var WaterGoal: Double = 0.0
    @State var WaterIntake: Double = 0.0
    @State var WaterFill = 0.0
    @State var RestatedWaterGoal = "Your Goal Here"
    @State var toggle: Bool = false
    
    @State var sentence = ""
    @State var infoSentence = ""
    
    @State var CloudOne = "cloud"
    @State var CloudTwo = "cloud"
    @State var CloudThree = "cloud"
    @State var CloudFour = "cloud"
    
    
    var body: some View {
        
        VStack (spacing: 0) {
            
            Image("WaterTitle")
                .resizable()
                .frame(width: 500, height: 290)
            
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
                
                
                Text(sentence)
                    .font(.system(size: 30))
                    .foregroundColor(.gray.opacity(0.5))
                
                ZStack (alignment: .leading) {
                    
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.blue.opacity(0.4))
                        .frame(width: WaterFill, height: 100, alignment: .leading)
                    
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(.blue.opacity(0.5), lineWidth: 10)
                        .frame(width: 600, height: 100, alignment: .leading)
                    
                }
            }
            
            Text("\(WaterIntake, specifier: "%.0f")")
                .font(.system(size: 30))
                .foregroundColor(.blue.opacity(0.5))
            
            Slider(
                value: $WaterIntake, 
                in: 0...WaterGoal
            ) { 
                Text("Water Intake") 
            } minimumValueLabel: {
                Text("0")
                    .foregroundColor(.blue.opacity(0.5))
            } maximumValueLabel: {
                Text("\(WaterGoal, specifier: "%.0f")")
                .foregroundColor(.blue.opacity(0.5))
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
                    
                    sentence = ""
                }
                
                if WaterIntake / WaterGoal >= 0.5 {
                    WaterFill = 300
                    
                    CloudTwo = "cloud.drizzle.fill"
                } else {
                    CloudTwo = "cloud"
                 
                    sentence = ""
                    
                }
                
                if WaterIntake / WaterGoal >= 0.75 {
                    WaterFill = 450
                    
                    CloudThree = "cloud.rain.fill"
                } else {
                    CloudThree = "cloud"
                    
                    sentence = ""
                    
                } 
                
                if WaterIntake / WaterGoal >= 1 {
                    WaterFill = 600
                    
                    CloudFour = "cloud.heavyrain.fill"
                    
                    sentence = "Congrats! You met your water goal!"
                } else {
                    CloudFour = "cloud"
                    
                    sentence = ""
                    
                }
            }
            .tint(Color.blue.opacity(0.5)) 
            
            HStack {
                
                Text("Set Your Goal:")
                    .font(.system(size: 30))
                    .foregroundColor(.gray.opacity(0.5))
                
                Button(action: {
                    
                    infoSentence = "Reach your recommended water intake by drinking half your weight (in pounds) in ounces!"
                    
                    toggle.toggle()
                    
                    if toggle == false {
                        
                        infoSentence = ""
                        
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
                    .foregroundColor(.blue.opacity(0.3))
            }
            .padding()
            
            Text(infoSentence)
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .foregroundColor(.blue.opacity(0.3))
            
        }
        .padding()
        
    }
}
