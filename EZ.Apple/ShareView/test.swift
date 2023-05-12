//
//  test.swift
//  EZ.Apple
//
//  Created by YouiHyon Kim on 2023/05/09.
//

import SwiftUI

struct test: View {
    @StateObject var dateFormat = DateFormat()
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var statements = [Statement]()



    let persistenceController = PersistenceController.coreDm

    var body: some View {
        VStack {
//            List {
//                ForEach(statements, id: \.self) { statement in
//                    let _ = print(statement)
//
//                    Text(statement.state_number ?? "")
//                    Text(statement.state_description ?? "")
//                }
//            }
            ScrollView {
                VStack {
                    
                    
                    DatePicker("Start Date", selection: $startDate, displayedComponents: [.date])
                        .datePickerStyle(GraphicalDatePickerStyle())

                    
                    
                    DatePicker("End Date", selection: $endDate, in: startDate..., displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(GraphicalDatePickerStyle())

                    
                    

                    Button(action: {
                        let statements = persistenceController.fetchStatementForDate(startDate: startDate, endDate: endDate)
                        self.statements = statements
                    }, label: {
                        Text("나와라 데이터!")
                    })

                    List {
                        ForEach(statements, id: \.self) { statement in
                            let _ = print(statement)
                            Text(statement.state_number ?? "")
                            Text(statement.state_description ?? "")
                        }
                    }
                }
            }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
