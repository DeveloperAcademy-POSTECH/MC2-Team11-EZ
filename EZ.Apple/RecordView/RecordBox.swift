//
//  RecordBox.swift
//  EZ.Apple
//
//  Created by seunghoria on 2023/05/11.
//

import SwiftUI

struct RecordBox: View {
    var body: some View {
        
        
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .foregroundColor(.yellow)
            .overlay{
                HStack(spacing: 0) {
                    Rectangle()
                        .frame(maxWidth: 100)
                        .frame(height: 100)
                        .cornerRadius(24)
                        .foregroundColor(.white)
                        .opacity(0.3)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                        .overlay{
                            VStack(spacing: 0){
                                ZStack {
                                    Image("ImgCharacter")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 54)
                                        .padding(.bottom, 10)
                                        .blur(radius: 20)
                                    
                                    
                                    Image("ImgCharacter")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 54)
                                        .padding(.bottom, 10)
                                    
                                }
                                
                                
                                Text("04")
                                    .font(.system(size: 12))
                                    .fontWeight(.black)
                            }
                            
                        }
                        .padding(.trailing, 16)
                    
                    
                    VStack(spacing: 0){
                        Text("Fuck lah..")
                            .font(.system(size: 16, weight: .bold))
                            .padding(.bottom, 10)
                            .frame(maxWidth: 221, alignment: .leading)
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. ...")
                            .font(.system(size: 14))
                            .foregroundColor(Color("ColorGray100"))
                            .frame(maxWidth: 221, alignment: .leading)
                        
                    }
                    
                    
                }
                .frame(alignment: .leading)
            }
        
    }
    
}


struct RecordBox_Previews: PreviewProvider {
    static var previews: some View {
        RecordBox()
    }
}
