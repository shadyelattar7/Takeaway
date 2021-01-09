//
//  LastStepVC.swift
//  Takeaway
//
//  Created by Elattar on 12/19/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit
import BEMCheckBox

class LastStepVC: UIViewController, BEMCheckBoxDelegate {
    
    @IBOutlet weak var firstName_tf: UITextField!
    @IBOutlet weak var lastName_tf: UITextField!
    @IBOutlet weak var email_tf: UITextField!
    @IBOutlet weak var password_tf: UITextField!
    @IBOutlet weak var confirmPassword_tf: UITextField!
    @IBOutlet weak var passwordEye_btn: UIButton!
    @IBOutlet weak var confirmPassEye_btn: UIButton!
    @IBOutlet weak var signUp_btn: UIButton!
    @IBOutlet weak var male: BEMCheckBox!
    @IBOutlet weak var female: BEMCheckBox!
    
    
    var gender: String = ""
    
    private var iconClick = true
    
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    private func setupView(){
        passwordEye_btn.setImage(UIImage(named: "show Password")?.withRenderingMode(.alwaysOriginal), for: .normal)
        confirmPassEye_btn.setImage(UIImage(named: "show Password")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        signUp_btn.layer.cornerRadius = 12
        
        
        male.delegate = self
        male.boxType = .square
        female.delegate = self
        female.boxType = .square
    }
    
    func didTap(_ checkBox: BEMCheckBox) {
        if checkBox.tag == 0 {
            male.setOn(true, animated: true)
            female.setOn(false, animated: true)
            gender = "Male"
        }else if checkBox.tag == 1 {
            female.setOn(true, animated: true)
            male.setOn(false, animated: true)
            gender = "Female"
        }
    }
    
    func validateTextInput(firstName :UITextField,lastName : UITextField, email: UITextField, password: UITextField, confirmPassword: UITextField ) -> Bool {
        
        self.firstName = self.firstName_tf.text ?? ""
        self.lastName = self.lastName_tf.text ?? ""
        self.email = self.email_tf.text ?? ""
        self.password = self.password_tf.text ?? ""
        self.confirmPassword = self.confirmPassword_tf.text ?? ""
        
        let response = Validation.shared.validate(
            values:
            (.alphabeticString, self.firstName , firstName),
            (.alphabeticString, self.lastName , lastName),
            (.email, self.email , email),
            (.password, self.password , password),
            (.password, self.confirmPassword , confirmPassword)
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
    
    @IBAction func signUp_btn(_ sender: Any) {
        if validateTextInput(firstName: firstName_tf, lastName: lastName_tf, email: email_tf, password: password_tf, confirmPassword: confirmPassword_tf){
            if password == confirmPassword {
            
                print("Succfully")
                print("Gender: \(gender)")
                
                let storyBoard = UIStoryboard(name: "Auth", bundle: Bundle.main)
                let Sign = storyBoard.instantiateViewController(withIdentifier: "CurrentLocationVC") as! CurrentLocationVC
                
                let transition = CATransition()
                transition.duration = 0.5
                  transition.type = CATransitionType.push
                transition.subtype = CATransitionSubtype.fromRight
                transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
                view.window!.layer.add(transition, forKey: kCATransition)
                Sign.modalPresentationStyle = .overFullScreen
                self.present(Sign, animated: true, completion: nil)
                
            }else {
                self.showAlart(title: "", message: "Password not Equel")
            }
            
        }
    }
}
