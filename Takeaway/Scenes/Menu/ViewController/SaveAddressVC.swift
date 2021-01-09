//
//  SaveAddressVC.swift
//  Takeaway
//
//  Created by Elattar on 1/2/21.
//  Copyright © 2021 Elattar. All rights reserved.
//

import UIKit

class SaveAddressVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var save_btn: UIButton!
    
    let saveTableCellIndentfier = "AddressCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        self.title =  "SaveAddressVC"
        self.setBackbtn()
        self.tableView.tableFooterView =  UIView()
        tableView.register(UINib(nibName: saveTableCellIndentfier, bundle: nil), forCellReuseIdentifier: saveTableCellIndentfier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        save_btn.layer.cornerRadius = 12
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell", for: indexPath) as! AddressCell
        
        cell.delete = { [weak self] in
            guard let self = self else {return}
            
            print("Delete: \(indexPath.row)")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    @IBAction func save_btn(_ sender: Any) {
        print("Save")
    }
    
}
