//
//  VaccineViewController.swift
//  Corona Tracker COVID
//
//  Created by Jayesh Mardiya on 10/03/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import UIKit

class VaccineViewController: UIViewController {

    @IBOutlet weak var labelUpdatedOn: UILabel!
    @IBOutlet weak var labelSource: UILabel!
    @IBOutlet weak var tvData: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "News about Vaccine"
    }
}
