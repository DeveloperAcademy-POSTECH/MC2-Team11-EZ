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
    @Binding var show : Bool
    
    var body: some View {
        ZStack{
            ScrollView{
                GeometryReader{ proxy in
                    let scrollY = proxy.frame(in: .named("scroll")).minY
                    
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
                                    .font(.system(size: 12))
                                    .foregroundColor(Color("ColorGray100"))
                                
                                    .padding(.bottom, 33)
                                    .matchedGeometryEffect(id: "dateFormat", in: namespace)
                                
                                ZStack {
                                    Image("ImgCharacter")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 103)
                                        .blur(radius: 20)
                                        .padding(.bottom, 30)
                                        .matchedGeometryEffect(id: "stateImageShadow", in: namespace)
                                    
                                    Image("ImgCharacter")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 103)
                                        .padding(.bottom, 30)
                                        .matchedGeometryEffect(id: "stateImage", in: namespace)
                                    
                                    
                                }
                                
                                Text("34")
                                    .font(.system(size: 40))
                                    .fontWeight(.black)
                                    .matchedGeometryEffect(id: "stateNumber", in: namespace)
                                
                                
                                Text("Feeling down")
                                    .font(.system(size: 14))
                                    .fontWeight(.medium)
                                    .padding(.bottom, 30)
                                    .matchedGeometryEffect(id: "stateMessage", in: namespace)
                            }
                            .offset(y: scrollY > 0 ? -scrollY : 0)
                            .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
//                            .blur(radius: scrollY > 0 ? scrollY / 5 : 0)
                        }
                    
                }
                
            }
            
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
            .padding(30)
            .ignoresSafeArea()
            .border(.red)
            
        }.ignoresSafeArea(.all)
        
        
    }
}

struct EmojiCardDetail_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        EmojiCardDetail(dateFormat: DateFormat(), namespace: namespace, show : .constant(true) )
    }
}
