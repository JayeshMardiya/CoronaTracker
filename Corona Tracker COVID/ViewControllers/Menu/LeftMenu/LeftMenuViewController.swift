//
//  SideMenuTableViewController.swift
//  Legacy Directional
//
//  Created by Jayesh Mardiya 28/02/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import SideMenu

var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)

class LeftMenuViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private let arrayMenuItemTitle: [String] = ["Home", "Cases by Country", "Tips", "News about Vaccine", "News"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension LeftMenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMenuItemTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        cell.labelMenuTitle.text = self.arrayMenuItemTitle[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            print("0")
            if indexPath == selectedIndex {
                self.dismiss(animated: true, completion: nil)
            } else {
                selectedIndex = indexPath
                let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
                if #available(iOS 13.0, *) {
                    let viewController: HomeViewController = mainStoryboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
                    self.navigationController?.pushViewController(viewController, animated: false)
                } else {
                    // Fallback on earlier versions
                    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
                    self.navigationController?.pushViewController(viewController, animated: false)
                }
            }
        case 1:
            print("1")
            if indexPath == selectedIndex {
                self.dismiss(animated: true, completion: nil)
            } else {
                selectedIndex = indexPath
                let viewController: CaseByCountryViewController = CaseByCountryViewController
                    .storyboardInstance
                    .instantiate()
                self.navigationController?.pushViewController(viewController, animated: false)
            }
        case 2:
            print("2")
            if indexPath == selectedIndex {
                self.dismiss(animated: true, completion: nil)
            } else {
                selectedIndex = indexPath
                let viewController: TipsViewController = TipsViewController
                    .storyboardInstance
                    .instantiate()
                self.navigationController?.pushViewController(viewController, animated: false)
            }
            
        case 3:
            print("3")
            if indexPath == selectedIndex {
                self.dismiss(animated: true, completion: nil)
            } else {
                selectedIndex = indexPath
                let viewController: VaccineViewController = VaccineViewController
                    .storyboardInstance
                    .instantiate()
                self.navigationController?.pushViewController(viewController, animated: false)
            }
            
        case 4:
            print("4")
            if indexPath == selectedIndex {
                self.dismiss(animated: true, completion: nil)
            } else {
                selectedIndex = indexPath
                let viewController: NewsViewController = NewsViewController
                    .storyboardInstance
                    .instantiate()
                self.navigationController?.pushViewController(viewController, animated: false)
            }
            
        default:
            print("Default")
        }
    }
}
