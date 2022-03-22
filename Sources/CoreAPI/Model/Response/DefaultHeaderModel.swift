import Foundation

public struct DefaultHeaderModel: Decodable{
    
    public let errorMessage: String?
    public let errorCode: String?
    
    enum CodingKeys: String, CodingKey {
        case errorMessage = "errorMessage"
        case errorCode = "errorCode"
    }
  
}
