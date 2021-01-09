//
//  AddressCell.swift
//  Takeaway
//
//  Created by Elattar on 1/2/21.
//  Copyright © 2021 Elattar. All rights reserved.
//

import UIKit

class AddressCell: UITableViewCell {
    @IBOutlet weak var address_lbl: UILabel!
    @IBOutlet weak var subAddress_lbl: UILabel!
     var delete: (() -> ())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteAddress_btn(_ sender: Any) {
        delete?()
    }
}
