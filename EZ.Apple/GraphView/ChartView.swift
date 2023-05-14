import SwiftUI
import Charts

struct ChartView: View {
    // MARK: - Properties
    
    @State var tag:Int? = nil
    @State var isShownSheet = false

    @State var selectedDate = Date()
    @State var pastWeekDate = Date().addingTimeInterval(-7 * 24 * 60 * 60) // 1주일 전의 날짜 구하기
    
    @State var selectedDateMonthDay : String = ""
    @State var pastWeekDateMonthDay : String = ""
    
    
    @State var statements = [Statement]()
    let persistenceController = PersistenceController.coreDm
    
    @StateObject var dateFormat : DateFormat
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
                    
                    ZStack {
                        AnimatedChart()

                        AnimatedChart2()
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
        .navigationBarHidden(true)
    }
        
        func AnimatedChart() -> some View {
            Chart {
                ForEach(statements.sorted(by: { $0.created_at! < $1.created_at! })) { item in
                    // MARK: - Bar Graph
                    
                    // MARK: - Animating Graph
                    LineMark(
                        x: .value("Hour", item.created_at!, unit: .day),
                        y: .value("Views", item.state_number_int))
                }
                .interpolationMethod(.monotone)
            }
            // MARK: - Customizing Y-Axis Length
            .chartXScale(domain: pastWeekDate...selectedDate)
            .chartYScale(domain: 0...110)
            .foregroundStyle(Gradient(colors: [.yellow, .orange, .pink]))
            .frame(height: 400)
            .onAppear() {
                for (index, _) in statements.sorted(by: { $0.created_at! < $1.created_at!}).enumerated() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.3) {
                        withAnimation(.easeOut(duration: 0.5)) {
                            statements[index].animate = true
                        }
                    }
                }
            }
        }
        
    @ViewBuilder
        func AnimatedChart2() -> some View {
            Chart {
                ForEach(statements.sorted(by: { $0.created_at! < $1.created_at! })) { item in
                    // MARK: - Bar Graph
                    let _ = print(item.animate)
                    // MARK: - Animating Graph
                    PointMark(
                        x: .value("Hour", item.created_at!, unit: .day),
                        y: .value("Views", item.state_number_int))
                    .annotation(position: .overlay, alignment: .center) {
                        VStack() {
                            Button(action: {
                                print("Click")
                            }, label: {
                                Image("ImgState\(item.state_number_int / 10)")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            })
                        }
                        .symbolRenderingMode(.multicolor)
                        .imageScale(.large)

                    }
                    .symbolSize(0)
                }
                .interpolationMethod(.monotone)
            }
            // MARK: - Customizing Y-Axis Length
            .chartXScale(domain: pastWeekDate...selectedDate)
            .frame(height: 400)
            .chartYScale(domain: 0...110)
            .onAppear() {
                let statements = persistenceController.fetchStatementForDate(selectedDate: selectedDate, pastWeekDate: pastWeekDate)
                self.statements = statements
                for (index, _) in statements.sorted(by: { $0.created_at! < $1.created_at!}).enumerated() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.3) {
                        withAnimation(.easeOut(duration: 0.5)) {
                            statements[index].animate = true
                        }
                    }
                }
            }
            
        }
}

// MARK: - Preview
struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(dateFormat: DateFormat())
    }
}
