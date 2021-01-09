//
//  AccountInfoVC.swift
//  Takeaway
//
//  Created by Elattar on 1/2/21.
//  Copyright © 2021 Elattar. All rights reserved.
//

import UIKit
import BEMCheckBox

class AccountInfoVC: UIViewController,BEMCheckBoxDelegate {

    @IBOutlet weak var firstName_tf: UITextField!
    @IBOutlet weak var lastName_tf: UITextField!
    @IBOutlet weak var email_tf: UITextField!
    @IBOutlet weak var date_tf: UITextField!
    @IBOutlet weak var maleCheck: BEMCheckBox!
    @IBOutlet weak var femaleCheck: BEMCheckBox!
    @IBOutlet weak var save_btn: UIButton!
    
    
    var gender: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    

    private  func setupView(){
        self.title = "Account info"
        self.setBackbtn()
        save_btn.layer.cornerRadius = 12
        maleCheck.delegate = self
        femaleCheck.delegate = self
        maleCheck.boxType = .square
        femaleCheck.boxType = .square
        
    }
    
    func didTap(_ checkBox: BEMCheckBox) {
        if checkBox.tag == 0 {
            maleCheck.setOn(true, animated: true)
            femaleCheck.setOn(false, animated: true)
            gender = "Male"
        }else if checkBox.tag == 1 {
            femaleCheck.setOn(true, animated: true)
            maleCheck.setOn(false, animated: true)
            gender = "Female"
        }
    }

    @IBAction func save_btn(_ sender: Any) {
        
        print("SaveBtn")
    }
}
