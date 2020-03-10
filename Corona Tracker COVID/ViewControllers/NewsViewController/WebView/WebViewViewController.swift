//
//  WebViewViewController.swift
//  Corona Tracker COVID
//
//  Created by Niraj on 10/03/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import UIKit
import WebKit
import MBProgressHUD

class WebViewViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var urlString: String = ""
    var progressHUD:  MBProgressHUD!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News"
        
        let url = URL(string: urlString)!
        //webView.navigationDelegate = self
        //webView.uiDelegate = self
        webView.load(URLRequest(url: url))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension WebViewViewController: WKNavigationDelegate, WKUIDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressHUD.hide(animated: true)
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        progressHUD.hide(animated: true)
    }
}
