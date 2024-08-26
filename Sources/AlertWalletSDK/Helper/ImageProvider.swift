//
//  File.swift
//  
//
//  Created by Reddy on 26/08/24.
//

import Foundation
import UIKit

public class ImageProvider {

    public init() {}

    public func image(named imageName: String) -> UIImage? {
       /*** for COCOpod */
        //return UIImage(named: imageName, in: Bundle(for: type(of: self)), compatibleWith: nil)
       //for SPM
        return UIImage(named: imageName, in: .module, compatibleWith: nil)
    }
}

