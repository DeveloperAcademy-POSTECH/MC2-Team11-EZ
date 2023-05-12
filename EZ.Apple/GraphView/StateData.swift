//
//  StateDate.swift
//  EZ.Apple
//
//  Created by Herry on 2023/05/11.
//

import Foundation
import SwiftUI

struct StateData: Identifiable {
    let id = UUID()
    let date: Date
    let state : Int
    var animate: Bool = false
    
    init(year: Int, month: Int, day: Int, state: Int) {
        self.date = Calendar.current.date(from: .init(year: year, month: month, day: day)) ?? Date()
        self.state = state
    }
}


var stateData: [StateData] = [
                StateData(year: 2023, month: 5, day: 10, state: 23),
                 StateData(year: 2023, month: 5, day: 11, state: 40),
                 StateData(year: 2023, month: 5, day: 12, state: 27),
                 StateData(year: 2023, month: 5, day: 13, state: 44),
                 StateData(year: 2023, month: 5, day: 14, state: 27),
                 StateData(year: 2023, month: 5, day: 15, state: 28),
                 StateData(year: 2023, month: 5, day: 16, state: 83),
]
