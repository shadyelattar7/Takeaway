//
//  CategoryCell.swift
//  Takeaway
//
//  Created by Elattar on 12/27/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var viewX: UIView!
    @IBOutlet weak var item_iv: UIImageView!
    @IBOutlet weak var item_lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewX.layer.cornerRadius = 12
    }

}
