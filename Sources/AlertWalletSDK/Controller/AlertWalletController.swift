//
//  File.swift
//
//
//  Created by Reddy on 22/08/24.
//

import Foundation
import UIKit
import PassKit

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

    }


    public func checkEligibility(){
        print("SDK checkEligibility called didTapButton()");


    }

    public func isWatchPairedToPhone() {
        var watchDetector = AppleWatchDetector()
        watchDetector.detect()
        let isParied = watchDetector.watchPaired
        print("AlertWalletController  isWatchPairedToPhone :: isParied " ,isParied)
        delegate?.isWatchPaired(self, isWatchPaired : isParied)
    }

    public func startPassProvisioning(){
        print("SDK startPassProvisioning");
        let title = "GGGG"


    }

    public func saveToWallet(parentViewController: UIViewController, thumbnail: String, displayName: String, description: String, saveLink: String){
        print("SDK saveToWallet");


    }

    public func syncPassToWatch(parentViewController: UIViewController, thumbnail: String, displayName: String, description: String, watchProvisioningBlob: String){
        print("SDK syncPassToWatch");

    }


}
