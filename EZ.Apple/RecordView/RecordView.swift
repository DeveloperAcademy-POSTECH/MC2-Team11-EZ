//
//  RecordView.swift
//  EZ.Apple
//
//  Created by seunghoria on 2023/05/10.
//

import SwiftUI

struct RecordView: View {
       var body: some View {
        ZStack {
               VStack {
                   Text("Swipe up")
                       .font(.system(size:48, weight: .bold, design: .rounded))
                       .shadow(color: Color.black.opacity(0.05), radius: 8, y: 5)
                       .foregroundColor(.white)
                   
                   Text("👆🏻")
                       .font(.system(size: 70))
                       .shadow(color: Color.black.opacity(0.05), radius: 8, y: 5)
                       .foregroundColor(.white)
               }
               .frame(maxWidth: .infinity, maxHeight: .infinity)
               .background(Color.purple.opacity(0.8))
               .ignoresSafeArea()
            
          
            VStack() {
                SwipableView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct SwipableView: View {
    
    @State var height: CGFloat = 80
    
    let minHeight: CGFloat = 80
    let maxHeight: CGFloat = 792
    
    var percentage: Double {
        height / maxHeight
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            // Background behind SwipableView
            Color.black
                .ignoresSafeArea(edges: .all)
                .opacity(min(0.7, percentage - 0.1))
                .onTapGesture {
                    withAnimation(Animation.easeInOut(duration: 0.4)) {
                        height = minHeight
                    }
                }
            
            VStack(spacing: 0){
                // Handle

                VStack(spacing: 0){
                        Capsule()
                            .foregroundColor(Color.black.opacity(0.5))
                            .opacity(0.5)
                            .frame(width: 49, height: 4)
                            .padding(.top, 6)
                        
                        Text("15 Records")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.top, 16)
                        
                }
                .padding(.bottom, 30)
               // .background(Color.blue)
                .gesture(dragGesture)
                .border(.red)
                
                
                Button {
                    print("캘린더 바꾸러가자")
                } label: {
                    Rectangle()
                        .fill(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .cornerRadius(30)
                        .shadow(color: Color.black.opacity(0.14), radius: 12, x: 2, y: 2)
                        .overlay{
                            VStack{
                                Text("Which week do you want to explore?")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color("ColorGray100"))
                                //    .padding(.bottom, 1)
                                
                                HStack(spacing: 0){
                                    Text("4.23")
                                        .font(.system(size: 30, weight: .bold))
                                        .foregroundColor(Color("ColorDate"))
                                        .padding(.trailing, 48)
                                    
                                    Capsule()
                                        .foregroundColor(Color.black.opacity(0.5))
                                        .opacity(0.5)
                                        .frame(width: 18, height: 4)
                                        .padding(.trailing, 48)
                                    
                                    Text("4.29")
                                        .font(.system(size: 30, weight: .bold))
                                        .foregroundColor(Color("ColorDate"))
                                }
                                
                                    
                            }
                        }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
                //.border(.green)
                
                Divider()
                
                

                
                
                
                
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: height, alignment: .top)
            
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 24))

            

            
            
        }
       
        
    }
    
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { val in
                
                var newHeight = height - val.translation.height
                
                if newHeight > maxHeight {
                    
                    // lets make a better user experience
                    newHeight = maxHeight - val.translation.height / 2
                }
                else if newHeight < minHeight {
                    newHeight = maxHeight
                }
                
                height = newHeight
            }
            .onEnded { val in
                let percentage = height / maxHeight
                var finalHeight = maxHeight
                
                if percentage < 0.45 {
                    finalHeight = minHeight
                }
                
                withAnimation(Animation.easeOut(duration: 0.3)) {
                    height = finalHeight
                }
            }
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
