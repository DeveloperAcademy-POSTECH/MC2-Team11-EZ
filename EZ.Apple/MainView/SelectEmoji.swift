//
//  SelectEmoji.swift
//  EZ.Apple
//
//  Created by Park Hyejin on 2023/05/07.
//

import SwiftUI

struct SelectEmoji: View {
    
    // MARK: - Properties
    @Binding var isShowEmoji: Bool
    @Binding var isAnimating: Bool
    @Binding var isShowText: Bool
    @Binding var number: Int
    @Binding var isTextToggle: Bool
    @Binding var isShowResultEmoji: Bool
    @Binding var isQuestionMark: Bool
    
    // MARK: - Body
    var body: some View {
        ZStack{
            
            Image("ImgInit")
                .resizable()
                .scaledToFit()
                .frame(width: 121.2, height: 132)
                .opacity(isShowEmoji ? 1 : 0)
                .scaleEffect(isShowEmoji ? 1 : 0.5)
            
            Text("\(number)")
                .font(.custom("SFPro-ExpandedBold", size: isTextToggle ? 42 : 50))
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.5), radius: 30, x: 0, y: 0)
                .opacity(isShowText ? 1 : 0)
                .scaleEffect(isShowText ? 1 : 0.5)
            
            if isQuestionMark == false {
                NavigationLink(destination: ShareView(number: $number, placeholder: "")) {
          
                        ZStack{
                            Rectangle()
                                .frame(width: 224, height: 224)
                                .foregroundColor(.white)
                                .cornerRadius(50)
                                .opacity(0.4)
                            
                            Image("ImgState\(number / 10)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 121.2, height: 132)
                                .offset(y: isAnimating ? 5 : -5)
                                .animation(.easeOut(duration: 1)
                                    .repeatForever(), value: isAnimating)
                                .blur(radius: 15)
                            
                            Image("ImgState\(number / 10)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 121.2, height: 132)
                                .offset(y: isAnimating ? 5 : -5)
                                .animation(.easeOut(duration: 1)
                                    .repeatForever(), value: isAnimating)
                            
                            Text("\(getSateMessage(number: number))")
                                .foregroundColor(.black)
                                .font(.custom("SFPro-ExpandedBold", size: 14))
                                .padding(.top, 155)
                        }

                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                            isAnimating = true
                        })
                    }
                    .opacity(isShowResultEmoji ? 1 : 0)
                    .scaleEffect(isShowResultEmoji ? 1 : 0.5)
                }
            }
            }
        }
    }

    

// MARK: - Properties
struct SelectEmoji_Previews: PreviewProvider {
    static var previews: some View {
        SelectEmoji(isShowEmoji: .constant(true), isAnimating: .constant(false), isShowText: .constant(false), number: .constant(50), isTextToggle: .constant(true), isShowResultEmoji: .constant(false), isQuestionMark: .constant(true))
    }
}
