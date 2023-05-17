//
//  ShareButton.swift
//  MC2_EZ
//
//  Created by seunghoria on 2023/05/03.
//

import SwiftUI

struct ShareButton: View {
    @Binding var shareShow : Bool
    
    var body: some View {
        HStack{
            
            if !shareShow {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .foregroundColor(Color("ColorGray200"))
                    .onTapGesture {
                        shareScreenshot()
                    }
            }
            else {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .opacity(0)
            }

        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.trailing, 4)
        .padding(EdgeInsets(top: 24, leading: 0, bottom: 73, trailing: 4))
    }
    
    func shareScreenshot() {
        //
        self.shareShow = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02){
            if let window = UIApplication.shared.windows.first {
                // Capture screenshot of the view
                let screenshot = window.rootViewController?.view.asImage()
                
                // Share screenshot using UIActivityViewController
                let activityViewController = UIActivityViewController(activityItems: [screenshot!], applicationActivities: nil)
                
                UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
                self.shareShow = false
            }
        }
        
    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton(shareShow: .constant(true))
    }
}
