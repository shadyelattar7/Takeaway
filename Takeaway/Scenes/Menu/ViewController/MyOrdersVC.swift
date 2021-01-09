//
//  MyOrdersVC.swift
//  Takeaway
//
//  Created by Elattar on 1/2/21.
//  Copyright © 2021 Elattar. All rights reserved.
//

import UIKit

class MyOrdersVC: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let myOrderTableCellIndentfier = "MyOrdersCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
   private func setupView(){
    self.title =  "My Orders"
    self.setBackbtn()
    self.tableView.tableFooterView =  UIView()
    tableView.register(UINib(nibName: myOrderTableCellIndentfier, bundle: nil), forCellReuseIdentifier: myOrderTableCellIndentfier)
    
    tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyOrdersCell", for: indexPath) as! MyOrdersCell
        
        
        if indexPath.row % 2 == 0{
            cell.orderWIllArrive_lbl.isHidden = true
            cell.delegateOrder_lbl.isHidden = true
             cell.call_btn.isHidden = false
    
        }else{
            cell.call_btn.isHidden = true
            cell.orderWIllArrive_lbl.isHidden = false
            cell.delegateOrder_lbl.isHidden = false
        }
        
        
        cell.rate = {[weak self] in
            guard let self = self else {return}
            //RateVC
            let sb = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "RateVC") as! RateVC
            sb.modalPresentationStyle = .overFullScreen
            self.present(sb, animated: true, completion: nil)
            
            
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "OrderDetailsVC") as! OrderDetailsVC
        
        self.navigationController?.pushViewController(sb, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
