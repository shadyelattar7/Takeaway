//
//  OrderSummaryCell.swift
//  Takeaway
//
//  Created by Elattar on 1/5/21.
//  Copyright © 2021 Elattar. All rights reserved.
//

import UIKit

class OrderSummaryCell: UITableViewCell {

    @IBOutlet weak var itemName_lbl: UILabel!
    @IBOutlet weak var itemPrice_lbl: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
