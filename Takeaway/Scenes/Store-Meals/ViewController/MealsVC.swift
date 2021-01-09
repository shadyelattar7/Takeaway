//
//  MealsVC.swift
//  Takeaway
//
//  Created by Elattar on 12/29/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit
import FloatingPanel

class MealsVC: UIViewController,FloatingPanelControllerDelegate {
    
    @IBOutlet weak var restaurantLogo_iv: CircleImageView!
    @IBOutlet weak var restaurantName_lbl: UILabel!
    @IBOutlet weak var restaurantSlogn_lbl: UILabel!
    @IBOutlet weak var restaurantImage_iv: UIImageView!
    @IBOutlet weak var descripationView: UIView!
    @IBOutlet weak var descripation_lbl: UILabel!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var address_lbl: UILabel!
    @IBOutlet weak var totalPrice_lbl: UILabel!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var menuTitleCollV: UICollectionView!
    @IBOutlet weak var mealsTableView: UITableView!
    
    
    var menuTitle: [String] = [
        "30% OFFERS",
        "THE BEST MEALS",
        "DRINKS",
        "30% OFFERS",
        "THE BEST MEALS",
        "DRINKS",
    ]
    
    var selectIndexPath = IndexPath(item: 0, section: 0)

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
        setupView()
        
    }
    
    private func setupView(){
        restaurantImage_iv.layer.cornerRadius = 12
        restaurantImage_iv.clipsToBounds = true
        descripationView.layer.cornerRadius = 12
        addressView.layer.cornerRadius = 12
        priceView.layer.cornerRadius = priceView.frame.size.width / 2

        self.menuTitleCollV.selectItem(at: self.selectIndexPath, animated: false, scrollPosition: .centeredHorizontally)
        
        let fpc = FloatingPanelController()
              fpc.delegate = self
              //flotingTableVC
              
              guard let contentVC = UIStoryboard(name: "Store-Meals", bundle: nil).instantiateViewController(withIdentifier: "FloatingMealsVC") as? FloatingMealsVC
                  else {return}
        
        fpc.set(contentViewController: contentVC)
             fpc.addPanel(toParent: self)
    }
    
    @IBAction func setLocation(_ sender: Any) {
    }
    
    @IBAction func back_btn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

//MARK:- Collection View Menu CollV
extension MealsVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
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
