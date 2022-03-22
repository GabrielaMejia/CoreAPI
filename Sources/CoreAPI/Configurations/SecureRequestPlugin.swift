import Foundation
import Moya

final class SecureRequestPlugin: PluginType {
    
    // MARK: - Prepare Request
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        let isSecureMethod = MoyaDefaults.secureMethods.contains(target.method)
        guard isSecureMethod else { return request }
        
        switch target.task {
        case let .requestParameters(parameters, _):
            var secureRequest = request
                                    
            #if DEBUG
                CoreLogger.debug(parameters)
            #endif
            
            if secureRequest.method == .post {
                do {
                    secureRequest.httpBody = try JSONSerialization.data(
                        withJSONObject: parameters,
                        options: .sortedKeys
                    )
                    return secureRequest
                } catch {}
            } else {
                return secureRequest
            }
        case let .requestCompositeParameters(bodyParameters, _, _):
            let secureRequest = request
                                    
            #if DEBUG
                CoreLogger.debug(bodyParameters)
            #endif
            return secureRequest
            
        case let .requestCompositeData(_, urlParameters):
            var secureRequest = request
            #if DEBUG
                CoreLogger.debug(urlParameters)
            #endif
            secureRequest.httpBody = nil
            return secureRequest
        default: break
        }
        return request
    }
    
    // MARK: - Prepare Response
    
    func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError> {
        switch result {
        case let .success(response):
            do {
                let jsonData = try JSONSerialization.jsonObject(
                    with: response.data,
                    options: .allowFragments
                )

                let plainRequestInfo: [String: Any] = [
                    "Data": jsonData
                ]

                #if DEBUG
                    CoreLogger.debug(plainRequestInfo)
                #endif

                let plainRequestData = try JSONSerialization.data(
                    withJSONObject: jsonData,
                    options: []
                )

                let plainResponse = Response(
                    statusCode: response.statusCode,
                    data: plainRequestData,
                    request: response.request,
                    response: response.response
                )
                return .success(plainResponse)

            } catch {}

        default: break
        }
        return result
    }
}

