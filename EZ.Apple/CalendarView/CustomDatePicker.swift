//
//  CustomDatePicker.swift
//  EZ.Apple
//
//  Created by Herry on 2023/05/09.
//

import SwiftUI

struct CustomDatePicker: View {
    
    // MARK: - Properties
    @Binding var currentDate: Date
    @State var currentMonth: Int = 0
    
    func extractDate() -> [DateValue]{
        
        let calendar = Calendar.current
        
        // Getting Current Month Date
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return []
         }
        
         return currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
            
        }
    }
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 35) {
            
            // Days..
            let days: [String]  = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("2021")
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text("September")
                        .font(.title.bold())
                } //: Vstack
                Spacer(minLength: 0)
                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }


            } //: Hstack
            .padding(.horizontal)
            
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in
                    
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            } //: Hstack
     
            
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(extractDate()) { value in
                    Text("\(value.day)")
                        .font(.title3.bold())
                }
            }
        } //: Vstack
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePicker(currentDate: .constant(Date()))
    }
}


//Extending Date to get Current Month Dates...
extension Date {
    func getAllDates() -> [Date] {
        
        let calendar = Calendar.current
        
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        var range = calendar.range(of: .day, in: .month, for: startDate)!
        range.removeLast()
        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day == 1 ? 0 : day, to: startDate)!
        }
    }
}
