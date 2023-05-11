import SwiftUI
import Charts

struct ChartView: View {
    // MARK: - Properties
    
    let number = 3
    
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
        ScrollView {
            VStack(spacing: 0) {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Your statement graph for")
                            .font(.system(size: 16))
                            
                            .foregroundColor(.gray)
                        Text("4.23 - 4.29")
                            .font(.system(size: 32))
                            .fontWeight(.bold)
                        
                    } //: Vstack
                    
                    Spacer()
                    
                    NavigationLink(destination: MainView(dateFormat: DateFormat())) {
                            Image("button")
                        }
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
        }
        .ignoresSafeArea()
        .padding(.top, 24)
        .navigationBarHidden(true)
    }
}

// MARK: - Preview
struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
