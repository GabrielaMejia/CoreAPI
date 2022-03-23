import Foundation
import Reachability

fileprivate var reachability: Reachability!

protocol ReachabilityActionDelegate {
    func reachabilityChanged(_ isReachable: Bool)
}

protocol ReachabilityObserverDelegate: AnyObject, ReachabilityActionDelegate {
    func addReachabilityObserver() throws
    func removeReachabilityObserver()
}

extension ReachabilityObserverDelegate {
    
    func addReachabilityObserver() throws {
        reachability = try Reachability()
        
        let hasInternet = !(reachability.connection == .unavailable)
        self.reachabilityChanged(hasInternet)
        
        reachability.whenReachable = { [weak self] reachability in
            self?.reachabilityChanged(true)
        }
        
        reachability.whenUnreachable = { [weak self] reachability in
            self?.reachabilityChanged(false)
        }
        
        try reachability.startNotifier()
    }
    
    func removeReachabilityObserver() {
        reachability.stopNotifier()
        reachability = nil
    }
}
