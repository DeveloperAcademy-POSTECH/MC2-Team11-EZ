//
//  MainView.swift
//  EZ.Apple
//
//  Created by Park Hyejin on 2023/05/07.
//

import SwiftUI

struct MainView: View {
    // MARK: -Propertites
    
    
    // MARK: - Body
    var body: some View {
        
        VStack{
            HStack {
                VStack {
                    
                    Image("UserName")
                    
                } //: Vstack
            } //: Hstack
        } //: Vstack
    }
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
