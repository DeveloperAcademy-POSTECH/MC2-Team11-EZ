//
//  ShareButton.swift
//  MC2_EZ
//
//  Created by seunghoria on 2023/05/03.
//

import SwiftUI

struct ShareButton: View {
    
    var body: some View {
        HStack{
            Button {
                // func image, text 지우기
                shareScreenshot()
            } label: {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .foregroundColor(Color("ColorGray200"))
                
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.trailing, 4)
        .padding(EdgeInsets(top: 24, leading: 0, bottom: 73, trailing: 4))
    }
    
    func shareScreenshot() {
                //
        
            if let window = UIApplication.shared.windows.first {
                // Capture screenshot of the view
                let screenshot = window.rootViewController?.view.asImage()

                // Share screenshot using UIActivityViewController
                let activityViewController = UIActivityViewController(activityItems: [screenshot!], applicationActivities: nil)
                
                UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
                
            }
        
        }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton()
    }
}
