//
//  DateFormat.swift
//  EZ.Apple
//
//  Created by seunghoria on 2023/05/07.
//

import SwiftUI

class DateFormat: ObservableObject {
    
    @Published var dateFormat:String
    
    init(){
    let date = Date()
    let dateFormatter = DateFormatter()
    
    
    //월 구하기
    dateFormatter.dateFormat = "MMMM"
    let month = dateFormatter.string(from: date)
    
    //일 구하기
    dateFormatter.dateFormat = "d"
    let day = dateFormatter.string(from: date)
    let dayInt = Int(dateFormatter.string(from: date))

    //요일 구하기
    dateFormatter.dateFormat = "eeee"
    let weekDay = dateFormatter.string(from: date)

    
    //ordinalNumber 구하기
    var ordinalNumbers : String = ""
    switch (dayInt) {
    case 1, 21, 31:
        ordinalNumbers = "st"
        break;
    case 2, 22:
        ordinalNumbers = "nd"
        break;
    case 3, 23:
        ordinalNumbers = "rd"
        break;
    default:
        ordinalNumbers = "th"
        break;
    }
    dateFormat = "\(weekDay), \(month) \(day)\(ordinalNumbers)"
    }
    func formattedDateString() -> String{
        return dateFormat
    }
}

