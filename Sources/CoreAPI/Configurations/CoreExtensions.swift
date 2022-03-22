import Foundation

extension Date {
    func toString() -> String {
        return DeviceLogger.dateFormatter.string(from: self as Date)
    }
}
