//
//  SwipableView.swift
//  EZ.Apple
//
//  Created by seunghoria on 2023/05/11.
//

import SwiftUI

struct SwipableView: View {
    @Binding var endDateString : String
    @Binding var startDateString : String
    @Binding var selectedDate : Date
    @Binding var pastWeekDate : Date
    @Binding var statements : [Statement]
    @StateObject var dateFormat : DateFormat
    @State var height: CGFloat = 80
    //@State var recordShow : Bool
    @State var isShowCal = true
    
    @Namespace var namespace
    
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
                                .padding(.top, 20)
                                
                            
                            Text("15 Records")
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.top, 10)
                                
                        }
                        .gesture(dragGesture)
//                        .border(.red) //탭 제스쳐 위치

                        if isShowCal {
                            VStack{
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 100)
                                    .cornerRadius(30)
                                 .matchedGeometryEffect(id: "recordBackground", in: namespace)
                                    .shadow(color: Color.black.opacity(0.14), radius: 12, x: 2, y: 2)
                                    .overlay{
                                        VStack{
                                            Text("Which week do you want to explore?")
                                                .font(.system(size: 12))
                                                .foregroundColor(Color("ColorGray100"))
                                                .frame(width: 350)
                                                .matchedGeometryEffect(id: "recordText", in: namespace)
                                            
                                            HStack(spacing: 0){
                                                Text("\(endDateString.isEmpty ? dateFormat.monthFormatMinusOneWeek : endDateString)")
                                                    .font(.system(size: 30, weight: .bold))
                                                    .foregroundColor(Color("ColorDate"))
                                                    .matchedGeometryEffect(id: "endingDate", in: namespace)
                                                    .padding(.trailing, 48)
                                                
                                                Capsule()
                                                    .foregroundColor(Color("ColorGray100"))
                                                    .opacity(0.5)
                                                    .frame(width: 18, height: 4)
                                                  .matchedGeometryEffect(id: "capsule", in: namespace)
                                                    .padding(.trailing, 48)
                                                
                                                Text("\(startDateString.isEmpty ? dateFormat.monthDayFormat : startDateString)")
                                                    .font(.system(size: 30, weight: .bold))
                                                    .foregroundColor(Color("ColorDate"))
                                                  .matchedGeometryEffect(id: "SelectedDate", in: namespace)
                                            }
                                                
                                            

                                            
                                            
                                        }
                                    }
                                    .padding(.top, 30)
                                    .padding(.horizontal, 20)
                                    .padding(.bottom, 30)
                            }
                            .onTapGesture {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.6)){
                                    isShowCal.toggle()
                                }
                            }
                            
                            RecordList(selectedDate: $selectedDate, pastWeekDate:$pastWeekDate, statements: $statements)
                        } else {
                            
                            VStack{
                                CalenderBox(dateFormat: DateFormat(), selectedDate: $selectedDate, pastWeekDate:$pastWeekDate, startDateString: $startDateString, endDateString: $endDateString, isShowCal: $isShowCal, statements : $statements, namespace: namespace)
                                    .padding(.top, 20)
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
            .shadow(color: Color.black.opacity(0.2), radius: 8, y: 0)
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
    @Namespace static var namespace
    static var previews: some View {
        SwipableView(endDateString: .constant("4.30"), startDateString: .constant("5.06"),  selectedDate: .constant(Date()), pastWeekDate:.constant(Date()), statements: .constant([Statement]()), dateFormat : DateFormat(),  namespace: _namespace)
    }
}
