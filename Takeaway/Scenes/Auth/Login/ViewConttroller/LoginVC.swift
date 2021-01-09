//
//  LoginVC.swift
//  Takeaway
//
//  Created by Elattar on 12/18/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var viewX: UIView!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var phone_tf: UITextField!
    @IBOutlet weak var security_btn: UIButton!
    @IBOutlet weak var password_tf: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var next_btn: UIButton!
    @IBOutlet weak var passSecurity: UIButton!
    
    
    var phone: String = ""
    var password: String = ""
    var iconPassword = true
    
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        viewX.layer.cornerRadius = 30
        viewX.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        
        phoneView.backgroundColor = .white
        phoneView.layer.cornerRadius = 12
        phoneView.layer.borderWidth = 1
        phoneView.layer.borderColor = UIColor.lightGray.cgColor
        
        passwordView.backgroundColor = .white
        passwordView.layer.cornerRadius = 12
        passwordView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.lightGray.cgColor
        
        next_btn.layer.cornerRadius = 12
        
         passSecurity.setImage(UIImage(named: "show Password")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
    }
    
    private func validateTextInput (phone: UITextField, password: UITextField) -> Bool{
        self.phone = self.phone_tf.text ?? ""
        self.password = self.password_tf.text ?? ""
        
        let response = Validation.shared.validate(values:
            (.phoneNo, self.phone , phone),
            (.password, self.password , password)
        )
        
        
        switch response.1 {
        case .success:
            break
        case .failure(_, let message):
            response.0.handleInvalidCasefor(message: message.rawValue)
            return false
        }
        return true
    }
    
    @IBAction func didPressShow(_ sender: Any) {
        
        if(iconPassword == true) {
               password_tf.isSecureTextEntry = false
            passSecurity.setImage(UIImage(named: "hide password")?.withRenderingMode(.alwaysOriginal), for: .normal)
           } else {
               password_tf.isSecureTextEntry = true
                    passSecurity.setImage(UIImage(named: "show Password")?.withRenderingMode(.alwaysOriginal), for: .normal)
           }
           
           iconPassword = !iconPassword
    }
    
    @IBAction func forgetPassword_btn(_ sender: Any) {
  let storyBoard = UIStoryboard(name: "Auth", bundle: Bundle.main)
        let Sign = storyBoard.instantiateViewController(withIdentifier: "PutPhoneNumberVC")
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        Sign.modalPresentationStyle = .overFullScreen
        self.present(Sign, animated: true, completion: nil)
        
    }
    
    

    
    @IBAction func next_btn(_ sender: Any) {
        if validateTextInput(phone: self.phone_tf, password: self.password_tf){
            print("Successfully")
        }
        
        
        
        
    }
    @IBAction func createAccount_btn(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Auth", bundle: Bundle.main)
           let Sign = storyBoard.instantiateViewController(withIdentifier: "RegisterVC")
           
           let transition = CATransition()
           transition.duration = 0.5
           transition.type = CATransitionType.push
           transition.subtype = CATransitionSubtype.fromRight
           transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
           view.window!.layer.add(transition, forKey: kCATransition)
           Sign.modalPresentationStyle = .overFullScreen
           self.present(Sign, animated: true, completion: nil)
        
    }
    
 

}
