//
//  File.swift
//  
//
//  Created by Reddy on 22/08/24.
//

import WatchConnectivity
final class AppleWatchDetector: NSObject , WCSessionDelegate {
    
    public static let shared = AppleWatchDetector()
    public weak var delegate: AlertWalletControllerDelegate?

    private override init() {
            super.init()
            if WCSession.isSupported() {
                WCSession.default.delegate = self
                WCSession.default.activate()
            }
        }


    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        print("AAAAA");
    }

    func sessionDidBecomeInactive(_ session: WCSession) {
        print("DDDD");
    }

    func sessionDidDeactivate(_ session: WCSession) {
        WCSession.default.activate()
    }

    public func checkIfWatchIsPaired() {
            if WCSession.isSupported() {
                let isPaired = WCSession.default.isPaired
                delegate?.isWatchPaired(AlertWalletController.shared, isWatchPaired: isPaired)
            }
        }
    public func sessionWatchStateDidChange(_ session: WCSession) {
            let isPaired = session.isPaired
        delegate?.isWatchPaired(AlertWalletController.shared, isWatchPaired: isPaired)
        }

}


