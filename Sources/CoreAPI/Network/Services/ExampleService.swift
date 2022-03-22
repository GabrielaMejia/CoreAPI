import Moya
import RxSwift

final class ExampleService {
    
    static let current: ExampleService = {
       let instance = ExampleService()
        return instance
    }()
    
    private let provider = MoyaProvider<ExampleProvider>(
        session: TimeoutManager.current,
        plugins: MoyaDefaults.plugins
    )
    
    func exampleRequest(requestModel: ExampleRequestModel)->Single<DefaultResponseModel>{
        let request = provider.rx
            .request(.exampleRequest)
            .filterSuccessfulStatusCodes()
            .map(DefaultResponseModel.self)
        return request
    }
  
    func exampleRequest2(requestModel: ExampleRequestModel)->Single<DefaultResponseModel>{
        let request = provider.rx
            .request(.exampleRequest)
            .map(DefaultResponseModel.self)
        return request
    }
}
