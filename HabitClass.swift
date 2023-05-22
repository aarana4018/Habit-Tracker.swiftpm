import SwiftUI

class Habits: ObservableObject {
    @Published var Habit1 = ""
    @Published var Habit2 = ""
    @Published var Habit3 = ""
    @Published var Habit4 = ""
    
    @Published var buttonOpasity1 = 1.0
    @Published var buttonOpasity2 = 1.0
    @Published var buttonOpasity3 = 1.0
    @Published var buttonOpasity4 = 1.0
    
//    enum CodingKeys: CodingKey {
//        case Habits
//    }
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        Habits = try container.decode(String.self, forKey: .Habits)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(Habits, forKey: .Habits)
//    }
}


