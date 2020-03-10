//
//  SideMenuTableViewController.swift
//  Legacy Directional
//
//  Created by Jayesh Mardiya 28/02/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import SideMenu

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
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = self.arrayMenuItemTitle[indexPath.row]
        
        let view: UIView = UIView(frame: CGRect(x: 0, y: cell.bounds.size.height-1, width: cell.bounds.size.width, height: 1))
        view.backgroundColor = UIColor.white
        cell.addSubview(view)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        self.dismiss(animated: true, completion: nil)
        
        switch indexPath.row {
        case 0:
            print("0")
            let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
            if #available(iOS 13.0, *) {
                let viewController: HomeViewController = mainStoryboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
                self.navigationController?.pushViewController(viewController, animated: false)
            } else {
                // Fallback on earlier versions
                let viewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController")
                self.navigationController?.pushViewController(viewController, animated: false)
            }
        case 1:
            print("1")
            let viewController: CaseByCountryViewController = CaseByCountryViewController
                .storyboardInstance
                .instantiate()
            self.navigationController?.pushViewController(viewController, animated: false)
        case 2:
            print("2")
            let viewController: TipsViewController = TipsViewController
                .storyboardInstance
                .instantiate()
            self.navigationController?.pushViewController(viewController, animated: false)
        case 3:
            print("3")
            let viewController: VaccineViewController = VaccineViewController
                .storyboardInstance
                .instantiate()
            self.navigationController?.pushViewController(viewController, animated: false)
        case 4:
            print("4")
            let viewController: NewsViewController = NewsViewController
                .storyboardInstance
                .instantiate()
            self.navigationController?.pushViewController(viewController, animated: false)
        default:
            print("Default")
        }
    }
}
