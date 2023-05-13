//
//  CalenderBox.swift
//  EZ.Apple
//
//  Created by seunghoria on 2023/05/11.
//

import SwiftUI

struct CalenderBox: View {
    //@Binding var recordShow : Bool
    @StateObject var dateFormat : DateFormat
    @Binding  var selectedDate : Date
    @Binding  var pastWeekDate : Date
    @Binding var startDateString: String
    @Binding var endDateString: String
    @Binding var isShowCal : Bool
    @Binding  var statements : [Statement]
    var namespace : Namespace.ID
    let persistenceController = PersistenceController.coreDm
    
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .frame(maxWidth: .infinity)
            .frame(height: 580)
            .cornerRadius(30)
            .matchedGeometryEffect(id: "recordBackground", in: namespace)
            .shadow(color: Color.black.opacity(0.14), radius: 12, x: 2, y: 2)
            .overlay{
                VStack(spacing: 0){
                    Text("Select the day you want to pick")
                        .font(.system(size: 12))
                        .foregroundColor(Color("ColorGray100"))
                        .frame(width: 350)
                        .matchedGeometryEffect(id: "recordText", in: namespace)
                        
                        .padding(.top, 20)
                    
                    HStack(spacing: 0){
                        Text("\(endDateString.isEmpty ? dateFormat.monthFormatMinusOneWeek : endDateString)")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(Color("ColorLightGray100"))
                            .matchedGeometryEffect(id: "endingDate", in: namespace)
                            .padding(.trailing, 48)
                        
                        Capsule()
                            .foregroundColor(Color("ColorGray100"))
                            .opacity(0.5)
                            .frame(width: 18, height: 4)
                            .matchedGeometryEffect(id: "capsule", in: namespace)
                            .padding(.trailing, 48)

                        Text("\(startDateString.isEmpty ? dateFormat.monthDayFormat: startDateString)")
                        
                            .font(Font.system(size: 30, weight: .bold))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [Color("ColorGradient100"), Color("ColorGradient200")],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .matchedGeometryEffect(id: "SelectedDate", in: namespace)

                    }
                    .padding(.top, 14)
                    
                    
                    Divider()
                        .opacity(1)
                        .padding(.top, 24)
                        .matchedGeometryEffect(id: "divider", in: namespace)
                    

                    VStack {
//                                    List {
//                                        ForEach(statements, id: \.self) { statement in
//                                            let _ = print(statement)
//
//                                            Text(statement.state_number ?? "")
//                                            Text(statement.state_description ?? "")
//                                        }
//                                    }
                            VStack {
                                DatePicker("Start Date", selection: $selectedDate, displayedComponents: [.date])
                                    .datePickerStyle(GraphicalDatePickerStyle())
                                    .accentColor(Color("ColorGradient100"))
                                    .onChange(of: selectedDate, perform: { value in
                                        pastWeekDate = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: value)!
                                        
                                        let dateFormatter = DateFormatter()
 
                                        dateFormatter.dateFormat = "M.dd"
                                        startDateString = dateFormatter.string(from: selectedDate)
                                        endDateString = dateFormatter.string(from: pastWeekDate)
                                        
                                        print(selectedDate)
                                        print(pastWeekDate)
                                    })
                                    .padding(.top, 24)

                                
                                
                                Button(action: {
                                    let statements = persistenceController.fetchStatementForDate(selectedDate: selectedDate, pastWeekDate: pastWeekDate)
                                    self.statements = statements
                                    
//                                    print(statements)
                                    
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.6))
                                    {
                                        isShowCal.toggle()
                                    }
                                }, label: {
                                    Image("ImgBtnCalendar")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .shadow(color: Color.black.opacity(0.2), radius: 8, y: 5)
                                })
                                .padding(.top, 20)
                                
                            
                            }
                            .padding(.horizontal, 20)

                    }
                    
                    Spacer()
                    
                        
                }
            }             
    }
}

struct CalenderBox_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        
        CalenderBox(dateFormat: DateFormat(), selectedDate: .constant(Date()), pastWeekDate:.constant(Date()), startDateString: .constant("4.24"), endDateString: .constant("5.24"), isShowCal: .constant(true), statements : .constant([Statement]()), namespace: namespace)
    }
}
