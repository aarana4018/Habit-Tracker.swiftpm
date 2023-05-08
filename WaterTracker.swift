import SwiftUI

struct WaterView: View {
    
    @State var WaterGoalInput: Double? = 0.0 
    @State var WaterGoal: Double = 0.0
    @State var WaterIntake: Double = 0.0
    @State var WaterFill = 0.0
    @State var RestatedWaterGoal = "Your Goal Here"
    
    @State var sentence = ""
    
    @State var CloudOne = "cloud"
    @State var CloudTwo = "cloud"
    @State var CloudThree = "cloud"
    @State var CloudFour = "cloud"
    
    
    var body: some View {
        
        VStack {
            
            HStack {
                Image(systemName: CloudOne)
                    .font(.system(size: 50))
                    .foregroundColor(.gray)
                    .opacity(0.8)
                Image(systemName: CloudTwo)
                    .font(.system(size: 80))
                    .foregroundColor(.gray)
                    .opacity(0.6)
                Image(systemName: CloudThree)
                    .font(.system(size: 100))
                    .foregroundColor(.gray)
                    .opacity(0.4)
                Image(systemName: CloudFour)
                    .font(.system(size: 150))
                    .foregroundColor(.gray)
                    .opacity(0.2)
            }
                        
            
            Text(sentence)
            
            ZStack (alignment: .leading) {
                
                RoundedRectangle(cornerRadius: 30)
                    .fill(.blue.opacity(0.4))
                    .frame(width: WaterFill, height: 100, alignment: .leading)
                
                RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(.blue.opacity(0.7), lineWidth: 10)
                    .frame(width: 600, height: 100, alignment: .leading)
                    
            }
            
            Text("\(WaterIntake, specifier: "%.0f")")
            
            Slider(
                value: $WaterIntake, 
                in: 0...WaterGoal
            ) { 
                Text("Water Intake") 
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("\(WaterGoal, specifier: "%.0f")")
            } onEditingChanged: { editing in
                
                if WaterIntake / WaterGoal < 0.25 {
                    WaterFill = 0
                    
                    
                }
                
                if WaterIntake / WaterGoal >= 0.25 {
                    WaterFill = 150
                    
                    CloudOne = "cloud.fill"
                    
                }
                
                if WaterIntake / WaterGoal >= 0.5 {
                    WaterFill = 300
                    
                    CloudTwo = "cloud.drizzle.fill"
                }
                
                if WaterIntake / WaterGoal >= 0.75 {
                    WaterFill = 450
                    
                    CloudThree = "cloud.rain.fill"
                }
                
                if WaterIntake / WaterGoal >= 1 {
                    WaterFill = 600
                    
                    CloudFour = "cloud.heavyrain.fill"
                    
                    sentence = "Congrats! You met your water goal!"
                }
            }
                
            HStack {
                
                TextField("Your Goal", value: $WaterGoalInput, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        RestatedWaterGoal = "\(WaterGoalInput ?? 72)"
                        
                        WaterGoal = WaterGoalInput ?? 72
                    }
                
                Text(RestatedWaterGoal)
            }
            .padding()
            
        }
        .padding()
        
    }
}
