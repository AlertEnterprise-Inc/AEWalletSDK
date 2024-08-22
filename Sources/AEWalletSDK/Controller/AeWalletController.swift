//
//  File.swift
//  
//
//  Created by Reddy on 22/08/24.
//

import Foundation
import UIKit

public class AeWalletController: UIViewController {

    public weak var delegate: AeWalletControllerDelegate?

    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let button = UIButton(type: .system)
        button.setTitle("Tap me!", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func buttonTapped() {
        delegate?.didTapButton()
    }
}
