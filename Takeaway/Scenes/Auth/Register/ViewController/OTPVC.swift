//
//  OTPVC.swift
//  Takeaway
//
//  Created by Elattar on 12/19/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit
import OTPFieldView

class OTPVC: UIViewController, OTPFieldViewDelegate {
    
    @IBOutlet weak var phoneNo_lbl: UILabel!
    
    @IBOutlet weak var otpTextFieldView: OTPFieldView!
    
    var phoneNum: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        
        self.otpTextFieldView.fieldsCount = 4
        self.otpTextFieldView.fieldBorderWidth = 1
        self.otpTextFieldView.defaultBorderColor = UIColor.black
        self.otpTextFieldView.filledBorderColor = UIColor.systemYellow
        self.otpTextFieldView.cursorColor = UIColor.red
        self.otpTextFieldView.displayType = .square
        self.otpTextFieldView.fieldSize = 75
        self.otpTextFieldView.separatorSpace = 13
        self.otpTextFieldView.shouldAllowIntermediateEditing = false
        self.otpTextFieldView.delegate = self
        self.otpTextFieldView.initializeUI()
        self.otpTextFieldView.otpInputType = .numeric
        
        
        
        self.phoneNo_lbl.text = phoneNum
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp: String) {
        print("OTPString: \(otp)")
       
    }
    
    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
        print("Has entered all OTP? \(hasEnteredAll)")
        
        let storyBoard = UIStoryboard(name: "Auth", bundle: Bundle.main)
        let Sign = storyBoard.instantiateViewController(withIdentifier: "LastStepVC") as! LastStepVC
        
        
        let transition = CATransition()
        transition.duration = 0.5
          transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        Sign.modalPresentationStyle = .overFullScreen
        self.present(Sign, animated: true, completion: nil)
        
        return false
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
    
    @IBAction func resendOTP_btn(_ sender: Any) {
        
    }
}
