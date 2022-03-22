import Foundation
import Moya

extension BaseProviderAuthorization {
    
    var authorizationType: AuthorizationType? {
        return .bearer
    }
    
    var baseURL: URL {
        return  URL(string: Constants.current.baseURL)!
    }
    
    var headers: [String : String]? {
        return MoyaDefaults.defaultHeaders
    }
    
    
    var task: Task {
        return  .requestPlain
    }
}
