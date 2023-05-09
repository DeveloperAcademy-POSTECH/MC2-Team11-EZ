//
//  Home.swift
//  EZ.Apple
//
//  Created by Herry on 2023/05/09.
//

import SwiftUI

struct Home: View {
    // MARK: - Properties
    @State var currentDate: Date
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
              
                CustomDatePicker(currentDate: $currentDate)
                
            }
        }
    }
}

// MARK: - Preview
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(currentDate: Date())
    }
}
