//
//  File.swift
//
//
//  Created by Reddy on 22/08/24.
//

import Foundation
import UIKit

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
        print("SDK checkEligibility");

    }

    public func isWatchPairedToPhone() -> Bool {
        print("SDK isWatchPairedToPhone");
        return false;
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
