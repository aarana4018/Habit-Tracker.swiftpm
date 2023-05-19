import SwiftUI

struct ExcerciseView: View {
    
    @AppStorage("ExerciseGoalInput") var ExerciseGoalInput: Double?
    
    @AppStorage("ExerciseGoal") var ExerciseGoal: Double = 0.0
    @AppStorage("ExerciseIntake") var ExerciseIntake: Double = 0.0
    @AppStorage("ExerciseFill") var ExerciseFill = 0.0
    @AppStorage("RestatedExerciseGoal") var RestatedExerciseGoal: String = "Your Goal Here"
    @AppStorage("ExerciseToggle") var ExerciseToggle: Bool = false
    
    @AppStorage("ExerciseSentence") var ExerciseSentence: String = ""
    @AppStorage("ExerciseInfoSentence") var ExerciseInfoSentence: String = ""
    
//    @AppStorage("Distance") var Distance: CGFloat = 10.0
    
    @State var Distance: CGFloat = 10.0
    
    @AppStorage("minutes") var minutes: String = ""
    
    var body: some View {
        
        VStack (spacing: 0) {
            
            Image("ExerciseTitle")
                .resizable()
                .frame(width: 530, height: 320)
           
            Spacer()
                
                HStack (alignment: .bottom, spacing: 0) {
                    
                    Rectangle()
                        .frame(width: Distance, height: 10, alignment: .center)
                        .foregroundColor(.gray)
                        .opacity(0.3)
                    
                    
                    
                    Image(systemName: "figure.run")
                        .font(.system(size: 70))
                        .foregroundColor(.green)
                        .opacity(0.5)
                }
                .frame(minWidth: 10, maxWidth: .infinity, minHeight: 10, maxHeight: 60, alignment: .leading)
                .padding()
            
            
            VStack {
                
                Text(ExerciseSentence)
                    .font(.system(size: 30))
                    .foregroundColor(.gray.opacity(0.5))
                
                ZStack (alignment: .leading) {
                    
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.green.opacity(0.4))
                        .frame(width: ExerciseFill, height: 100, alignment: .leading)
                    
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(.green.opacity(0.5), lineWidth: 10)
                        .frame(width: 600, height: 100, alignment: .leading)
                }
            }
            .padding()
            
            Text("\(ExerciseIntake, specifier: "%.0f")")
                .font(.system(size: 30))
                .foregroundColor(.green.opacity(0.5))
            
            Slider(
                value: $ExerciseIntake, 
                in: 0...ExerciseGoal
            ) { 
                Text("Exercise Intake") 
            } minimumValueLabel: {
                Text("0")
                    .foregroundColor(.green.opacity(0.5))
            } maximumValueLabel: {
                Text("\(ExerciseGoal, specifier: "%.0f")")
                    .foregroundColor(.green.opacity(0.5))
            } onEditingChanged: { editing in
                
                if ExerciseIntake / ExerciseGoal >= 1 {
                    ExerciseFill = 600
                    
                    Distance = 725.0
                    
                    ExerciseSentence = "Congrats! You met your exercise goal!"
                } else if ExerciseIntake / ExerciseGoal >= 0.75 {
                    ExerciseFill = 450
                    
                    Distance = 520.0
                    
                    ExerciseSentence = ""
                    
                } else if ExerciseIntake / ExerciseGoal >= 0.5 {
                    ExerciseFill = 300
                    
                    Distance = 370.0
                    
                    ExerciseSentence = ""
                    
                } else if ExerciseIntake / ExerciseGoal >= 0.25 {
                    ExerciseFill = 150
                    
                    Distance = 220.0
                    
                    ExerciseSentence = ""
                    
                } else {
                    ExerciseFill = 0
                    
                    Distance = 10.0
                    
                    ExerciseSentence = ""
                    
                }
            }
            .tint(Color.green.opacity(0.5)) 
            .padding()
            
            HStack {
                
                Text("Set Your Goal:")
                    .font(.system(size: 30))
                    .foregroundColor(.gray.opacity(0.5))
                
                Button(action: {
                    
                    ExerciseInfoSentence = "It is recommended to get at least 30 minutes of exercise a day!"
                    
                    ExerciseToggle.toggle()
                    
                    if ExerciseToggle == false {
                        
                        ExerciseInfoSentence = ""
                    }
                    
                }, label: {
                    Image(systemName: "info.circle")
                })
                .font(.system(size: 25))
                .foregroundColor(.gray.opacity(0.5))
            }
            
            HStack {
                
                TextField("Your Goal", value: $ExerciseGoalInput, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        RestatedExerciseGoal = "\(ExerciseGoalInput ?? 15)"
                        
                        ExerciseGoal = ExerciseGoalInput ?? 15
                        
                         minutes = "minutes"
                    }
                
                Text(RestatedExerciseGoal + " " + minutes)
                    .font(.system(size: 30))
                    .foregroundColor(.green.opacity(0.3))
            }
            .padding()
            
            Text(ExerciseInfoSentence)
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .foregroundColor(.green.opacity(0.3))
            
            Spacer()
            
        }
        .padding()
    }
}

