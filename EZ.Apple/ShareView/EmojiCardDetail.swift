
//
//  EmojiView.swift
//  MC2_EZ
//
//  Created by seunghoria on 2023/05/03.
//

import SwiftUI

struct EmojiCardDetail: View {
    var dateFormat : DateFormat
    var namespace : Namespace.ID
    var number: Int
    
    
    
    @State var tag:Int? = nil
    @State var text: String = ""
    @State var placeholder: String = "(How’s it going lah? (in 180 characters)"
    @Binding var show : Bool
    @FocusState var focusValue: Int?
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    
    var body: some View {
        ZStack {
            NavigationLink(destination: ChartView(dateFormat: DateFormat()), tag: 1, selection: self.$tag) {
            }
            
            ScrollView{
                VStack(spacing: 0){
                    GeometryReader{ proxy in
                        let scrollY = proxy.frame(in: .named("scroll")).minY
                        
                        VStack(spacing: 0){
                            Rectangle()
                            
                                .frame(maxWidth: .infinity)
                                .frame(height: 360)
                                .cornerRadius(36, corners: .bottomRight)
                                .cornerRadius(36, corners: .bottomLeft)
                                .foregroundColor(.white)
                                .opacity(0.3)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                                .matchedGeometryEffect(id: "background", in: namespace)
                                .blur(radius: scrollY > 0 ? scrollY / 5 : 0)
                    
                            
                                .overlay{
                                    VStack(spacing: 0){
                                        Spacer()
                                        
                                        Text(dateFormat.dateFormat)
                                            .font(.system(size: 15))
                                            .foregroundColor(Color("ColorGray100"))
                                            .padding(.bottom, 33)
                                            .matchedGeometryEffect(id: "dateFormat", in: namespace)
                                        
                                        ZStack {
                                            Image("ImgState\(number/10)")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 103)
                                                .blur(radius: 20)
                                                .padding(.bottom, 20)
                                                .matchedGeometryEffect(id: "stateImageShadow", in: namespace)
                                            
                                            Image("ImgState\(number/10)")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 103)
                                                .padding(.bottom, 20)
                                                .matchedGeometryEffect(id: "stateImage", in: namespace)
                                        }
                                        
                                        Text("\(number)")
                                            .font(.system(size: 40))
                                            .fontWeight(.black)
                                            .frame(width: 120)
                                            .matchedGeometryEffect(id: "stateNumber", in: namespace)
                                            
                                            
                                        
                                        
                                        Text("\(getSateMessage(number: number))")
                                            .font(.system(size: 14))
                                            .fontWeight(.medium)
                                            .padding(.top, 5)
                                            .padding(.bottom, 30)
                                            .frame(width: 200)
                                            .matchedGeometryEffect(id: "stateMessage", in: namespace)
                                    }
                                    .offset(y: scrollY > 0 ? -scrollY : 0)
                                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                                    //                            .blur(radius: scrollY > 0 ? scrollY / 5 : 0)
                                }
                                .padding(.bottom, 30)
                        }
                    }
                    .frame(height: 360)
                    
                    
                    
                    ZStack(alignment: .topLeading) {
                        Rectangle()
                            .frame(maxWidth: .infinity)
                            .frame(height: 150)
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .overlay{
                                TextEditor(text: $text)
                                    .focused($focusValue, equals: 1)
                                    .font(.custom("SF-Pro", size: 14))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 110)
                                    .padding(.horizontal, 30)
                                    .multilineTextAlignment(.leading)
                                    .lineSpacing(4)
                                    .onAppear(perform : UIApplication.shared.hideKeyboard)
                            }
                        
                        if text.isEmpty {
                            Text(placeholder)
                                .font(.custom("SF-Pro", size: 14))
                                .lineLimit(10)
                                .foregroundColor(Color.primary.opacity(0.25))
                                .padding(.top, 29)
                                .padding(.leading, 30)
                        }
                    }.padding(.horizontal, 20)
                        .padding(.top, 20)
                      
                    
                    
                    // 네비게이션 tag 추가
                    Button {
                        PersistenceController.coreDm.createState(id:UUID(), state_number: "\(number)", state_number_int: number, state_message: getSateMessage(number: number), state_image: "ImgState\(number / 10)", state_description: text, created_at: Date(), date_format: dateFormat.dateFormat, animate: false)
                        self.tag = 1
                        print(PersistenceController.coreDm.readAllUser())
                        
                    } label: {
                        Image("ImgBtnCreate")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 330)
                            .shadow(color: Color.black.opacity(0.2), radius: 8, y: 5)
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 220)
                    
                }
            }.ignoresSafeArea(.all)
            
            Button {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.5))
                {
                    show.toggle()
                }
                
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(.trailing, 30)
            .padding(.top, 60)
            .ignoresSafeArea()
            
        }
        .onAppear(){
            
            PersistenceController.coreDm.createState(id:UUID(), state_number: "33", state_number_int: 33, state_message: getSateMessage(number: 33), state_image: "ImgState\(3)", state_description: "나는 오늘 너무 우울해.. 일이 너무 많은걸", created_at: Date().addingTimeInterval(-6 * 24 * 60 * 60), date_format: dateFormat.dateFormat, animate: false)
            
            PersistenceController.coreDm.createState(id:UUID(), state_number: "40", state_number_int: 40, state_message: getSateMessage(number: 40), state_image: "ImgState\(4)", state_description: "일이 늦게 끝났지만 그래도 뿌듯하네", created_at: Date().addingTimeInterval(-5 * 24 * 60 * 60), date_format: dateFormat.dateFormat, animate: false)
            
            
            PersistenceController.coreDm.createState(id:UUID(), state_number: "11", state_number_int: 11, state_message: getSateMessage(number: 11), state_image: "ImgState\(1)", state_description: "시험을 망쳤다. 내일 시험도 망치면 어쩌냐..", created_at: Date().addingTimeInterval(-4 * 24 * 60 * 60), date_format: dateFormat.dateFormat, animate: false)
            
            
            PersistenceController.coreDm.createState(id:UUID(), state_number: "70", state_number_int: 70, state_message: getSateMessage(number: 70), state_image: "ImgState\(7)", state_description: "왠걸 찍은거 다 맞았어.. 미쳤다.. 나란 사람", created_at: Date().addingTimeInterval(-3 * 24 * 60 * 60), date_format: dateFormat.dateFormat, animate: false)
            
            PersistenceController.coreDm.createState(id:UUID(), state_number: "55", state_number_int: 55, state_message: getSateMessage(number: 55), state_image: "ImgState\(5)", state_description: "아무 일도 없는 평범한 일상", created_at: Date().addingTimeInterval(-2 * 24 * 60 * 60), date_format: dateFormat.dateFormat, animate: false)
            
            PersistenceController.coreDm.createState(id:UUID(), state_number: "91", state_number_int: 91, state_message: getSateMessage(number: 91), state_image: "ImgState\(9)", state_description: "오늘 코테 1차를 합격했다.. 눈물이 난다.", created_at: Date().addingTimeInterval(-1 * 24 * 60 * 60), date_format: dateFormat.dateFormat, animate: false)
        }
        .navigationBarBackButtonHidden()
        .background(Image("ImgBackground")
            .ignoresSafeArea(.all)
        )
        
        
    }
}

struct EmojiCardDetail_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        EmojiCardDetail(dateFormat: DateFormat(), namespace: namespace, number: 34, show : .constant(true) )
    }
}
