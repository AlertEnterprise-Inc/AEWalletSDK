//
//  File.swift
//
//
//  Created by Reddy on 22/08/24.
//

import Foundation
import UIKit
import PassKit
import WatchConnectivity

public class AlertWalletController: UIViewController {

    public static let shared = AlertWalletController()
    public var delegate: AlertWalletControllerDelegate?


    private init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
    }


    public func checkEligibility(){
        let serverURL = PropertiesManager.shared.getServerURL()
        print(" Server URL \(String(describing: serverURL))    ;;;")

    }

    public func initiateWatchDetection() {
        AppleWatchDetector.shared.delegate =  delegate
        AppleWatchDetector.shared.initialize()
    }

    public func isWatchPairedToPhone() {
        AppleWatchDetector.shared.checkIfWatchIsPaired()
    }

    public func startPassProvisioning(){
    }

    public func saveToWallet(parentViewController: UIViewController, thumbnail: String, displayName: String, description: String, saveLink: String){
    }

    public func syncPassToWatch(parentViewController: UIViewController, thumbnail: String, displayName: String, description: String, watchProvisioningBlob: String){
    }


}
