//
//  MainView.swift
//  EZ.Apple
//
//  Created by Park Hyejin on 2023/05/07.
//

import SwiftUI

struct MainView: View {
    // MARK: -Propertites
    
    
    // MARK: - Body
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Image("ImgBackground")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(width: 2780)
                
                VStack(spacing: 130){
                    HStack(spacing: 69) {
                        VStack(alignment: .leading) {
                            
                            //실시간 날짜 구현
                            
                            Image("UserName")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 134, height: 30)
                            
                            Image("UserGreetingText")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 227, height: 24)
                        
                        } //: Vstack
                        NavigationLink(destination: EmptyView()) {
                            Image("ImgButton")
                        }
                    } //: Hstack
                    .padding(.horizontal, 20)
                    
                    Spacer()
                    
                } //: Vstack
            } //: Zstack
        } //: Navigation
    }
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            
    }
}
