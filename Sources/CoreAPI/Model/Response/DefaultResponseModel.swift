import Foundation

public struct DefaultResponseModel: Decodable{
    
    public let response: DefaultHeaderModel?
    
    enum CodingKeys: String, CodingKey {
        case response = "response"
    }
  
}
