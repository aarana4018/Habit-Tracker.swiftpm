import SwiftUI

struct CalendarView: View {
    @State var selectedDate: Date = Date()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Image("CalendarTitle")
                    .resizable()
                    .frame(width: 530, height: 320)
                
                Spacer()
                
                NavigationLink("\(selectedDate.formatted(date: .abbreviated, time: .omitted))") {
                    DateView()  
                } 
                .font(.system(size: 28))
                .foregroundColor(CalendarCustomColor.CalendarColorOne)
                .padding()
                .animation(.spring(), value: selectedDate)
                .frame(width: 500)
                
                Divider().frame(height: 1)
                
                Spacer()
                
                DatePicker("Select Date", selection: $selectedDate, 
                           in: ...Date(), displayedComponents: .date)
                .datePickerStyle(.graphical)
                
                Spacer()
                
                Divider()
                
                Spacer()
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct CalendarCustomColor {
    static let CalendarColorOne = Color("CalendarColorOne")
}
