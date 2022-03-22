import Foundation
import Moya

extension BaseProviderAuthorization {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
    
    var baseURL: URL {
        return  URL(string: Constants.current.baseURL)!
    }
    
    var headers: [String: String]? {
        if let request = request.dictionary {
            if let requestHeaders = request as? [String: String] {
                return requestHeaders
            }
        }
        return [String: String]()
    }
    
    var task: Task {
        return  .requestPlain
    }
}
