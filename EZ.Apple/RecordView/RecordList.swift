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
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 0){
                ForEach(statements, id: \.self) { statement in

                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .foregroundColor(.white)
                        
                        .overlay{
                            HStack(spacing: 0) {
                                Rectangle()
                                    .frame(maxWidth: 100)
                                    .frame(height: 100)
                                    .cornerRadius(24)
                                    .foregroundColor(.white)
                                    .opacity(0.3)
                                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                                    .overlay{
                                        VStack(spacing: 0){
                                            ZStack {
                                                
                                                Image(statement.state_image ?? "")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 54)
                                                    .padding(.bottom, 10)
                                                    .blur(radius: 20)
                                                
                                                Image(statement.state_image ?? "")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 54)
                                                    .padding(.bottom, 10)
                                                
                                            }
                                            Text(statement.state_number ?? "")
                                                .font(.system(size: 12))
                                                .fontWeight(.black)
                                        }
                                        
                                    }
                                    .padding(.trailing, 16)
                                
                                
                                VStack(spacing: 0){
                                    Text(statement.state_message ?? "")
                                        .font(.system(size: 16, weight: .bold))
                                        .padding(.bottom, 10)
                                        .frame(maxWidth: 221, alignment: .leading)
                                    
                                    Text(statement.state_description ?? "")
                                        .font(.system(size: 14))
                                        .foregroundColor(Color("ColorGray100"))
                                        .frame(maxWidth: 221, alignment: .leading)
                                    
                                }
                                
                                
                            }
                            .frame(alignment: .leading)
                        }
                        .padding(30)
                }
            }
        }
    }
}


struct RecordList_Previews: PreviewProvider {
    static var previews: some View {
        RecordList(selectedDate: .constant(Date()), pastWeekDate:.constant(Date()), statements: .constant([Statement]()))
    }
}
