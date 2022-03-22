import Foundation
import Moya

enum LogEvent: String {
   case debug = "[💬 DEBUG INFO]"
}

public enum Environment: String {
    case development
    case staging
    case production
}

enum MoyaDefaults {
    
    static let plugins: [PluginType] = [
        NetworkLoggerPlugin(),
        SecureRequestPlugin()
    ]

    static let secureMethods: [Moya.Method] = [.get, .post, .put, .delete]

    static let defaultHeaders = [
        "Content-Type": "application/json",
    ]
    
}
