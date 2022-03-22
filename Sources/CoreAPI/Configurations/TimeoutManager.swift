import Foundation
import Alamofire

class TimeoutManager: Alamofire.Session {
    
    static let current: TimeoutManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = TimeInterval(Constants.current.timeoutWindow)
        configuration.timeoutIntervalForResource = TimeInterval(Constants.current.timeoutWindow)
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return TimeoutManager(configuration: configuration)
    }()
    
}
