//
//  Date+Utils.swift
//  Togetree
//
//  Created by 양시준 on 4/16/25.
//

import Foundation

public extension Date {
    var localizedDateString: String {
        return localizedDateString(withStyle: .medium)
    }
    
    func localizedDateString(withStyle style: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateStyle = style
        
        return dateFormatter.string(from: self)
    }
}
