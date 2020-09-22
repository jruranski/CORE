//
//  DateOpperations.swift
//  CORE
//
//  Created by Jakub Ruranski on 18/08/2020.
//

import Foundation

func formatDate(date: Date, seconds: Int64?) -> String {
    var formattedString: String?
    let formatter = DateFormatter()
    let theCalendar = Calendar.current
    var dateFormatterTemplate = DateFormatter.dateFormat(fromTemplate: "EEEE, dd  HH:mm", options: 0, locale: NSLocale.current)
    
    
    
    if theCalendar.isDateInToday(date) {
        dateFormatterTemplate = DateFormatter.dateFormat(fromTemplate: " HH:mm", options: 0, locale: NSLocale.current)
        formatter.dateFormat = dateFormatterTemplate
        formattedString = "Today, \(formatter.string(from: date))"
        
    }else {
        
        
        formatter.dateFormat = dateFormatterTemplate
        formattedString = formatter.string(from: date)
    }
    
    
    
    
    let toDateFormat = DateFormatter.dateFormat(fromTemplate: "HH:mm", options: 0, locale: .current)
    
    
    
    
    
    
    
    
    if let s = seconds {
        let toDate = date.addingTimeInterval(TimeInterval(s))
        formatter.dateFormat = toDateFormat
        return "\(formattedString!) to \(formatter.string(from: toDate))"
    }else{
        return formattedString!
    }
}

func formatTime(date: Date) -> String {
    var formattedString: String?
    let formatter = DateFormatter()
//    let theCalendar = Calendar.current
    var dateFormatterTemplate = DateFormatter.dateFormat(fromTemplate: "EEEE, dd  HH:mm", options: 0, locale: NSLocale.current)
    
    dateFormatterTemplate = DateFormatter.dateFormat(fromTemplate: " HH:mm a", options: 0, locale: NSLocale.current)
    formatter.dateFormat = dateFormatterTemplate
    formattedString = formatter.string(from: date)
    
    
    return formattedString!
}


func formatTimeDayFirst(date: Date) -> String {
    var formattedString: String?
    let formatter = DateFormatter()
    let dateFormatterTemplate = DateFormatter.dateFormat(fromTemplate: "E, HH:mm a", options: 0, locale: NSLocale.autoupdatingCurrent)
    
    formatter.dateFormat = dateFormatterTemplate
    formattedString = formatter.string(from: date)
    
    return formattedString ?? "TUE, 10:00"
}

func formatDuration(duration: Int32) -> String {
    let seconds = Int(duration)
    
    
    
    return "45min"
}

extension Date {
    
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
    
}

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
        // or use capitalized(with: locale) if you want
    }
}


extension Date {

  static func today() -> Date {
      return Date()
  }

  func next(_ weekday: Weekday, considerToday: Bool = false) -> Date {
    return get(.next,
               weekday,
               considerToday: considerToday)
  }

  func previous(_ weekday: Weekday, considerToday: Bool = false) -> Date {
    return get(.previous,
               weekday,
               considerToday: considerToday)
  }

  func get(_ direction: SearchDirection,
           _ weekDay: Weekday,
           considerToday consider: Bool = false) -> Date {

    let dayName = weekDay.rawValue

    let weekdaysName = getWeekDaysInEnglish().map { $0.lowercased() }

    assert(weekdaysName.contains(dayName), "weekday symbol should be in form \(weekdaysName)")

    let searchWeekdayIndex = weekdaysName.firstIndex(of: dayName)! + 1

    let calendar = Calendar(identifier: .gregorian)

    if consider && calendar.component(.weekday, from: self) == searchWeekdayIndex {
      return self
    }

    var nextDateComponent = calendar.dateComponents([.hour, .minute, .second], from: self)
    nextDateComponent.weekday = searchWeekdayIndex

    let date = calendar.nextDate(after: self,
                                 matching: nextDateComponent,
                                 matchingPolicy: .nextTime,
                                 direction: direction.calendarSearchDirection)

    return date!
  }

}

// MARK: Helper methods
extension Date {
  func getWeekDaysInEnglish() -> [String] {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "en_US_POSIX")
    return calendar.weekdaySymbols
  }

  enum Weekday: String {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
  }

  enum SearchDirection {
    case next
    case previous

    var calendarSearchDirection: Calendar.SearchDirection {
      switch self {
      case .next:
        return .forward
      case .previous:
        return .backward
      }
    }
  }
}
