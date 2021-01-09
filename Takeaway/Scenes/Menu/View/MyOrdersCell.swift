//
//  MyOrdersCell.swift
//  Takeaway
//
//  Created by Elattar on 1/2/21.
//  Copyright © 2021 Elattar. All rights reserved.
//

import UIKit

class MyOrdersCell: UITableViewCell {

    @IBOutlet weak var restaurant_iv: CircleImageView!
    @IBOutlet weak var restaurantName_lbl: UILabel!
    @IBOutlet weak var orderStatus: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var orderID_lbl: UILabel!
    @IBOutlet weak var orderWIllArrive_lbl: UILabel!
    @IBOutlet weak var delegateOrder_lbl: UILabel!
    @IBOutlet weak var call_btn: UIButton!
    var call: (() -> ())?
    var rate: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func rateOrder_btn(_ sender: Any) {
         rate?()
    }
    
    @IBAction func call_btn(_ sender: Any) {
        call?()
    }
    
}
