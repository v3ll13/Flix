//
//  RatedCell.swift
//  Flix_Part1
//
//  Created by MacBookPro9 on 9/17/18.
//  Copyright © 2018 MacBookPro9. All rights reserved.
//

import UIKit

class RatedCell: UITableViewCell {

    
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var rtdTitle: UILabel!
    @IBOutlet weak var rtdOverview: UILabel!
    @IBOutlet weak var rtdRate: UILabel!
    
      var rateGiven : Double = 0.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
