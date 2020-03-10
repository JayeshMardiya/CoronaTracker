//
//  UINavigationController+Extensions.swift
//  Legacy Directional
//
//  Created by Jayesh Mardiya on 03/03/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import UIKit

extension UINavigationController {

    open override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .primaryColor
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
            navigationItem.standardAppearance = appearance
            navigationItem.scrollEdgeAppearance = appearance
        } else {
            // Fallback on earlier versions
        }
    }
}
