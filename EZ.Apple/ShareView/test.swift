//
//  test.swift
//  EZ.Apple
//
//  Created by YouiHyon Kim on 2023/05/09.
//

import SwiftUI

struct test: View {
    @StateObject var dateFormat = DateFormat()
    @State private var selectedDate = Date()
    @State private var pastWeekDate = Date()
    @Binding var startDateString: String
    @Binding var endDateString: String
    @State private var statements = [Statement]()

    let persistenceController = PersistenceController.coreDm

    var body: some View {
        VStack {
                        List {
                            ForEach(statements, id: \.self) { statement in
                                let _ = print(statement)
            
                                Text(statement.state_number ?? "")
                                Text(statement.state_description ?? "")
                                
                            }
                        }
            ScrollView {
                VStack {
                    DatePicker("Start Date", selection: $selectedDate, displayedComponents: [.date])
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .accentColor(Color("ColorGradient100"))
                        .onChange(of: selectedDate, perform: { value in
                            pastWeekDate = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: value)!
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "M.dd"
                            startDateString = dateFormatter.string(from: selectedDate)
                            endDateString = dateFormatter.string(from: pastWeekDate)
//                            dateFormatter.dateFormat = "dd"
//                            startDateString = dateFormatter.string(from: selectedDate)
//                            endDateString = dateFormatter.string(from: pastWeekDate)
                        })
                    
                    
                    Button(action: {
                        let statements = persistenceController.fetchStatementForDate(selectedDate: selectedDate, pastWeekDate: pastWeekDate)
                        self.statements = statements
                    }, label: {
                        Text("나와라 데이터!")
                    })

                
                }
            }
        }
    }
}


//struct test_Previews: PreviewProvider {
//    static var previews: some View {
//        test()
//    }
//}
