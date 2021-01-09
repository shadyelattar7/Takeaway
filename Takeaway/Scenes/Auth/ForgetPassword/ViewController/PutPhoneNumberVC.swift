//
//  PutPhoneNumberVC.swift
//  Takeaway
//
//  Created by Elattar on 12/20/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit

class PutPhoneNumberVC: UIViewController {
    @IBOutlet weak var viewX: UIView!
    @IBOutlet weak var next_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        
        viewX.backgroundColor = .white
        viewX.layer.cornerRadius = 12
        viewX.layer.borderWidth = 1
        viewX.layer.borderColor = UIColor.lightGray.cgColor
        
        next_btn.layer.cornerRadius = 12
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
        let storyBoard = UIStoryboard(name: "Auth", bundle: Bundle.main)
        let Sign = storyBoard.instantiateViewController(withIdentifier: "ResetPasswordVC")
        
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
