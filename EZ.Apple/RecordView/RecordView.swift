//
//  RecordView.swift
//  EZ.Apple
//
//  Created by seunghoria on 2023/05/10.
//

import SwiftUI

struct RecordView: View {
       var body: some View {
        ZStack {
               VStack {
                   Text("👆🏻")
                       .font(.system(size: 70))
                       .shadow(color: Color.black.opacity(0.05), radius: 8, y: 5)
                       .foregroundColor(.white)
               }
               .frame(maxWidth: .infinity, maxHeight: .infinity)
               .background(Color.purple.opacity(0.8))
               .ignoresSafeArea()
            
          
            VStack() {
                SwipableView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea(edges: .bottom)
        }
    }
}



struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
