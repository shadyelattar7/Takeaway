//
//  SettingsVC.swift
//  Takeaway
//
//  Created by Elattar on 1/2/21.
//  Copyright © 2021 Elattar. All rights reserved.
//

import UIKit

class SettingsVC: UITableViewController {

    @IBOutlet weak var switchNotification: UISwitch!
    
    @IBOutlet weak var lang_lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
setupView()
   
    }
    private func setupView(){
        self.navigationItem.title = "Settings"
        navigationItem.hidesBackButton = true
        
        self.setBackbtn()
        
        tableView.tableFooterView = UIView()
    }
    
    
    @IBAction func notificationSwitch_btn(_ sender: UISwitch) {
        
        if sender.isOn{
            print("Notification On")
        }else{
            print("Notification Off")
        }
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0:
            print("Account Info")
            let sb = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "AccountInfoVC") as! AccountInfoVC
            self.navigationController?.pushViewController(sb, animated: true)
            case 1:
            print("Notification")
            case 2:
            print("Language")
            case 3:
            print("Saved Address")
            let sb = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "SaveAddressVC") as! SaveAddressVC
            self.navigationController?.pushViewController(sb, animated: true)
            case 4:
            print("Logout")
        default:
            print("Error in Settings")
        }
        
    }
    
  
}
