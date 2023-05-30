//import SwiftUI
//
//struct HabitManager {
//    
//    func getHabit() -> Habits {
//        if let object = UserDefaults.standard.data(forKey: "habits") {
//            if let objectDecoded = try? JSONDecoder().decode(Habits.self, from: object) as Habits {
//                return objectDecoded
//            }
//        } else {
//            print("Decoding Failed")
//        }
//        return Habits()
//    }
//    
//    func setHabit(habits: Habits) {
//        if let encoded = try? JSONEncoder().encode(habits){
//            UserDefaults.standard.set(encoded, forKey: "habits")
//        } else {
//            print("Encoding Failed")
//        }
//    }
//    
//}

