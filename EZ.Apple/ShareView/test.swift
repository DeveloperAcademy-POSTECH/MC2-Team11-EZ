//
//  test.swift
//  EZ.Apple
//
//  Created by YouiHyon Kim on 2023/05/09.
//

import SwiftUI

struct test: View {
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var statements = [Statement]() // statements 배열을 선언합니다.
    
    let persistenceController = PersistenceController.coreDm
    
    var body: some View {
        
        VStack {
            List {
                ForEach(statements, id: \.self) { statement in // 저장한 statements 배열을 사용합니다.
                    let _ = print(statement)

                        Text(statement.state_number ?? "")
                        Text(statement.state_description ?? "")
                    
//                    Text("hello")
                    

                }
            }
            ScrollView {
                VStack {
                    DatePicker("Start Date", selection: $startDate)
                        .datePickerStyle(GraphicalDatePickerStyle())
                    
                    
                    let _ = print("\(startDate) 안녕")
                    DatePicker("End Date", selection: $endDate)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        
                    
                    Button(action: {
                        let statements = persistenceController.fetchStatementForDate(startDate: startDate, endDate: endDate)
                        print(statements)
                        self.statements = statements // statements를 선언해준 뒤 해당 값을 저장해줍니다.
                    }, label: {
                        Text("나와라 데이터!")
                    })
                    
                    // Statements List
                    List {
                        ForEach(statements, id: \.self) { statement in // 저장한 statements 배열을 사용합니다.
                            let _ = print(statement)
    //                        Text(statement.state_message ?? "")
                            
                            Text("hello")
                            

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
