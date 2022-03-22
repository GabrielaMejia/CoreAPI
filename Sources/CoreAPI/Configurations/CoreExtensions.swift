import Foundation

extension Date {
    func toString() -> String {
        return CoreLogger.dateFormatter.string(from: self as Date)
    }
}
