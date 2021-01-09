//
//  StoresVC.swift
//  Takeaway
//
//  Created by Elattar on 12/27/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit

class StoresVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    
    let storeIdentfier = "StoreCell"
    
    var storeName: [String] = [
    "Fathalla gomla market",
    "Carrefour city center",
    "7lwany el 3abd",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        self.navigationItem.title = "Store"
        self.setBackbtn()
        tableView.register(UINib(nibName: storeIdentfier, bundle: nil), forCellReuseIdentifier: storeIdentfier)
        

    }
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeName.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath) as! StoreCell
        cell.store_iv.image = UIImage(named: "fathallall")
        cell.storeName_lbl.text = storeName[indexPath.row]
        return cell
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Store-Meals", bundle: nil).instantiateViewController(withIdentifier: "MealsVC") as! MealsVC
        self.navigationController?.pushViewController(sb, animated: true)
    }
    
}
