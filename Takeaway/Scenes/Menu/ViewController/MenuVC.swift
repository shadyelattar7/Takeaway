//
//  MenuVC.swift
//  Takeaway
//
//  Created by Elattar on 1/1/21.
//  Copyright © 2021 Elattar. All rights reserved.
//

import UIKit

class MenuVC: UITableViewController {

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()

    }
    
  


    @IBAction func setting_btn(_ sender: Any) {
        print("Setting")
        
        let sb = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
        self.navigationController?.pushViewController(sb, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0:
            print("Profile")
            let sb = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
            self.navigationController?.pushViewController(sb, animated: true)
        case 1:
            print("Your ordes")
            //MyOrdersVC
            let sb = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "MyOrdersVC") as! MyOrdersVC
            self.navigationController?.pushViewController(sb, animated: true)
        case 2:
            print("Offers")
            //OffersVC
            let sb = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "OffersVC") as! OffersVC
            self.navigationController?.pushViewController(sb, animated: true)
        case 3:
            print("Notifications")
            //NotificationsVC
            let sb = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "NotificationsVC") as! NotificationsVC
            self.navigationController?.pushViewController(sb, animated: true)
        case 4:
            print("Help")
            let sb = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "HelpVC") as! HelpVC
            self.navigationController?.pushViewController(sb, animated: true)
        case 5:
            print("My Wallet  ")
            //MyWallet
            let sb = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "MyWallet") as! MyWallet
                self.navigationController?.pushViewController(sb, animated: true)
        case 6:
            print("About ")
            let sb = UIStoryboard(name: "Menu", bundle: nil).instantiateViewController(withIdentifier: "AboutUsVC") as! AboutUsVC
            self.navigationController?.pushViewController(sb, animated: true)
        default:
            print("Error in menu")
        }
    }
}
