import Foundation
import Moya
import RxMoya

protocol Requestable {
    var dictionary: [String: Any]? {get}
}

protocol BaseProvider: TargetType, AccessTokenAuthorizable {
    var request: Requestable {get}
}

protocol BaseProviderAuthorization: TargetType, AccessTokenAuthorizable {
    var request: Requestable {get}
}
