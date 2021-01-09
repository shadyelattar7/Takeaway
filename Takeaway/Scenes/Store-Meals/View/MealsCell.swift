//
//  MealsCell.swift
//  Takeaway
//
//  Created by Elattar on 1/2/21.
//  Copyright © 2021 Elattar. All rights reserved.
//

import UIKit

class MealsCell: UITableViewCell {

    @IBOutlet weak var meal_iv: UIImageView!
    @IBOutlet weak var mealName_lbl: UILabel!
    @IBOutlet weak var mealDescripation_lbl: UITextView!
    @IBOutlet weak var delete_btn: UIButton!
    
    @IBOutlet weak var counterView: UIView!
    
    @IBOutlet weak var counter_lbl: UILabel!
    
    @IBOutlet weak var price_lbl: UILabel!
    var delete: (() -> ())?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        counterView.layer.cornerRadius = counterView.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func delete_btn(_ sender: Any) {
        
        delete?()
    }
}
