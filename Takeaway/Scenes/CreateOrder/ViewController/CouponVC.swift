//
//  CouponVC.swift
//  Takeaway
//
//  Created by Elattar on 12/31/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit

class CouponVC: UIViewController {
    
    @IBOutlet weak var check_btn: UIButton!
    @IBOutlet weak var code_tf: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        check_btn.layer.cornerRadius = 12
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        showAnimate()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        print("123")
        removeAnimate()
    }
    
    func showAnimate(){
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate(){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    @IBAction func close_btn(_ sender: Any) {
        removeAnimate()
    }
    
    
    @IBAction func check_btn(_ sender: Any) {
        print("Check")
    }
}
