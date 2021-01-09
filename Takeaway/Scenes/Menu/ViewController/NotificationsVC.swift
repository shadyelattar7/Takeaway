//
//  NotificationsVC.swift
//  Takeaway
//
//  Created by Elattar on 1/3/21.
//  Copyright © 2021 Elattar. All rights reserved.
//

import UIKit

class NotificationsVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
  
    
    
    var image: [UIImage] = [
    UIImage(named: "notifi 1")!,
    UIImage(named: "notifi 2")!,
    UIImage(named: "notifi 1")!,
    UIImage(named: "notifi 2")!,
    UIImage(named: "notifi 1")!,
    UIImage(named: "notifi 2")!,
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView(){
        self.title =  "Notifications"
        self.setBackbtn()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return image.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationsCell", for: indexPath) as! NotificationsCell
        cell.noitifcation_iv.image = image[indexPath.row]
        return cell
      }
      
      
    
}
