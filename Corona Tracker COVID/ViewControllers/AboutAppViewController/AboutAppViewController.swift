//
//  AboutAppViewController.swift
//  Corona Tracker COVID
//
//  Created by Jayesh Mardiya on 10/03/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import UIKit
import WebKit
import Firebase
import MBProgressHUD

class AboutAppViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "About an Corona Tracker COVID"
        // Do any additional setup after loading the view.
        
        self.getAboutData()
    }
    
    func getAboutData() {
        
        let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        let db = Firestore.firestore()
        db.collection("AboutApp").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                
                let dictionaries = querySnapshot?.documents.compactMap({$0.data()}) ?? []
                
                for document in dictionaries {
                    if let urlString = document["sourceUrl"] as? String {
                        if let url = URL(string: urlString) {
                            self.webView.load(URLRequest(url: url))
                        }
                    }
                }

                progressHUD.hide(animated: true)
            }
        }
    }
}
