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
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    
    
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


class MyViewController: UIViewController {
    
    let persistenceController = PersistenceController.coreDm
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let startDate = dateFormatter.date(from: "2023-05-01")!
        let endDate = dateFormatter.date(from: "2023-05-06")!
        let statements = persistenceController.fetchStatementForDate(startDate: startDate, endDate: endDate)
        // statements 배열을 사용하여 원하는 방식으로 데이터를 표시하거나 처리합니다.
    }
}
