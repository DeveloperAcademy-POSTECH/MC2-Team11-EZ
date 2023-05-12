//
//  MainView.swift
//  EZ.Apple
//
//  Created by Park Hyejin on 2023/05/07.
//

import SwiftUI
import CoreHaptics

struct MainView: View {
    // MARK: -Propertites
    
    @State private var isShowEmoji = true // 이모티콘 상태 변수
    @State private var isShowText = false // 숫자 표시 상태 변수
    @State private var isShowResultEmoji = false //결과 이모지 상태 변수
    @State private var isTextToggle = true // 토글 텍스트 상태 변수
    @State private var isAnimating = false // 애니메이션 상태 변수
    
    @State private var handleRotation: Double = 0 // 핸들 로테이트 변수
    @State private var number: Int = 50 // 룰렛 초기 값
    @State private var numberOfRotations: Int = 0 // 룰렛 회전 수
    @State private var engine: CHHapticEngine?
    
    @State private var isShowImage = true // 드래그 코치마크 상태 변수
    @State private var isShowDrage = true // 드래그 코치마크 애니메이션 상태 변수
    
    @State private var radius: CGFloat = 250 //휠 크기
    let dateFormat: DateFormat


    // MARK: - Body
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Image("ImgBackground")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(width: 2780)
                    
                
                VStack(spacing: 30) {
                    VStack(spacing: 117){
                        HStack(spacing: 53) {
                            VStack(alignment: .leading) {
                                
                                Text(dateFormat.dateFormat)
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                
                                Image("UserName")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 134, height: 30)
                                
                                Image("UserGreetingText")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 227, height: 24)
                            
                            } //: Vstack
                            NavigationLink(destination: ChartView()) {
                                Image("ImgButton")
                                    .frame(width: 54, height: 54)
                            }
                        } //: Hstack
                        .padding(.horizontal, 20)
                
                        SelectEmoji(isShowEmoji: $isShowEmoji, isAnimating: $isAnimating, isShowText: $isShowText, number: $number, isTextToggle: $isTextToggle, isShowResultEmoji: $isShowResultEmoji)
                    }//: Vstack

                        Spacer()
                    
                        CoachMark(isShowImage: $isShowImage, isShowDrag: $isShowDrage)
                        .padding(.bottom, 30)
                        .frame(height: 80)
                    
                        Spacer()
                        
                        DragWheel(number: $number, radius: $radius, handleRotation: $handleRotation, isShowEmoji: $isShowEmoji, isShowText: $isShowText, isShowResultEmoji: $isShowResultEmoji, isTextToggle: $isTextToggle, numberOfRotations: $numberOfRotations, isShowImage: $isShowImage)

                        
                    
                } //: Vstack
                .padding(.top, 30)
            } //: Zstack
           
        } //: Navigation
        .navigationBarHidden(true)
    }
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(dateFormat: DateFormat())
            
    }
}
