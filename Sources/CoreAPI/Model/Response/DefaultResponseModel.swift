import Foundation

public struct DefaultResponseModel: Decodable{
    
    let response: DefaultHeaderModel?
    
    enum CodingKeys: String, CodingKey {
        case response = "response"
    }
  
}
