import SwiftUI
import Charts

struct ChartView: View {
    // MARK: - Properties
    
    let number = 3
    @State var tag:Int? = nil
    @State var isShownSheet = false

    @State var selectedDate = Date()
    @State var pastWeekDate = Date().addingTimeInterval(-7 * 24 * 60 * 60) // 1주일 전의 날짜 구하기
    
    @State var selectedDateMonthDay : String = ""
    @State var pastWeekDateMonthDay : String = ""
    
    
    @State var statements = [Statement]()
    let persistenceController = PersistenceController.coreDm
    
    @StateObject var dateFormat : DateFormat
    
     
    let stateData = [StateData(year: 2023, month: 5, day: 10, state: 23),
                     StateData(year: 2023, month: 5, day: 11, state: 40),
                     StateData(year: 2023, month: 5, day: 11, state: 70),
                     StateData(year: 2023, month: 5, day: 12, state: 27),
                     StateData(year: 2023, month: 5, day: 13, state: 44),
                     StateData(year: 2023, month: 5, day: 15, state: 27),
                     StateData(year: 2023, month: 5, day: 16, state: 83),
                     StateData(year: 2023, month: 5, day: 16, state: 10)
    ]

    // MARK: - Body
    var body: some View {
        
        ZStack {
                VStack(spacing: 0) {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Your statement graph for")
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                            
                            Text("\(pastWeekDateMonthDay.isEmpty ? dateFormat.monthFormatMinusOneWeek : pastWeekDateMonthDay) - \(selectedDateMonthDay.isEmpty ? dateFormat.monthDayFormat : selectedDateMonthDay)")
                                .font(.system(size: 32))
                                .fontWeight(.bold)
                            
                        } //: Vstack
                        
                        Spacer()
                        
                        NavigationLink(destination: MainView(dateFormat: DateFormat())) {
                                Image("ImgBackBtn")}
                    } //: Hstack
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 24)
                    
                    Rectangle()
                        .stroke(lineWidth: 0.2)
                        .frame(height: 1)
                        .padding(.top, 9)
                    
                    ZStack{
                        Chart(stateData) { element in
                            LineMark(x: .value("Date", element.date, unit: .day), y: .value("State", element.state)
                            ).lineStyle(.init(lineWidth: 3, lineCap: .round, lineJoin: .round))
                                .interpolationMethod(.monotone)
                        }
                        .chartYScale(domain: 0...110)
                        .foregroundStyle(Gradient(colors: [.yellow, .orange, .pink]))
                        
                        
                        

                        Chart(stateData) { element in
                            PointMark(x: .value("Date", element.date, unit: .day), y: .value("State", element.state)
                            )

                            .annotation(position: .overlay, alignment: .center) {
                                VStack() {
                                    Button(action: {
                                        print("Click")
                                    }, label: {
                                        Image("ImgState1")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                    })
                                }
                                .symbolRenderingMode(.multicolor)
                                .imageScale(.large)
                                
                            }
                            .symbolSize(0)
                        }
                        .chartYScale(domain: 0...110)
                    }
                    .frame(height: 573)
                    .padding(.horizontal, 20)
                    
                    Rectangle()
                        .stroke(lineWidth: 0.2)
                        .frame(height: 1)
                        .padding(.top, 9)
                    
                        
                } //: Vstack
            .ignoresSafeArea()
            .padding(.top, 24)
            
            SwipableView(pastWeekDateMonthDay:$pastWeekDateMonthDay, selectedDateMonthDay:$selectedDateMonthDay, selectedDate : $selectedDate, pastWeekDate : $pastWeekDate, statements: $statements, dateFormat:DateFormat())
            
                
            
        }
        .onAppear(){
            let statements = persistenceController.fetchStatementForDate(selectedDate: selectedDate, pastWeekDate: pastWeekDate)
            self.statements = statements
        }

        
        .navigationBarHidden(true)
    }
}

// MARK: - Preview
struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(dateFormat: DateFormat())
    }
}
