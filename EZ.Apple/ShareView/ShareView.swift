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
    @Namespace var namespace
    
    
    var body: some View {
        ZStack(alignment: .top){
            VStack(spacing: 0){
                if !show {
                    ShareButton()
                    
                    EmojiCard(dateFormat: DateFormat(), namespace: namespace)
                    
                    Text("Touch any screen to skip the detail")
                        .font(.system(size: 15))
                        .foregroundColor(Color(.white))
                        .shadow(color: .black.opacity(0.7), radius: 8, x: 0, y: 0)
                    
                }
            }.padding(.horizontal, 20)
                .overlay{
                    Rectangle()
                        .opacity(0)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.5)){
                                show.toggle()
                            }
                        }
                }
            
            
            if show {
                EmojiCardDetail(dateFormat: DateFormat(), namespace: namespace, show: $show)
                
            }
        }.background(Image("ImgBackground")
            .ignoresSafeArea(.all)
        )
        
    }
}

struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
        ShareView()
    }
}
