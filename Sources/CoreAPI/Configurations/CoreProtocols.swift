import Foundation
import Moya
import RxMoya

protocol Requestable {
    var dictionary: [String: Any]? {get}
}

protocol BaseProvider: TargetType, AccessTokenAuthorizable {

}

protocol BaseProviderAuthorization: TargetType, AccessTokenAuthorizable {

}
