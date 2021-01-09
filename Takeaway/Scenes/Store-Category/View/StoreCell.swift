//
//  StoreCell.swift
//  Takeaway
//
//  Created by Elattar on 12/27/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit

class StoreCell: UITableViewCell {

    @IBOutlet weak var viewX: UIView!
    @IBOutlet weak var store_iv: UIImageView!
    @IBOutlet weak var storeName_lbl: UILabel!
    @IBOutlet weak var storeKind_lbl: UILabel!
    @IBOutlet weak var storeDistance_lbl: UILabel!
    @IBOutlet weak var storeRate_lbl: UILabel!
    @IBOutlet weak var storeIsClose_lbl: UILabel!
    
    let width: CGFloat = 200
    let height: CGFloat = 200
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewX.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        viewX.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        viewX.layer.shadowOpacity = 1.0
        viewX.layer.shadowRadius = 0.0
        viewX.layer.masksToBounds = false
        viewX.layer.cornerRadius = 12
    
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
