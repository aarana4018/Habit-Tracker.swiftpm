import SwiftUI

struct ExcerciseView: View {
    
    @State var ExerciseGoalInput: Double? = 0.0 
    @State var ExerciseGoal: Double = 0.0
    @State var ExerciseIntake: Double = 0.0
    @State var ExerciseFill = 0.0
    @State var RestatedExerciseGoal = "Your Goal Here"
    @State var ExerciseToggle: Bool = false
    
    @State var ExerciseSentence = ""
    @State var ExerciseInfoSentence = ""
    
    @State var RunMan = "figure.run"
    @State var Distance: CGFloat = 5.0
    
    var body: some View {
        
        VStack (spacing: 0) {
            
//            Image("WaterTitle")
//                .resizable()
//                .frame(width: 500, height: 290)
            
            HStack (alignment: .bottom, spacing: 0) {
                
                Rectangle()
                    .frame(width: Distance, height: 5, alignment: .center)
                    .foregroundColor(.gray)
                    .opacity(0.5)
                    
                
                Image(systemName: RunMan)
                    .font(.system(size: 50))
                    .foregroundColor(.green)
                    .opacity(0.5)
            }
            
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
                
                if ExerciseIntake / ExerciseGoal < 0.25 {
                    ExerciseFill = 0
                    
                    Distance = 5.0
                }
                
                if ExerciseIntake / ExerciseGoal >= 0.25 {
                    ExerciseFill = 150
                    
                } else {
                    
                    Distance = 5.0
                    
                    ExerciseSentence = ""
                }
                
                if ExerciseIntake / ExerciseGoal >= 0.5 {
                    ExerciseFill = 300
                    
                    Distance = 100.0
                    
                } else {
                    
                    Distance = 10.0
                    
                    ExerciseSentence = ""
                    
                }
                
                if ExerciseIntake / ExerciseGoal >= 0.75 {
                    ExerciseFill = 450
                    
                    Distance = 300.0
                    
                } else {
                    
                    Distance = 100.0
                    
                    ExerciseSentence = ""
                    
                } 
                
                if ExerciseIntake / ExerciseGoal >= 1 {
                    ExerciseFill = 600
                    
                    Distance = 500.0
                    
                    ExerciseSentence = "Congrats! You met your exercise goal!"
//                } if else ExerciseIntake / ExerciseGoal >= 0.75 {
//                    
//                    Distance = 300.0
//                    
//                    ExerciseSentence = ""
//                    
//                } if else ExerciseIntake / ExerciseGoal >= 0.5 {
//                    
//                    Distance = 100.0
//                    
//                    ExerciseSentence = ""
//                    
//                } if else ExerciseIntake / ExerciseGoal >= 0.25 {
//                    
//                    Distance = 50.0
//                    
//                    ExerciseSentence = ""
                    
                } else {
                    
                    Distance = 5.0
                    
                    ExerciseSentence = ""
                    
                }
            }
            .tint(Color.green.opacity(0.5)) 
            
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
                    }
                
                Text("\(RestatedExerciseGoal) minutes")
                    .font(.system(size: 30))
                    .foregroundColor(.green.opacity(0.3))
            }
            .padding()
            
            Text(ExerciseInfoSentence)
                .multilineTextAlignment(.center)
                .font(.system(size: 20))
                .foregroundColor(.green.opacity(0.3))
        }
        .padding()
    }
}

