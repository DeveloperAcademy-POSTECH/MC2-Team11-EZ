//
//  DragWheel.swift
//  EZ.Apple
//
//  Created by Park Hyejin on 2023/05/07.
//

import SwiftUI
import CoreHaptics

struct DragWheel: View {
    // MARK: - Properties
    @Binding var number: Int
    @Binding var radius: CGFloat
    @Binding var handleRotation: Double
    @Binding var isShowEmoji: Bool
    @Binding var isShowText: Bool
    @Binding var isShowResultEmoji: Bool
    @Binding var isTextToggle: Bool
    @Binding var numberOfRotations: Int
    @Binding var isShowImage: Bool
    @Binding var isQuestionMark: Bool
    
    @State private var engine: CHHapticEngine?
    
    func setupHapticEngine() throws {
        engine = try CHHapticEngine()
        try engine?.start()
    }
    
    // 햅틱 피드백 재생 함수
    func playHapticFeedback() throws {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        
        let pattern = try CHHapticPattern(events: [event], parameters: [])
        let player = try engine?.makePlayer(with: pattern)
        try player?.start(atTime: 0)
    }

    
    // MARK: - Body
    var body: some View {
        ZStack {
            Circle() // 큰 핸들
             
                .foregroundColor(Color.white.opacity(0.8))
                .frame(width: 630, height: 630)
                .shadow(color: .gray.opacity(0.5), radius: 20, x: 0, y: 1)
            
            Circle() // 눈금
                .strokeBorder(Color.white, lineWidth: 0.1)
            
            ForEach(1..<101) { i in
                let angle = Double(i - 50) * 3.6
                let marker = Rectangle()
                    .fill(Color.white)
                    .frame(width: i == number ? 2 : 1, height: i == number ? 20 : 10)
                    .offset(x: 0, y: -radius + 5)
                    .rotationEffect(.degrees(angle))
                
                if i % 5 == 0 {
                    Text("\(i)")
//                                    .font(.subheadline)
                        .font(.system(size: i == number ? 16 : 12))
                        .animation(.easeIn(duration: 0.1))
                        .foregroundColor(.white)
                        .offset(x: 0, y: i == number ?  -radius + 35 : -radius + 30)
                        .rotationEffect(.degrees(angle))
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: i == number ? 4 : 2, height: i == number ? 56 : 52)

                        .offset(x: 0, y: -radius - 12)
                        .rotationEffect(.degrees(angle))
                } else {
                    marker
                }
            }
            
            Circle() // 작은 핸들
                .foregroundColor(Color.white.opacity(0.8))
                .frame(width: 394, height: 394)
                .shadow(color: .gray.opacity(0.5), radius: 20, x: 0, y: 1)
        }
        .rotationEffect(Angle(degrees: handleRotation), anchor: .center)// 핸들 세트
        .gesture(
            DragGesture()
                .onChanged { value in
                    withAnimation {
                        isShowEmoji = false
                        isShowText = true
                        isShowResultEmoji = false
                        isShowImage = false
                        isQuestionMark = false
                    }
                   
                    isTextToggle.toggle()
                
                    
                    // 핸들 이미지의 회전 각도를 갱신
                    let delta = value.translation.width // 드래그하는 동안의 움직인 거리
                    //print("delta -> \(delta)")
                    handleRotation += Double(delta / 100) // 움직인 거리에 따라 핸들을 회전시킴
                    //print("handleRotation -> \(handleRotation)")
                    numberOfRotations = Int(50 + handleRotation / 3.6) % 100
                    //print("numberOfRotations -> \(numberOfRotations)")
                    number = numberOfRotations > 0 ? 100 - numberOfRotations : -numberOfRotations
            
                    // 핸들을 돌릴 때 진동 주기
                    do {
                        try playHapticFeedback()
                    } catch {
                        print("Failed to play haptic feedback: \(error.localizedDescription)")
                    }
                }.onEnded({ _ in
                    withAnimation {
                        isShowResultEmoji = true
                    }
                })
        )
        .onAppear {
            // Haptic 엔진 초기화
            do {
                try setupHapticEngine()
            } catch {
                print("Failed to setup haptic engine: \(error.localizedDescription)")
            }
        }
        .frame(width: radius * 2, height: radius * 2)
        .padding(.bottom, -350)
    }
}
