import Foundation

struct DefaultResponseModel: Decodable{
    
    let response: DefaultHeaderModel?
    
    enum CodingKeys: String, CodingKey {
        case response = "response"
    }
  
}
