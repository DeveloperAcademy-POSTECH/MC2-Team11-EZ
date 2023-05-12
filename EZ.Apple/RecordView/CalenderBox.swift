//
//  CalenderBox.swift
//  EZ.Apple
//
//  Created by seunghoria on 2023/05/11.
//

import SwiftUI

struct CalenderBox: View {

    //@Binding var recordShow : Bool
    
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .frame(maxWidth: .infinity)
            .frame(height: 473)
            .cornerRadius(30)
           // .matchedGeometryEffect(id: "recordBackground", in: namespace)
            .shadow(color: Color.black.opacity(0.14), radius: 12, x: 2, y: 2)
            .overlay{
                VStack(spacing: 0){
                    Text("Select the day you want to pick")
                        .font(.system(size: 12))
                        .foregroundColor(Color("ColorGray100"))
                      //  .matchedGeometryEffect(id: "dateQuestion", in: namespace)
                        .padding(.top, 16)
                    
                    HStack(spacing: 0){
                        Text("4.23")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(Color("ColorLightGray100"))
                        //    .matchedGeometryEffect(id: "startDay", in: namespace)
                            .padding(.trailing, 48)
                        
                        Capsule()
                            .foregroundColor(Color("ColorGray100"))
                            .opacity(0.5)
                            .frame(width: 18, height: 4)
                      //      .matchedGeometryEffect(id: "capsule", in: namespace)
                            .padding(.trailing, 48)
                        
                        Text("4.29")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(Color("ColorGray100"))
                       //     .matchedGeometryEffect(id: "endDay", in: namespace)
                    }
                    .padding(.top, 14)
                    
                    Divider()
                        .padding(.top, 20)
                    

                    test()
                    
                    Spacer()
                    
                        
                }
            }
                    
                        
    }
}

struct CalenderBox_Previews: PreviewProvider {
    static var previews: some View {
        CalenderBox()
    }
}
