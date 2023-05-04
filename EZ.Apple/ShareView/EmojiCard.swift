//
//  EmojiView.swift
//  MC2_EZ
//
//  Created by seunghoria on 2023/05/03.
//

import SwiftUI

struct EmojiCard: View {
    var body: some View {
        let date = Date()
        let dateFormatter = DateFormatter()
        
        //월 구하기
        dateFormatter.dateFormat = "MMMM"
        let month = dateFormatter.string(from: date)
        
        //일 구하기
        dateFormatter.dateFormat = "d"
        let day = dateFormatter.string(from: date)
        let dayInt = Int(dateFormatter.string(from: date))
    
        //요일 구하기
        dateFormatter.dateFormat = "eeee"
        let weekDay = dateFormatter.string(from: date)
        
        //ordinalNumber 구하기
        var ordinalNumbers : String = ""
        switch (dayInt) {
        case 1, 21, 31:
            ordinalNumbers = "st"
            break;
        case 2, 22:
            ordinalNumbers = "nd"
            break;
        case 3, 23:
            ordinalNumbers = "rd"
            break;
        default:
            ordinalNumbers = "th"
            break;
        }
        
        return Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 424)
            .cornerRadius(72)
            .foregroundColor(.white)
            .opacity(0.3)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
            .overlay{
                VStack(spacing: 0){
                    Text("\(weekDay), \(month) \(day)\(ordinalNumbers)")
                        .font(.system(size: 12))
                        .foregroundColor(Color("ColorGray100"))
                        .padding(.bottom, 45.6)
                    
                    Image("ImgCharacter")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 140)
                        .padding(.bottom, 38)
                    
                    Text("34")
                        .font(.system(size: 40))
                        .fontWeight(.black)
                    
                    Text("Feeling down")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .padding(.bottom, 38)
                    
                }
                
            }
            .padding(.bottom, 150)
        
    }
}

struct EmojiCard_Previews: PreviewProvider {
    static var previews: some View {
        EmojiCard()
    }
}
