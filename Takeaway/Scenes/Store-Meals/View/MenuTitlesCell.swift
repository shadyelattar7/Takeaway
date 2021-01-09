//
//  MenuTitlesCell.swift
//  Takeaway
//
//  Created by Elattar on 12/29/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit

class MenuTitlesCell: UICollectionViewCell {
    @IBOutlet weak var title_lbl: UILabel!
    @IBOutlet weak var lineVIew: UIView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        lineVIew.backgroundColor = .clear
       
    }
    override var isSelected: Bool{
        didSet{
            UIView.animate(withDuration: 0.5) {
                self.lineVIew.backgroundColor = self.isSelected ? UIColor.black : UIColor.clear
                
            }
        }
    }
}
