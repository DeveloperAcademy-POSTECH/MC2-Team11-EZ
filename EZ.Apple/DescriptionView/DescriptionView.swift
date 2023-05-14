//
//  DescriptionView.swift
//  EZ.Apple
//
//  Created by Park Hyejin on 2023/05/12.
//

import SwiftUI

struct DescriptionView: View {
    
    // MARK: -Propertites
    var dateFormat : DateFormat
    let state_Number: Int = 50 //임시값
    let state_Description: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non tortor leo. Sed vehicula et sem et mollis.Lorem ipsum dolor sit amet, consectetur " //임시값
    var subItem: Statement
    
    //@State var tag:Int? = nil
    @State var isshow : Bool = true // X버튼 눌렀을 때 DescriptionView 닫기 위한 변수
    
    // MARK: - Body
    var body: some View {
        
        ZStack{
            ScrollView{
                VStack(spacing: 0){
                    GeometryReader{ proxy in
                        let scrollY = proxy.frame(in: .named("scroll")).minY
                        
                        VStack(spacing: 0){
                            Rectangle()
                                .frame(maxWidth: .infinity)
                                .frame(height: 390)
                                .cornerRadius(36, corners: .bottomRight)
                                .cornerRadius(36, corners: .bottomLeft)
                                .foregroundColor(.white)
                                .opacity(0.3)
                                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                                .blur(radius: scrollY > 0 ? scrollY / 5 : 0)                            
                                .overlay{
                                    VStack(spacing: 0){
                                        Spacer()
                                        
                                        Text(subItem.date_format ?? "")
                                            .font(.system(size: 12))
                                            .foregroundColor(Color("ColorGray100"))
                                            .padding(.bottom, 33)
                                            .padding(.top, 30)
                                        
                                        
                                        ZStack {
                                            Image(subItem.state_image ?? "")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 103)
                                                .blur(radius: 20)
                                                .padding(.bottom, 30)
                                            
                                            
                                            Image(subItem.state_image ?? "")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 103)
                                                .padding(.bottom, 30)
                                            
                                        }
                                        
                                        Text(subItem.state_number ?? "")
                                            .font(.system(size: 40))
                                            .fontWeight(.black)
                                        
                                        
                                        
                                        Text(subItem.state_message ?? "")
                                            .font(.system(size: 14))
                                            .fontWeight(.medium)
                                            .padding(.bottom, 30)
                                        
                                    }
                                    .offset(y: scrollY > 0 ? -scrollY : 0)
                                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                                }
                                .padding(.bottom, 30)
                        }
                    }
                    .frame(height: 360)
                    

                    ZStack(alignment: .topLeading) {
                        Rectangle()
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .overlay{
                                Text(subItem.state_description ?? "")
                                    .font(.custom("SF-Pro", size: 16))
                                    .lineLimit(10)
                                    .foregroundColor(Color("ColorGray100"))
                                    .padding(.vertical, 20)
                                    .padding(.horizontal, 30)
                            }
                        
                    }.padding(.horizontal, 20)
                        .padding(.top, 30)
                }
            }.ignoresSafeArea(.all)
            
        }
        .background(Image("ImgBackground")
            .ignoresSafeArea(.all)
        )
        
        
    }
}
//
//// MARK: - Preview
//struct DescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        DescriptionView(dateFormat: DateFormat(), subItem: [Statement)
//    }
//}
