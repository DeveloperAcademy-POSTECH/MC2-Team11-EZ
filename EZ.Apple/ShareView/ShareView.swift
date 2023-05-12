//
//  ContentView.swift
//  MC2_EZ
//
//  Created by seunghoria on 2023/05/03.
//

import SwiftUI

struct ShareView: View {
    @StateObject var dateFormat = DateFormat()
    @State var show = false
//    @State var shareShow = false
    @Binding var number: Int
    var placeholder : String
    @Namespace var namespace
    
    
    var body: some View {
        ZStack(alignment: .top){
            VStack(spacing: 0){
                if !show {
        
//                    if !shareShow{
                        ShareButton()
                        
//                    }
                    
                    VStack{
                        EmojiCard(dateFormat: DateFormat(), namespace: namespace, number: number)
                        
                        Text("Touch any screen to skip the detail")
                            .font(.system(size: 15))
                            .foregroundColor(Color(.white))
                            .shadow(color: .black.opacity(0.7), radius: 8, x: 0, y: 0)
                        Spacer()
                    }
                    .overlay(
                        Rectangle()
                            .opacity(0)
                            .contentShape(Rectangle())
                            .frame(height: 700, alignment: .bottom)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.5)){
                                    show.toggle()
                                }
                            }
                    )
                    
                }
            }.padding(.horizontal, 20)
                
            
                //공유버튼, 텍스트를 뽑
            
            
            if show {
                EmojiCardDetail(dateFormat: DateFormat(), namespace: namespace, number: number, show: $show)
                    .statusBarHidden(true)
                
            }
        }
//        .navigationBarBackButtonHidden()
        .background(Image("ImgBackground")
            .ignoresSafeArea(.all)
        )
        
    }
}

struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
        ShareView(number: .constant(30), placeholder: "(How’s it going lah? (in 180 characters)")
    }
}
