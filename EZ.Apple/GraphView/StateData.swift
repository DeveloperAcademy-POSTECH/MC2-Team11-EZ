import Foundation
import SwiftUI

struct StateData: Identifiable {
    let id = UUID()
    let date: Date
    let state : Int
    
    init(year: Int, month: Int, day: Int, state: Int) {
        self.date = Calendar.current.date(from: .init(year: year, month: month, day: day)) ?? Date()
        self.state = state
    }
}

