//
//  RecordList.swift
//  EZ.Apple
//
//  Created by seunghoria on 2023/05/11.
//

import SwiftUI

struct RecordList: View {
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading, spacing: 0){
                Text("4.23")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color("ColorGray100"))
                    .padding(.bottom, 16)
                
                RecordBox()
                    .border(.green)
            }
            .padding(.horizontal, 20)
            .border(.blue)
            
            VStack(alignment: .leading, spacing: 0){
                Text("4.24")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color("ColorGray100"))
                    .padding(.bottom, 16)
                
                RecordBox()
                    .border(.green)
                    .padding(.bottom, 12)
                RecordBox()
                    .border(.green)
                
                RecordBox()
                    .border(.green)
            }
            .padding(.horizontal, 20)
            .border(.blue)
                
            
        }
    }
}

struct RecordList_Previews: PreviewProvider {
    static var previews: some View {
        RecordList()
    }
}
