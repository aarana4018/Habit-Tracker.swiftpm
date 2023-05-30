import SwiftUI

struct CalendarView: View {
    @State var selectedDate: Date = Date()
    
    var body: some View {
        
        NavigationView{
            
            VStack {
                
                NavigationLink("\(selectedDate.formatted(date: .abbreviated, time: .omitted))") {
                    DateView()  
                } 
                .font(.system(size: 28))
                .foregroundColor(.cyan)
                .padding()
                .animation(.spring(), value: selectedDate)
                .frame(width: 500)
                
                Divider().frame(height: 1)
                
                DatePicker("Select Date", selection: $selectedDate, 
                           in: ...Date(), displayedComponents: .date)
                .datePickerStyle(.graphical)
                
                Divider()
            }
        }
        
                
    }
}


