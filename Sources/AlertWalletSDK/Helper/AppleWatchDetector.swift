//
//  AppleWatchDetector.swift
//  AEWallet
//
//  Created by aksh gaur on 01/11/23.
//

import WatchConnectivity
import os

final class AppleWatchDetector: NSObject {

    private static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: AppleWatchDetector.self)
    )

    static let shared = AppleWatchDetector()
    var session: WCSession?  = nil
    var watchPaired = false
    public weak var delegate: AlertWalletControllerDelegate?

    func detect() {
        if(WCSession.isSupported()){
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }else{
            Self.logger.error("AppleWatchDetector :: detect()  WCSession.isSupported()   is false  " )
        }
    }
}

extension AppleWatchDetector: WCSessionDelegate {

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        self.watchPaired = session.isPaired
    }

    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        Self.logger.debug("AppleWatchDetector :: session  Received application context: \(applicationContext)  " )
    }

    func sessionDidDeactivate(_ session: WCSession) {
    }

    func sessionDidBecomeInactive(_ session: WCSession) {
    }
}
