//
//  File.swift
//  
//
//  Created by Reddy on 22/08/24.
//

import WatchConnectivity
final class AppleWatchDetector: NSObject {

    static let shared = AppleWatchDetector()
    var session: WCSession?  = nil
    var watchPaired = false

    func detect() {
        print("AppleWatchDetector.detect()  ==>" )
        if(WCSession.isSupported()){
            session = WCSession.default
            session?.delegate = self
            session?.activate()
            print("AppleWatchDetector.detect()  ==> YYYYY" )
        }else{
            print("WCSession.isSupported()   is false" )
            print("AppleWatchDetector.detect()  ==> NNNN"  )
        }
    }
}

extension AppleWatchDetector: WCSessionDelegate {

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {

        print("Received session session: \(session)")
        print("Received session session.isPaired: \(session.isPaired)")
        self.watchPaired = session.isPaired

        switch activationState {
             case .activated:
                 print("WCSession activated successfully")
             case .inactive:
                 print("Unable to activate the WCSession. Error: \(error?.localizedDescription ?? "--")")
             case .notActivated:
                 print("Unexpected .notActivated state received after trying to activate the WCSession")
             @unknown default:
                 print("Unexpected state received after trying to activate the WCSession")
        }

    }

    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        print("Received application context: \(applicationContext)")
    }

    func sessionDidDeactivate(_ session: WCSession) {
        print("Received sessionDidDeactivate: \(session)")

    }

    func sessionDidBecomeInactive(_ session: WCSession) {
        print("Received sessionDidDeactivate: \(session)")
    }
}
