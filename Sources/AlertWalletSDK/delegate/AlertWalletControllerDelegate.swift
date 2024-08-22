//
//  File.swift
//  
//
//  Created by Reddy on 22/08/24.
//

import Foundation


public protocol AlertWalletControllerDelegate: AnyObject {
    func didTapButton()
    func didUpdateButtonTitle(to title: String)
    func didUpdateBackgroundColor(displayName: String)
    func viewDidAppear()
}
