//
//  HomeViewController.swift
//  Corona Tracker COVID
//
//  Created by Jayesh Mardiya on 10/03/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelTotalConfirmed: UILabel!
    @IBOutlet weak var labelTotalDeath: UILabel!
    @IBOutlet weak var labelTotalRecovered: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.labelTotalConfirmed.text = "-"
        self.labelTotalDeath.text = "-"
        self.labelTotalRecovered.text = "-"
        
        self.setupSideMenu()
        self.updateMenus()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "LeftMenuNavigationController" {
            guard let sideMenuNavigationController = segue.destination as? SideMenuNavigationController else { return }
            sideMenuNavigationController.settings = makeSettings()
        }
    }
    
    private func setupSideMenu() {
        // Define the menus
        
        let storyboard = UIStoryboard.init(name: "LeftMenuViewController", bundle: nil)
        SideMenuManager.default.leftMenuNavigationController = storyboard.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? SideMenuNavigationController
        
        // Enable gestures. The left and/or right menus must be set up above for these to work.
        // Note that these continue to work on the Navigation Controller independent of the View Controller it displays!
        SideMenuManager.default.addPanGestureToPresent(toView: navigationController!.navigationBar)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: view)
    }
    
    private func updateMenus() {
        let settings = makeSettings()
        SideMenuManager.default.leftMenuNavigationController?.settings = settings
    }
    
    private func selectedPresentationStyle() -> SideMenuPresentationStyle {
        return .menuSlideIn
    }
    
    private func makeSettings() -> SideMenuSettings {
        
        let presentationStyle = selectedPresentationStyle()
        presentationStyle.backgroundColor = .white
        presentationStyle.menuStartAlpha = 1.0
        presentationStyle.menuScaleFactor = 1.0
        presentationStyle.onTopShadowOpacity = 1.0
        presentationStyle.presentingEndAlpha = 1.0
        presentationStyle.presentingScaleFactor = 1.0
        
        var settings = SideMenuSettings()
        settings.presentationStyle = presentationStyle
        settings.menuWidth = 250
        settings.statusBarEndAlpha = 0.0
        let styles:[UIBlurEffect.Style?] = [nil, .dark, .light, .extraLight]
        settings.blurEffectStyle = styles[0]
        
        return settings
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
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
