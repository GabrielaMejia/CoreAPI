import Foundation

class BaseRequest: Codable, Requestable {
    
    var headerName: String = ""

    private enum CodingKeys: String, CodingKey {
        case headerName = "header_name"
    }

    init() {
       
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        headerName = try values.decode(String.self, forKey: .headerName)
    }

     func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(headerName, forKey: .headerName)
    }
}
