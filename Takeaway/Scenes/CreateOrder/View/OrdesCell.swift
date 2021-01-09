//
//  OrdesCell.swift
//  Takeaway
//
//  Created by Elattar on 12/31/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit

class OrdesCell: UITableViewCell {
    @IBOutlet weak var viewX: UIView!
    @IBOutlet weak var orderTitle: UILabel!
    @IBOutlet weak var orderPrice_lb: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewX.layer.cornerRadius = 12.0
//        viewX.layer.borderWidth = 0.0
//        viewX.layer.shadowColor = #colorLiteral(red: 0.5411764706, green: 0.5843137255, blue: 0.6196078431, alpha: 1)
//        viewX.layer.shadowOffset = CGSize(width: 0, height: 0)
//        viewX.layer.shadowRadius = 5.0
//        viewX.layer.shadowOpacity = 0.5
//        viewX.layer.masksToBounds = false
//        viewX.backgroundColor = UIColor.white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
