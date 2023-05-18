import SwiftUI

class Habits: ObservableObject{
    @Published var Habit1 = ""
    @Published var Habit2 = ""
    @Published var Habit3 = ""
    @Published var Habit4 = ""
    
    @Published var buttonOpasity1 = 1.0
    @Published var buttonOpasity2 = 1.0
    @Published var buttonOpasity3 = 1.0
    @Published var buttonOpasity4 = 1.0
}
