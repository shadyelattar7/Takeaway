//
//  ChooseLanguageVC.swift
//  Takeaway
//
//  Created by Elattar on 12/19/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit

class ChooseLanguageVC: UIViewController {

    @IBOutlet weak var viewX: UIView!
    @IBOutlet weak var ar_lbl: UILabel!
    @IBOutlet weak var eng_lbl: UILabel!
    @IBOutlet weak var bottomView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        animateLanguage()

    }
    
  private  func animateLanguage(){
         bottomView.constant = 0
         UIView.animate(withDuration: 1, animations: {
             self.view.layoutIfNeeded()
         }) { (_) in
         }
         
     }

    
    @IBAction func chooseLang_btn(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Auth", bundle: Bundle.main)
        let Sign = storyBoard.instantiateViewController(withIdentifier: "LoginVC")

        let transition = CATransition()
        transition.duration = 0.5
       // transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        Sign.modalPresentationStyle = .overFullScreen
        self.present(Sign, animated: true, completion: nil)
        
        
//        if (sender as AnyObject).tag == 0 {
//            print("ARABIC")
//        }else {
//            print("ENGLISH")
//        }
        
    }
    
}
