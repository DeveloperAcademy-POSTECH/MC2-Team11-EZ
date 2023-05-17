//
//  RecordBox.swift
//  EZ.Apple
//
//  Created by seunghoria on 2023/05/11.
//

import SwiftUI

struct RecordBox: View {
    
    let subItem: Statement
    @State var isPresented : Bool = false
    
    var body: some View {
        HStack {
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
                                        
                                        Image(subItem.state_image ?? "")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 54)
                                            .padding(.bottom, 10)
                                            .blur(radius: 20)
                                        
                                        Image(subItem.state_image ?? "")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 54)
                                            .padding(.bottom, 10)
                                    }
                                    Text(subItem.state_number ?? "")
                                        .font(.system(size: 12))
                                        .fontWeight(.black)
                                }
                            }
                            .padding(.trailing, 16)
          
                        VStack(spacing: 0){
                            Text(subItem.state_message ?? "")
                                .font(.system(size: 16, weight: .bold))
                                .padding(.bottom, 10)
                                .frame(maxWidth: 221, alignment: .leading)
                            
                            Text(subItem.state_description ?? "")
                                .font(.system(size: 14))
                                .foregroundColor(Color("ColorGray100"))
                                .frame(maxWidth: 221, alignment: .leading)
                        }
                    }
                    .frame(alignment: .leading)
                }
        }
        .onTapGesture {
            isPresented = true
        }
        .sheet(isPresented: $isPresented) {
            DescriptionView(dateFormat: DateFormat(), subItem: subItem)
        }
        .padding(.bottom, 20)
    }
}
