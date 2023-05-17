//
//  RecordList.swift
//  EZ.Apple
//
//  Created by seunghoria on 2023/05/11.
//

import SwiftUI

struct RecordList: View {
    @Binding var selectedDate : Date
    @Binding var pastWeekDate : Date
    @Binding var statements : [Statement]
    @State var isPresented : Bool = false
    @State var selectedItem: Statement? = nil

    
    var groupedData: [String: [Statement]] {
        Dictionary(grouping: statements, by: { (statement) -> String in
            guard let createdAt = statement.created_at else { return "" }
            let formatter = DateFormatter()
            formatter.dateFormat = "M.dd"
            return formatter.string(from: createdAt)
        })
    }
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading ,spacing: 0){
            ForEach(groupedData.keys.sorted(), id: \.self) { key in
                let item = groupedData[key]!
                Text("\(key)")
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("ColorGray200"))
                    .padding(.top, 20)
                    .padding(.leading, 30)
                    .padding(.bottom, 10)
                
                ForEach(item) { subItem in
                    RecordBox(subItem: subItem)
                }
            }
        }
        }  .background(Color.clear)
            .listStyle(PlainListStyle()) // 리스트 스타일 변경
    }
}

struct RecordList_Previews: PreviewProvider {
    static var previews: some View {
        RecordList(selectedDate: .constant(Date()), pastWeekDate:.constant(Date()), statements: .constant([Statement]()))
    }
}
