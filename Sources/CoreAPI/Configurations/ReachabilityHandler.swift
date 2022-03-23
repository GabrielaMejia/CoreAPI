import Foundation

class ReachabilityHandler: ReachabilityObserverDelegate {
    
    //MARK: Lifecycle
    private var hasInternet = false
    
    static let current: ReachabilityHandler = {
       let instance = ReachabilityHandler()
        return instance
    }()
    
    required init() {
        try? addReachabilityObserver()
    }
    
    deinit {
        removeReachabilityObserver()
    }
    
    func hasConnection()->Bool{
        return self.hasInternet
    }
    
    func reachabilityChanged(_ isReachable: Bool) {
        self.hasInternet = isReachable
    }
    
}
