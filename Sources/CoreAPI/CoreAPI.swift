import Connectivity
import RxSwift

public struct CoreAPI {
    
    let text = "Hello, World!"
    let connectivity: Connectivity = Connectivity()
    let exampleService = ExampleService.current
    
    public static let current: CoreAPI = {
        let constants = CoreAPI(environment: Constants.current.environment, timeoutAllowed: Constants.current.timeoutWindow)
        return constants
    }()
   
    init(){
        
    }
    public init(environment: Environment, timeoutAllowed: Int = 60){
        Constants.current.environment = environment
        Constants.current.timeoutWindow = timeoutAllowed
    }
    
    public func hasConnection()->Bool{
        var connection = false
        connectivity.checkConnectivity { connectivity in
            let status = connectivity.status
            if status == .connected || status == .connectedViaWiFi || status == .connectedViaCellular || status == .connectedViaEthernet{
                connection = true
            }
        }
        return connection
    }
    
    public func executeExampleService(exampleVar1: String, exampleVar2: String) -> Single <DefaultResponseModel>{
        let requestModel = ExampleRequestModel(exampleVar1: exampleVar1,
                                               exampleVar2: exampleVar2)
        return exampleService
            .exampleRequest(requestModel: requestModel)
            .map { responseModel -> DefaultResponseModel in
                return responseModel
            }.asObservable().asSingle()
    }
    
}

