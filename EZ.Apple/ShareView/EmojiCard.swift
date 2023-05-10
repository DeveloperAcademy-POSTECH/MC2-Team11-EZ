//
//  EmojiView.swift
//  MC2_EZ
//
//  Created by seunghoria on 2023/05/03.
//

import SwiftUI

struct EmojiCard: View {
    var dateFormat : DateFormat
    var namespace: Namespace.ID
    var number: Int
    
    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 424)
            .cornerRadius(72)
            .foregroundColor(.white)
            .opacity(0.3)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
            .matchedGeometryEffect(id: "background", in: namespace)
            .overlay{
                VStack(spacing: 0){
                    Text(dateFormat.dateFormat)
                        .font(.system(size: 12))
                        .foregroundColor(Color("ColorGray100"))
                        .padding(.bottom, 45.6)
                        .matchedGeometryEffect(id: "dateFormat", in: namespace)
                    
                    
                    ZStack {
                        Image("ImgState\(number/10)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 140)
                            .padding(.bottom, 38)
                            .blur(radius: 20)
                            .matchedGeometryEffect(id: "stateImageShadow", in: namespace)
                        
                        Image("ImgState\(number/10)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 140)
                            .padding(.bottom, 38)
                            .matchedGeometryEffect(id: "stateImage", in: namespace)
                    }
                        
                    
                    Text("\(number)")
                        .font(.system(size: 40))
                        .fontWeight(.black)
                        .matchedGeometryEffect(id: "stateNumber", in: namespace)
                    
                    //Text("Feeling down")
                    Text(getSateMessage(number: number))
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .padding(.bottom, 38)
                        .matchedGeometryEffect(id: "stateMessage", in: namespace)
                    
                }
                
            }
            .padding(.bottom, 150)
        
    }
}

struct EmojiCard_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        EmojiCard(dateFormat: DateFormat(), namespace: namespace, number: 34)
    }
}

