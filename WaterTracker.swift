import SwiftUI

struct WaterView: View {
    
    @State var WaterGoal: Double? = 0.0 
    @State var WaterIntake = 0.0
    @State var WaterFill = 0.0
    @State var RestatedWaterGoal = "Your Goal Here"
    
    @State var CloudOne = "cloud"
    @State var CloudTwo = "cloud"
    @State var CloudThree = "cloud"
    @State var CloudFour = "cloud"
    
    
    var body: some View {
        
        VStack {
            
//            Slider(value: $WaterIntake, in: 0...(WaterGoal ?? 72.0), step: 1)
            
            HStack {
                
                TextField("Your Goal", value: $WaterGoal, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        RestatedWaterGoal = "\(WaterGoal ?? 72)"
                    }
                
                Text(RestatedWaterGoal)
            }
            .padding()
            
        }
        .padding()
        
    }
}
