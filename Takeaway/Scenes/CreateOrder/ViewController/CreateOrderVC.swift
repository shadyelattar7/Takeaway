//
//  CreateOrderVC.swift
//  Takeaway
//
//  Created by Elattar on 12/31/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit
import BEMCheckBox
import UITextView_Placeholder
class CreateOrderVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    
    @IBOutlet weak var restaurantsName_lbl: UILabel!
    @IBOutlet weak var backImg_iv: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noteView: UIView!
    @IBOutlet weak var note_tv: UITextView!
    @IBOutlet weak var cachCheck: BEMCheckBox!
    @IBOutlet weak var visaCheck: BEMCheckBox!
    @IBOutlet weak var billAmount_lbl: UILabel!
    @IBOutlet weak var deliveryCharge_lbl: UILabel!
    @IBOutlet weak var totalAmount_lbl: UILabel!
    
    @IBOutlet weak var couponView: UIView!
    let tableCellIndentfier = "OrdesCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        noteView.layer.cornerRadius = 12
        couponView.layer.cornerRadius = 12
         tableView.register(UINib(nibName: tableCellIndentfier, bundle: nil), forCellReuseIdentifier: tableCellIndentfier)
        
    }
    
    @IBAction func back_btn(_ sender: Any) {
        print("Back_btn")
    }
    @IBAction func addCoupon(_ sender: Any) {
        print("addCoupon")
        
        let popScreen = UIStoryboard(name: "CreateOrder", bundle: nil).instantiateViewController(withIdentifier: "CouponVC") as! CouponVC
         
         self.addChild(popScreen)
         popScreen.view.frame = self.view.frame
         self.view.addSubview(popScreen.view)
         popScreen.didMove(toParent: self)
    }
    @IBAction func completeOrder_btn(_ sender: Any) {
        print("Complete order")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 5
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrdesCell", for: indexPath) as! OrdesCell
        cell.orderTitle.text = "Hardee,s - san sefon"
        return cell
     }
     
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
