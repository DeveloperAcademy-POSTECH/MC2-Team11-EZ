//
//  ChartView.swift
//  EZ.Apple
//
//  Created by Herry on 2023/05/11.
//

import SwiftUI
import Charts
import SwiftUICharts

struct ChartView: View {
    // MARK: - Properties
    
    let number = 3
    @State var currentTap: String = "7 Days"
    @State var sampleAnalytics: [StateData]  = stateData
    

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
                
                VStack(alignment: .leading, spacing: 12){
                    HStack {
                        Text("State Graph")
                            .fontWeight(.semibold)
                        
                        Picker("", selection: $currentTap) {
                            Text("7 Days")
                                .tag("7 Days")
                            Text("Week")
                                .tag("Week")
                        }
                        .pickerStyle(.segmented)
                        .padding(.leading, 50)
                    }

                    ZStack{
                        AnimatedChart()
                        AnimatedChart2()
                    }
                    .frame(height: 450)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.white.shadow(.drop(radius: 2))))
                
                Rectangle()
                    .stroke(lineWidth: 0.2)
                    .frame(height: 1)
                    .padding(.top, 9)
            } //: Vstack
            .padding()
        }
        .ignoresSafeArea()
        .padding(.top, 24)
        .navigationBarHidden(true)
    }
    
    
    @ViewBuilder
    func AnimatedChart() -> some View {
        Chart {
            ForEach(sampleAnalytics) { item in
                // MARK: - Bar Graph
                
                // MARK: - Animating Graph
                LineMark(
                    x: .value("Hour", item.date, unit: .day),
                    y: .value("Views", item.animate ? item.state : 0))
            }
            .interpolationMethod(.catmullRom)
        }
        // MARK: - Customizing Y-Axis Length
        .chartYScale(domain: 0...110)
        .foregroundStyle(Gradient(colors: [.yellow, .orange, .pink]))
        .frame(height: 400)
        .onAppear {
            for (index, _) in sampleAnalytics.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                    withAnimation(.easeOut(duration: 0.5)) {
                        sampleAnalytics[index].animate = true
                    }
                }
            }
        }
    }
    
    
    func AnimatedChart2() -> some View {
        Chart {
            ForEach(sampleAnalytics) { item in
                // MARK: - Bar Graph
                
                // MARK: - Animating Graph
                PointMark(
                    x: .value("Hour", item.date, unit: .day),
                    y: .value("Views", item.animate ? item.state : 0))
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
            .interpolationMethod(.catmullRom)
        }
        // MARK: - Customizing Y-Axis Length
        .chartYScale(domain: 0...110)
        .frame(height: 400)
        .onAppear {
            for (index, _) in sampleAnalytics.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                    withAnimation(.easeOut(duration: 0.5)) {
                        sampleAnalytics[index].animate = true
                    }
                }
            }
        }
    }
}

// MARK: - Preview
struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}


