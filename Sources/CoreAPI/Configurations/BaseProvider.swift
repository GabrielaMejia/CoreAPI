import Foundation
import Moya

extension BaseProvider {
    
    var authorizationType: AuthorizationType? {
        return .none
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
