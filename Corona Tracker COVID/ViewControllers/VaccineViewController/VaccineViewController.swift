//
//  VaccineViewController.swift
//  Corona Tracker COVID
//
//  Created by Jayesh Mardiya on 10/03/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import UIKit
import Firebase
import MBProgressHUD
import SDWebImage


class VaccineViewController: UIViewController {

    @IBOutlet weak var labelUpdatedOn: UILabel!
    @IBOutlet weak var labelSource: UILabel!
    @IBOutlet weak var tvData: UITextView!
    
    var vaccineModels: [VaccineModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "News about Vaccine"
        self.getVaccine()
    }
    
    func getVaccine() {
        
        let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        let db = Firestore.firestore()
        db.collection("Vaccine").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                
                let dictionaries = querySnapshot?.documents.compactMap({$0.data()}) ?? []
                
                for document in dictionaries {
                    self.vaccineModels.append(VaccineModel.init(dictionary: document)!)
                }
                self.labelUpdatedOn.text = "Updated on: " + self.vaccineModels[0].date!
                self.labelSource.text = "Source: " + self.vaccineModels[0].source!
                self.tvData.text = self.vaccineModels[0].description!
                progressHUD.hide(animated: true)
            }
        }
    }
}
