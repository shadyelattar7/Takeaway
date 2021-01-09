//
//  MyWallet.swift
//  Takeaway
//
//  Created by Elattar on 1/5/21.
//  Copyright © 2021 Elattar. All rights reserved.
//

import UIKit

class MyWallet: UIViewController {

    @IBOutlet weak var moneyInWallet_lbl: UILabel!
    @IBOutlet weak var manager_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        self.title =  "My Wallet"
             self.setBackbtn()
        manager_btn.layer.cornerRadius = 12
    }
    

    @IBAction func manager_btn(_ sender: Any) {
        //ManageCardsVC
        
        let sb = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "ManageCardsVC") as! ManageCardsVC
        
        self.navigationController?.pushViewController(sb, animated: true)
        
    }
    
}
