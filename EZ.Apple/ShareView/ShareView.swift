//
//  ContentView.swift
//  MC2_EZ
//
//  Created by seunghoria on 2023/05/03.
//

import SwiftUI

struct ShareView: View {
    var body: some View {
        ZStack(alignment: .top){
            VStack(spacing: 0){
                ShareButton()
                    
                EmojiCard()
                
                Text("Touch any screen to skip the detail")
                    .font(.system(size: 14))
                    .foregroundColor(Color(.white))
                    .shadow(color: .black.opacity(0.7), radius: 8, x: 0, y: 0)
   
            }.padding(.horizontal, 20)
        }.background(Image("ImageBackground"))
    }
}

struct ShareView_Previews: PreviewProvider {
    static var previews: some View {
        ShareView()
    }
}
