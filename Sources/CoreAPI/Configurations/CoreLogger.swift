import Foundation

final class CoreLogger {
    
    static var dateFormat = "yyyy-MM-dd hh:mm:ssSSS"
    
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    
    static func debug( _ object: Any,
                       filename: String = #file,
                       line: Int = #line,
                       column: Int = #column,
                       funcName: String = #function) {
        let message: String = "\(Date().toString()) \(LogEvent.debug.rawValue)[\(sourceFileName(filePath: filename))]: Line: \(line) Column: \(column) Func Name: \(funcName) -> \(object)"
        print(message)
        Constants.current.logMessages += "\(message)\n"
    }
    
    private static func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
}
