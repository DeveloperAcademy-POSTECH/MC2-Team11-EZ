//
//  EmojiView.swift
//  MC2_EZ
//
//  Created by seunghoria on 2023/05/03.
//

import SwiftUI

struct EmojiCardDetail: View {
    var dateFormat : DateFormat
    
    var body: some View {
        ZStack{
            ScrollView{
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 360)
                .cornerRadius(36, corners: .bottomRight)
                .cornerRadius(36, corners: .bottomLeft)
                .foregroundColor(Color("ColorGray100"))
                .opacity(0.3)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                .overlay{
                    VStack(spacing: 0){
                        Spacer()
                        
                        Text(dateFormat.dateFormat)
                            .font(.system(size: 12))
                            .foregroundColor(Color("ColorGray100"))
                            .padding(.bottom, 33)
                        
                        Image("ImgCharacter")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 103)
                            .padding(.bottom, 30)
                        
                        Text("34")
                            .font(.system(size: 40))
                            .fontWeight(.black)
                        
                        Text("Feeling down")
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .padding(.bottom, 30)
                        
                    }
                    
                }
            }
        }.ignoresSafeArea(.all)
       
        
    }
}

struct EmojiCardDetail_Previews: PreviewProvider {
    static var previews: some View {
        EmojiCardDetail(dateFormat: DateFormat())
    }
}
