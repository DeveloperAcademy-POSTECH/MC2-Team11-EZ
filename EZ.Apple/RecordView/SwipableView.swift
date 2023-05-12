//
//  SwipableView.swift
//  EZ.Apple
//
//  Created by seunghoria on 2023/05/11.
//

import SwiftUI

struct SwipableView: View {
    
    @State var height: CGFloat = 80
    //@State var recordShow : Bool
    
    @State var isShowCal = true
    
    let minHeight: CGFloat = 80
    let maxHeight: CGFloat = 792
    
    
    var percentage: Double {
        height / maxHeight
    }
    
    var body: some View {
        
        VStack {
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
                        VStack{
                            Capsule()
                                .foregroundColor(Color.black.opacity(0.5))
                                .opacity(0.5)
                                .frame(width: 49, height: 4)
                                .padding(.top, 6)
                            
                            Text("15 Records")
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.top, 16)
                        }
                        .gesture(dragGesture)
//                        .border(.red) //탭 제스쳐 위치
                        
                    
                        if isShowCal {
                            
                            Button {
                                isShowCal.toggle()
                                
                            } label: {
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 100)
                                    .cornerRadius(30)
                                   // .matchedGeometryEffect(id: "recordBackground", in: namespace)
                                    .shadow(color: Color.black.opacity(0.14), radius: 12, x: 2, y: 2)
                                    .overlay{
                                        VStack{
                                            Text("Which week do you want to explore?")
                                                .font(.system(size: 12))
                                                .foregroundColor(Color("ColorGray100"))
                                            //    .matchedGeometryEffect(id: "dateQuestion", in: namespace)
                                            //    .padding(.bottom, 1)
                                            
                                            HStack(spacing: 0){
                                                Text("4.23")
                                                    .font(.system(size: 30, weight: .bold))
                                                    .foregroundColor(Color("ColorDate"))
                                                //    .matchedGeometryEffect(id: "startDay", in: namespace)
                                                    .padding(.trailing, 48)
                                               
                                                Capsule()
                                                    .foregroundColor(Color.black.opacity(0.5))
                                                    .opacity(0.5)
                                                    .frame(width: 18, height: 4)
                                                  //  .matchedGeometryEffect(id: "capsule", in: namespace)
                                                    .padding(.trailing, 48)
                                               
                                                Text("4.29")
                                                    .font(.system(size: 30, weight: .bold))
                                                    .foregroundColor(Color("ColorDate"))
                                                  //  .matchedGeometryEffect(id: "endDay", in: namespace)
                                            }
                                            
                                               
                                        }
                                    }
                            }
                            .padding(.top, 30)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 30)
                            
                            RecordList()
                        } else {
                            
                            VStack{
                                Button {
                                    isShowCal.toggle()
                                    
                                } label: {
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .cornerRadius(30)
                                       // .matchedGeometryEffect(id: "recordBackground", in: namespace)
                                        .shadow(color: Color.black.opacity(0.14), radius: 12, x: 2, y: 2)
                                        .overlay{
                                            VStack{
                                                Text("Which week do you want to explore?")
                                                    .font(.system(size: 12))
                                                    .foregroundColor(Color("ColorGray100"))
                                                //    .matchedGeometryEffect(id: "dateQuestion", in: namespace)
                                                //    .padding(.bottom, 1)
                                               
                                                HStack(spacing: 0){
                                                    Text("4.23")
                                                        .font(.system(size: 30, weight: .bold))
                                                        .foregroundColor(Color("ColorDate"))
                                                    //    .matchedGeometryEffect(id: "startDay", in: namespace)
                                                        .padding(.trailing, 48)
                                                   
                                                    Capsule()
                                                        .foregroundColor(Color.black.opacity(0.5))
                                                        .opacity(0.5)
                                                        .frame(width: 18, height: 4)
                                                      //  .matchedGeometryEffect(id: "capsule", in: namespace)
                                                        .padding(.trailing, 48)
                                                   
                                                    Text("4.29")
                                                        .font(.system(size: 30, weight: .bold))
                                                        .foregroundColor(Color("ColorDate"))
                                                      //  .matchedGeometryEffect(id: "endDay", in: namespace)
                                                }
                                               
                                                   
                                            }
                                        }
                                }
                            
                                .padding(.horizontal, 20)
                                .padding(.bottom, 30)
                                
                                CalenderBox()
                            }
                           
                        }

                            
                    }
                    .padding(.bottom, 30)
                   // .background(Color.blue)
                    
                    
                    
                    
//                    if recordShow {
//                        mainRecordView()
//                    }
//
//                    if !recordShow {
//                        CalenderBox(recordShow: $recordShow)
//                    }
//
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: height, alignment: .top)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                

                
                
            }
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea(edges: .bottom)
        
       
        
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

struct SwipableView_Previews: PreviewProvider {
    static var previews: some View {
        SwipableView()
    }
}
