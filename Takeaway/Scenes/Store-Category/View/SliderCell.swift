//
//  SliderCell.swift
//  Takeaway
//
//  Created by Elattar on 12/27/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit

class SliderCell: UICollectionViewCell {
    
    @IBOutlet weak var sliderImage_iv: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        sliderImage_iv.layer.cornerRadius = 8
        sliderImage_iv.clipsToBounds = true
    }
    
    
    var image:UIImage!{
        didSet{
            sliderImage_iv.image = image
        }
    }
    
  
}
