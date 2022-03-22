import Foundation

struct DefaultHeaderModel: Decodable{
    
    let errorMessage: String?
    let errorCode: String?
    
    enum CodingKeys: String, CodingKey {
        case errorMessage = "errorMessage"
        case errorCode = "errorCode"
    }
  
}
