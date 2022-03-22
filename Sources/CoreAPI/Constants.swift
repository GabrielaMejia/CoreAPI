import Foundation

final class Constants {
    
    var environment: Environment = .development
    var timeoutWindow: Int = 60
    
    static let current: Constants = {
        let constants = Constants()
        return constants
    }()
   
    var baseURL: String{
        switch environment {
        case .production:
            return "url_production"
        case .staging:
            return "url_staging"
        default:
            return "url_development"
        }
    }
    
    var logMessages: String = ""
    
    private init() {
        
    }
    
}
