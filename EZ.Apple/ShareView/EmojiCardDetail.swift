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
    
    @State var text: String = ""
    @State var placeholder: String = "(How’s it going lah? (in 180 characters)"
    @Binding var show : Bool
    
    var body: some View {
        ZStack{
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
                                .border(.black)
                                
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
                                TextEditor(text: $text)
                                    .font(.custom("SF-Pro", size: 12))
                                    .frame(maxWidth: .infinity)
                                    .frame(minHeight: 160)
                                    .padding(.horizontal, 30)
                                    .multilineTextAlignment(.leading)
                                    .lineSpacing(4)
                                    .padding(.vertical, 30)
                                    

                            
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
                    .border(.blue)

                    Button {
                        PersistenceController.coreDm.createState(id:UUID(),state_number: "42", state_message: "fuck lah", state_image: "ImgState7", state_description: "내 이름은 플린, 탐정이죠.", created_at: Date(), date_format: dateFormat.dateFormat)
                        
                        print(PersistenceController.coreDm.readAllUser())
                    } label: {
                        Text("That’s all")
                            .font(.custom("SF-Pro", size: 20))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            //.padding(EdgeInsets(top: 20, leading: 130, bottom: 20, trailing: 130))
                            .background(Color("ColorAccentBlue"))
                            
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 180)
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
            .padding(30)
            .ignoresSafeArea()
            .border(.red)
            
        }.background(Image("ImgBackground")
            .ignoresSafeArea(.all)
        )
        
        
    }
}

struct EmojiCardDetail_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        EmojiCardDetail(dateFormat: DateFormat(), namespace: namespace, show : .constant(true) )
    }
}
