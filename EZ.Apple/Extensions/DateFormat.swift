import SwiftUI

class DateFormat: ObservableObject {
    
    @Published var dateFormat:String
    @Published var monthDayFormat:String
    @Published var monthFormatMinusOneWeek:String // 1주일 뺀 값을 저장할 변수
    
    @Published var nowDate:String // 1주일 뺀 값을 저장할 변수
    @Published var pastOneWeekDate:String // 1주일 뺀 값을 저장할 변수
    
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
        
    dateFormatter.dateFormat = "M.dd"
    let monthDay = dateFormatter.string(from: date)
        
    // 1주일 뺀 값 구하기
    let weekAgo = date.addingTimeInterval(-7 * 24 * 60 * 60) // 1주일 전의 날짜 구하기
    let monthDayMinusOneWeek = dateFormatter.string(from: weekAgo) // 1주일 뺀 값을 monthDay 변수에 저장하기

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
    monthDayFormat = "\(monthDay)"
    monthFormatMinusOneWeek = "\(monthDayMinusOneWeek)" // 1주일 뺀 값을 monthFormatMinusOneWeek 변수에 저장하기
    nowDate = "\(date)"
    pastOneWeekDate = "\(weekAgo)"
        
    }
    
    func formattedDateString() -> String{
        return dateFormat
    }
    
    func formattedDateString2() -> String{
        return monthDayFormat
    }
    
    func formattedDateString3() -> String{
        return monthFormatMinusOneWeek
    }
    
    func formattedDateString4() -> String{
        return nowDate
    }
//
    func formattedDateString5() -> String{
        return pastOneWeekDate
    }
}
