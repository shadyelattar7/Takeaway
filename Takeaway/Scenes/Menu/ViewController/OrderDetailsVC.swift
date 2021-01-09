//
//  OrderDetailsVC.swift
//  Takeaway
//
//  Created by Elattar on 1/2/21.
//  Copyright © 2021 Elattar. All rights reserved.
//

import UIKit

class OrderDetailsVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var restaurant_iv: UIImageView!
    @IBOutlet weak var restaurantsName_lbl: UILabel!
    @IBOutlet weak var orderStatus_lbl: UILabel!
    @IBOutlet weak var orderDate_lbl: UILabel!
    @IBOutlet weak var orderID_lb: UILabel!
    @IBOutlet weak var orderAddress_lbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var billAmount_lbl: UILabel!
    @IBOutlet weak var deliveryCharge_lbl: UILabel!
    @IBOutlet weak var total_lbl: UILabel!
    @IBOutlet weak var paymentMethoad_lbl: UILabel!
    
    //OrderSummaryCell
    let orderSummaryIdentfier = "OrderSummaryCell"
    
    
    var storeName: [String] = [
         "1 x Baby Lotion - 250 ML",
         "1 x Baby Lotion - 250 ML",
         "1 x Baby Lotion - 250 ML",
         ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        self.title =  "Orders Details"
          self.setBackbtn()
        tableView.register(UINib(nibName: orderSummaryIdentfier, bundle: nil), forCellReuseIdentifier: orderSummaryIdentfier)
        tableView.delegate = self
        tableView.dataSource = self

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeName.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderSummaryCell", for: indexPath) as! OrderSummaryCell
        cell.itemName_lbl.text = storeName[indexPath.row]
        cell.itemPrice_lbl.text = "89.00 LE"
        return cell
      }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    

}
