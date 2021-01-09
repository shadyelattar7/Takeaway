//
//  RateVC.swift
//  Takeaway
//
//  Created by Elattar on 1/3/21.
//  Copyright © 2021 Elattar. All rights reserved.
//

import UIKit
import Cosmos
class RateVC: UIViewController {

    @IBOutlet weak var starRate: CosmosView!
    @IBOutlet weak var addComment: UITextField!
    
    @IBOutlet weak var addRate_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView(){
        addRate_btn.layer.cornerRadius = 12
        
    }
    

    @IBAction func dismissView_btn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addRate_btn(_ sender: Any) {
    }
    
}
