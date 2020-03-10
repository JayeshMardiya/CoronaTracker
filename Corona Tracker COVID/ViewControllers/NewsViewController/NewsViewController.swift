//
//  NewsViewController.swift
//  Corona Tracker COVID
//
//  Created by Jayesh Mardiya on 10/03/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import UIKit
import Firebase
import MBProgressHUD
import SDWebImage

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var newsModels:[NewsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "News"
        self.getNews()
    }
    
    func getNews() {
        
        let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        let db = Firestore.firestore()
        db.collection("News").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                
                let dictionaries = querySnapshot?.documents.compactMap({$0.data()}) ?? []
                
                for document in dictionaries {
                    self.newsModels.append(NewsModel.init(dictionary: document)!)
                }
                
                self.tableView.reloadData()
                progressHUD.hide(animated: true)
            }
        }
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.newsModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        let newsModel = self.newsModels[indexPath.row]
        cell.labelNewsTitle.text = newsModel.title!
        cell.coverImageView.sd_setImage(with: URL(string: newsModel.imageURL!), placeholderImage: UIImage(named: "placeholder.png"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController: WebViewViewController = WebViewViewController
            .storyboardInstance
            .instantiate()
        viewController.urlString = self.newsModels[indexPath.row].newURL!
        viewController.titleString = self.newsModels[indexPath.row].title!
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
