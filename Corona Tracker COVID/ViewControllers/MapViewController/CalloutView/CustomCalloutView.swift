//
//  CustomCalloutView.swift
//  AppCarsMacBook
//
//  Created by Igor W on 07.04.16.
//  Copyright © 2016 Igor W. All rights reserved.
//

import UIKit
import MapKit

class CustomCalloutView: MKAnnotationView {

    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var confirmed: UILabel!
    @IBOutlet weak var death: UILabel!
    @IBOutlet weak var recovered: UILabel!
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)
        if hitView != nil {
            superview?.bringSubviewToFront(self)
        }
        return hitView
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let rect = self.bounds
        var isInside = rect.contains(point)
        if !isInside {
            for view in subviews {
                isInside = view.frame.contains(point)
                if isInside {
                    break
                }
            }
        }
        return isInside
    }
}
