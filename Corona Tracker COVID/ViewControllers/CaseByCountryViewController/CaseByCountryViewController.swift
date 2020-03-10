//
//  CaseByCountryViewController.swift
//  Corona Tracker COVID
//
//  Created by Jayesh Mardiya on 10/03/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import UIKit
import Firebase
import MBProgressHUD

class CaseByCountryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arrCountryData: [Attributes] = []
    var arrCountryFilterData: [Attributes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Cases by Country"
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search country"
        if #available(iOS 13.0, *) {
            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            searchController.searchBar.set(textColor: .white)
            searchController.searchBar.setPlaceholder(textColor: .lightText)
            searchController.searchBar.setSearchImage(color: .white)
        }
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
        searchController.searchBar.delegate = self
        
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            searchController.searchBar.tintColor = .black
            searchController.searchBar.barTintColor = .white
        }
        definesPresentationContext = true
        
        self.getData()
    }
    
    func getData() {
        
        let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        let db = Firestore.firestore()
        db.collection("CoronaDetail").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                
                let dictionaries = querySnapshot?.documents.compactMap({$0.data()}) ?? []
                
                for document in dictionaries {
                    self.arrCountryData.append(Attributes.init(dictionary: document)!)
                }
                
                self.arrCountryData = self.arrCountryData.sorted(by: { $0.confirmed! > $1.confirmed! })
                self.arrCountryFilterData = self.arrCountryData
                self.tableView.reloadData()
                progressHUD.hide(animated: true)
            }
        }
    }
}

extension CaseByCountryViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty  else { self.arrCountryFilterData = self.arrCountryData; return }
        
        self.arrCountryFilterData = self.arrCountryData.filter({ attribute -> Bool in
            let region = attribute.countryRegion ?? ""
            let state = attribute.provinceState ?? ""
            let mergeRegionState = region + state
            return mergeRegionState.lowercased().contains(searchText.lowercased())
        })
        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        self.arrCountryFilterData = self.arrCountryData
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard !(searchBar.text!.isEmpty) else { self.arrCountryFilterData = self.arrCountryData; return }
        
        self.arrCountryFilterData = self.arrCountryData.filter({ attribute -> Bool in
            let region = attribute.countryRegion ?? ""
            let state = attribute.provinceState ?? ""
            let mergeRegionState = region + state
            return mergeRegionState.lowercased().contains(searchBar.text!.lowercased())
        })
        self.tableView.reloadData()
    }
}

extension CaseByCountryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrCountryFilterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CasesCountryWiseTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CasesCountryWiseTableViewCell", for: indexPath) as! CasesCountryWiseTableViewCell
        
        cell.labelCountryName.text = "\(self.arrCountryFilterData[indexPath.row].countryRegion ?? "") \(self.arrCountryFilterData[indexPath.row].provinceState ?? "")"
        cell.labelTotalConfirmed.text = "\(self.arrCountryFilterData[indexPath.row].confirmed ?? 0)"
        cell.labelTotalDeath.text = "\(self.arrCountryFilterData[indexPath.row].deaths ?? 0)"
        cell.labelTotalRecovered.text = "\(self.arrCountryFilterData[indexPath.row].recovered ?? 0)"
        
        return cell
    }
}
