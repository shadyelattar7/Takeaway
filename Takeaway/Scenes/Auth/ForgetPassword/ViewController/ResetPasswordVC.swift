//
//  ResetPasswordVC.swift
//  Takeaway
//
//  Created by Elattar on 12/20/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit

class ResetPasswordVC: UIViewController {
   
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var next_btn: UIButton!
    @IBOutlet weak var password_tf: UITextField!
    @IBOutlet weak var confirmPassword_tf: UITextField!
    @IBOutlet weak var passwordEye_btn: UIButton!
    @IBOutlet weak var confirmPassEye_btn: UIButton!
    
    private var iconClick = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        passwordView.backgroundColor = .white
        passwordView.layer.cornerRadius = 12
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.lightGray.cgColor
        
        confirmPasswordView.backgroundColor = .white
        confirmPasswordView.layer.cornerRadius = 12
        confirmPasswordView.layer.borderWidth = 1
        confirmPasswordView.layer.borderColor = UIColor.lightGray.cgColor
        
        next_btn.layer.cornerRadius = 12
        
        passwordEye_btn.setImage(UIImage(named: "show Password")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        confirmPassEye_btn.setImage(UIImage(named: "show Password")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    @IBAction func passwordSecure(_ sender: Any) {
        let tag: Int = (sender as AnyObject).tag
        if(iconClick == true) {
            if tag == 0{
                password_tf.isSecureTextEntry = false
                passwordEye_btn.setImage(UIImage(named: "hide password")?.withRenderingMode(.alwaysOriginal), for: .normal)
            }else{
                confirmPassword_tf.isSecureTextEntry = false
                confirmPassEye_btn.setImage(UIImage(named: "hide password")?.withRenderingMode(.alwaysOriginal), for: .normal)
            }
        } else {
            if tag == 0{
                password_tf.isSecureTextEntry = true
                passwordEye_btn.setImage(UIImage(named: "show Password")?.withRenderingMode(.alwaysOriginal), for: .normal)
            }else{
                confirmPassword_tf.isSecureTextEntry = true
                confirmPassEye_btn.setImage(UIImage(named: "show Password")?.withRenderingMode(.alwaysOriginal), for: .normal)
            }
        }
        
        iconClick = !iconClick
    }
    
    
    @IBAction func back_btn(_ sender: Any) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func next_btn(_ sender: Any) {
    }
    
}
