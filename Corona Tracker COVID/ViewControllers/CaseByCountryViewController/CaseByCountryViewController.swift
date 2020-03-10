//
//  CaseByCountryViewController.swift
//  Corona Tracker COVID
//
//  Created by Jayesh Mardiya on 10/03/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import UIKit

class CaseByCountryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
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
    }
}

extension CaseByCountryViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

extension CaseByCountryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CasesCountryWiseTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CasesCountryWiseTableViewCell", for: indexPath) as! CasesCountryWiseTableViewCell
        
        cell.labelCountryName.text = "-"
        cell.labelTotalConfirmed.text = "-"
        cell.labelTotalDeath.text = "-"
        cell.labelTotalRecovered.text = "-"
        
        return cell
    }
}
