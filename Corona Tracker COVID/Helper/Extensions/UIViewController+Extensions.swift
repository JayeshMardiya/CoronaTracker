//
//  UIViewController+Extensions.swift
//  FilterMVC
//
//  Created by Jayesh Mardiya on 29/02/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func addChild(childController: UIViewController, to view: UIView) {
        self.addChild(childController)
        childController.view.frame = view.bounds
        view.addSubview(childController.view)
        childController.didMove(toParent: self)
    }
    
}
