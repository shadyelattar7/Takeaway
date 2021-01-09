//
//  RegisterVC.swift
//  Takeaway
//
//  Created by Elattar on 12/19/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var phone_tf: UITextField!
    @IBOutlet weak var next_btn: UIButton!
    
    
    var phone: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        phoneView.backgroundColor = .white
        phoneView.layer.cornerRadius = 12
        phoneView.layer.borderWidth = 1
        phoneView.layer.borderColor = UIColor.lightGray.cgColor
        next_btn.layer.cornerRadius = 12
    }
    
    private func validateTextInput (phone: UITextField) -> Bool{
        self.phone = self.phone_tf.text ?? ""
        
        let response = Validation.shared.validate(values:
            (.phoneNo, self.phone , phone)
            
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
    
    @IBAction func next_btn(_ sender: Any) {
        
        if validateTextInput(phone: self.phone_tf){
            let storyBoard = UIStoryboard(name: "Auth", bundle: Bundle.main)
            let Sign = storyBoard.instantiateViewController(withIdentifier: "OTPVC") as! OTPVC
        
            Sign.phoneNum = phone
            
            let transition = CATransition()
            transition.duration = 0.5
          //  transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
            view.window!.layer.add(transition, forKey: kCATransition)
            Sign.modalPresentationStyle = .overFullScreen
            self.present(Sign, animated: true, completion: nil)
        }
    }
    
    @IBAction func login_btn(_ sender: Any) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
