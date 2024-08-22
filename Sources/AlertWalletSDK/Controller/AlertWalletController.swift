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
        print("SDK viewDidLoad");
        print("<<<<");

    }


    public func checkEligibility(){
        print("SDK checkEligibility called didTapButton()");


    }

    public func isWatchPairedToPhone() {
        AppleWatchDetector.shared.checkIfWatchIsPaired()
    }

    public func startPassProvisioning(){
        print("SDK startPassProvisioning");


    }

    public func saveToWallet(parentViewController: UIViewController, thumbnail: String, displayName: String, description: String, saveLink: String){
        print("SDK saveToWallet");


    }

    public func syncPassToWatch(parentViewController: UIViewController, thumbnail: String, displayName: String, description: String, watchProvisioningBlob: String){
        print("SDK syncPassToWatch");

    }


}
