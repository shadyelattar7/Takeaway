//
//  FloatingMealsVC.swift
//  Takeaway
//
//  Created by Elattar on 1/2/21.
//  Copyright © 2021 Elattar. All rights reserved.
//

import UIKit

class FloatingMealsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuTitleCollV: UICollectionView!
    
    
     let tableCellIndentfier = "MealsCell"
    
    var menuTitle: [String] = [
        "30% OFFERS",
        "THE BEST MEALS",
        "DRINKS",
        "30% OFFERS",
        "THE BEST MEALS",
        "DRINKS",
    ]
    
    var city: [String] = [
        "Egypt",
        "Sohag",
        "Alexandria",
        "Matroh",
        "Mansoura",
        "Egypt",
        "Sohag",
        "Alexandria",
        "Matroh",
        "Mansoura",
        "Egypt",
        "Sohag",
        "Alexandria",
        "Matroh",
        "Mansoura",
        "Mansoura",
        "Egypt",
        "Sohag",
        "Alexandria",
        "Matroh",
        "Mansoura",
        "Egypt",

    ]
    
    var selectIndexPath = IndexPath(item: 0, section: 0)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
          self.menuTitleCollV.selectItem(at: self.selectIndexPath, animated: false, scrollPosition: .centeredHorizontally)
        
          tableView.register(UINib(nibName: tableCellIndentfier, bundle: nil), forCellReuseIdentifier: tableCellIndentfier)
        
        tableView.tableFooterView = UIView()
    }



}


//MARK:- Collection View Menu CollV
extension FloatingMealsVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuTitlesCell", for: indexPath) as! MenuTitlesCell
        cell.title_lbl.text = menuTitle[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.menuTitleCollV.frame.size.width / 3, height: menuTitleCollV.frame.size.height)
    }
    
    
}

//MARK:- TableView Meals
extension FloatingMealsVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return city.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealsCell", for: indexPath) as! MealsCell
        
        
        if indexPath.row % 2 == 0{
            cell.delete_btn.isHidden = false
            cell.counterView.isHidden = false
        }else{
            cell.delete_btn.isHidden = false
            cell.counterView.isHidden = false
        }
        
        cell.delete = { [weak self] in
            guard let self = self else {return}
            
            print("Delete")
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
