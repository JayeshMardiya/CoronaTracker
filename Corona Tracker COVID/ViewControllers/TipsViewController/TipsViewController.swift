//
//  TipsViewController.swift
//  Corona Tracker COVID
//
//  Created by Jayesh Mardiya on 10/03/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import UIKit
import PDFKit

class TipsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Tips"
        
        // Add PDFView to view controller.
        let pdfView = PDFView(frame: self.view.bounds)
        self.view.addSubview(pdfView)

        // Fit content in PDFView.
        pdfView.autoScales = true
        pdfView.sizeToFit()
        
        // Load Sample.pdf file.
        if let fileURL = Bundle.main.path(forResource: "tips", ofType: "pdf") {
            if let pdfDocument = PDFDocument(url: URL(fileURLWithPath: fileURL)) {
                pdfView.autoScales = true
                pdfView.document = pdfDocument
            }
        }
    }
}
