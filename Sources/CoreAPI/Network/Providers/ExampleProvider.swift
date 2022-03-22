//
//  ExampleProvider.swift
//  
//
//  Created by Gabriela Mejia on 21/3/22.
//

import Moya
import Foundation

enum ExampleProvider {
    case exampleRequest
}

// MARK: - TargetType

extension ExampleProvider: BaseProvider {

    
    var path: String {
        return "path_service"
    }

    var method: Moya.Method {
        switch self {
        default: return .post
        }
    }
    
}
