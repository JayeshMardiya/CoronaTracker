//
//  CasesCountryWiseTableViewCell.swift
//  Corona Tracker COVID
//
//  Created by Jayesh Mardiya on 10/03/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import UIKit

class CasesCountryWiseTableViewCell: UITableViewCell {

    @IBOutlet weak var labelCountryName: UILabel!
    @IBOutlet weak var labelTotalConfirmed: UILabel!
    @IBOutlet weak var labelTotalDeath: UILabel!
    @IBOutlet weak var labelTotalRecovered: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
