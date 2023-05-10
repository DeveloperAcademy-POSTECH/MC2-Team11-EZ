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
    
    // MARK: - Function
    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        VStack {
            if value.day != -1 {
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }) {
                    
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .black : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    Circle()
                        .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .clear : .pink)
                        .frame(width: 8, height: 8)
                    
                } else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .black : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
            }
        }
        .padding(.vertical, 9)
        .frame(height: 60, alignment: .top)
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func extractDate() -> [DateValue]{
        
        let calendar = Calendar.current
        // Getting Current Month Date
        let currentMonth = getCurrentMonth()
        var days =  currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
            
        }
        
        // adding offset days to exact week day...
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
    
    func getCurrentMonth() -> Date {
        
        let calendar = Calendar.current
        // Getting Current Month Date
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        
        return currentMonth
    }
    
    func extraData() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 35) {
            
            // Days..
            let days: [String]  = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(extraData()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text(extraData()[1])
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
                        currentMonth += 1
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
                    CardView(value: value)
                        .background(

                            Capsule()
                                .fill((currentDate.addingTimeInterval(-6 * 24 * 60 * 60)..<currentDate).contains(value.date) ? .pink : isSameDay(date1: value.date, date2: currentDate) ? .pink : .clear )
                                .padding(.horizontal, 8)
                    
                    )
                   
                        .onTapGesture {
                            currentDate = value.date
                    }
                }
            }.animation(.easeIn(duration: 0.5), value: currentDate)
            
            VStack(spacing: 20) {
                
                Text("Tasks")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: currentDate)
                }) {
                    
                    ForEach(task.task) { task
                        in VStack(alignment: .leading, spacing: 10) {
                            Text(task.time
                                .addingTimeInterval(CGFloat
                                    .random(in:0...5000)), style: .time)
                            
                            Text(task.title)
                                .font(.title2.bold())
                            }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                else {
                    Text("No task Found")
                }
            }
            .padding()
            .padding(.top, 20)
            
        } //: Vstack
        .onChange(of: currentMonth) { newValue in
            // updating Month
            currentDate = getCurrentMonth()
        }
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
        let range = calendar.range(of: .day, in: .month, for: startDate)!
   
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
