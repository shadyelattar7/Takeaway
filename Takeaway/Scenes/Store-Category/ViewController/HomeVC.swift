//
//  HomeVC.swift
//  Takeaway
//
//  Created by Elattar on 12/21/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var viewX: UIView!
    @IBOutlet weak var menu_btn: UIButton!
    @IBOutlet weak var location_btn: UIButton!
    @IBOutlet weak var address_lbl: UILabel!
    @IBOutlet weak var sliderImageCollV: UICollectionView!
    @IBOutlet weak var categoryCollV: UICollectionView!
    @IBOutlet weak var search_tf: UITextField!
    @IBOutlet weak var search_iv: UIImageView!
    @IBOutlet weak var pageController: UIPageControl!
    
    let categoryIdentfier = "CategoryCell"
    
    var imageSlider: [UIImage] = [
        UIImage(named: "LaunchScreen")!,
        UIImage(named: "LaunchScreen")!,
        UIImage(named: "LaunchScreen")!,
        UIImage(named: "LaunchScreen")!,
    ]
    
    var categoryImg: [UIImage] = [
        UIImage(named: "coffe")!,
        UIImage(named: "burger")!,
        UIImage(named: "pharmacies")!,
        UIImage(named: "supermarket")!,
    ]
    
    var categoryTitle: [String] = [
        "Cafes",
        "Restaurants",
        "Pharmacies",
        "Supermarket"
    ]
    var currentIndex = 0
    var timer: Timer?
    
    override func viewDidLayoutSubviews() {
        pageController.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)

    }
    
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
        setupViewCell()
    }
    
    private func setupView(){
        
        viewX.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        viewX.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        viewX.layer.shadowOpacity = 1.0
        viewX.layer.shadowRadius = 0.0
        viewX.layer.masksToBounds = false
        
        search_iv.layer.cornerRadius = 5
        search_iv.clipsToBounds = true
        
        let nibCell2 = UINib(nibName: categoryIdentfier, bundle: nil)
        categoryCollV.register(nibCell2, forCellWithReuseIdentifier: categoryIdentfier)
        
        self.pageController.numberOfPages = self.imageSlider.count
        setupTimer()
    }
    
    private func setupViewCell(){
          let layout = self.categoryCollV.collectionViewLayout as! UICollectionViewFlowLayout
          layout.sectionInset = UIEdgeInsets(top: 16, left: 30, bottom: 0, right: 30)
//          layout.minimumInteritemSpacing = 20
//          layout.minimumLineSpacing = 20
      }
    
    func setupTimer(){
        timer = Timer.scheduledTimer(timeInterval:  3.0 , target: self, selector: #selector(handleTimerSliderImage), userInfo: nil, repeats: true)
    }
    
    @objc func handleTimerSliderImage(){
        let desiredScrollPostion = (currentIndex < imageSlider.count - 1) ? currentIndex + 1 : 0
        sliderImageCollV.scrollToItem(at: IndexPath(row: desiredScrollPostion, section: 0), at: .centeredHorizontally, animated: true)
        
    }
    
    @IBAction func address_btn(_ sender: Any) {
        print("Address")
    }
    @IBAction func menu_btn(_ sender: Any) {
        print("Menu")
        
    }
}

//MARK:- First collection View , (Image slider)
extension HomeVC:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sliderImageCollV{
            return imageSlider.count

        }else{
            return categoryImg.count
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == sliderImageCollV{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
            cell.image = imageSlider[indexPath.row]
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.item_iv.image = categoryImg[indexPath.row]
            cell.item_lbl.text = categoryTitle[indexPath.row]
            return cell
        }
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        if collectionView == sliderImageCollV{
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }else{
            return CGSize(width: (self.categoryCollV.frame.size.width / 2) - 40, height: 140)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollV{
            let sb = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StoresVC") as! StoresVC
            
            self.navigationController?.pushViewController(sb, animated: true)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x / sliderImageCollV.frame.size.width)
        pageController.currentPage = currentIndex
    }
    
}
