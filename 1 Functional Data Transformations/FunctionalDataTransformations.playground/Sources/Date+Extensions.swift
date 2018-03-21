import Foundation

public extension Date {
    
    /** Constructs Date from day / month / year. Note that first index is 1, not 0 */
    init(day: Int, month: Int, year: Int) {
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone.current
        
        var components = DateComponents()
        components.calendar = calendar
        components.day = day
        components.month = month
        components.year = year
        
        self = calendar.date(from: components)!
    }
}
