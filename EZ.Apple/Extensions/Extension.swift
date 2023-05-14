//
//  Extension.swift
//  EZ.Apple
//
//  Created by seunghoria on 2023/05/07.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
    func getSateMessage(number : Int) -> String {
        switch number {
        case 0..<10:
            return "Fuck Lah.."
        case 11..<20:
            return "Exhausted.."
        case 21..<30:
            return "Bad.."
        case 31..<40:
            return "Not Good.."
        case 41..<50:
            return "Okay ~"
        case 51..<60:
            return "Good ~"
        case 61..<70:
            return "Very Good ~"
        case 71..<80:
            return "Great!"
        case 81..<90:
            return "Awesome!"
        case 91..<101:
            return "すばらしい！"
        default:
            return "State Message Error"
                    }
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

// MARK: - 공유하기 버튼 클릭시, 해당 뷰 스크린샷 Extension
extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

extension Date {
    func dayOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}


var backgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}
