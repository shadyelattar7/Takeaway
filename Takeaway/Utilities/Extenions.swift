//
//  Extenions.swift
//  DemoAlamofire
//
//  Created by Elattar on 5/18/20.
//  Copyright © 2020 Elattar. All rights reserved.
//

import UIKit
import AVFoundation



extension UISearchBar {
    func setTextFieldColor(_ color: UIColor) {
        for subView in self.subviews {
            for subSubView in subView.subviews {
                let view = subSubView as? UITextInputTraits
                if view != nil {
                    let textField = view as? UITextField
                    textField?.backgroundColor = color
                    break
                }
            }
        }
    }
}

extension UIColor{
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}


extension UIView{
    
    func anchor(top: NSLayoutYAxisAnchor?,left: NSLayoutXAxisAnchor?,right: NSLayoutXAxisAnchor?,bottom: NSLayoutYAxisAnchor?, paddingTop: CGFloat,paddingLeft: CGFloat, paddingRight: CGFloat, paddingBottom: CGFloat, width: CGFloat, height: CGFloat){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if  width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if  height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
    }
    
    @discardableResult
      func applyGradient(colours: [UIColor]) -> CAGradientLayer {
          return self.applyGradient(colours: colours, locations: nil)
      }
      
      @discardableResult
      func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
          let gradient: CAGradientLayer = CAGradientLayer()
          gradient.frame = self.bounds
          gradient.colors = colours.map { $0.cgColor }
          gradient.locations = locations
          self.layer.insertSublayer(gradient, at: 0)
          return gradient
      }
    
}


extension UIViewController {
    
    func showAlart(title: String,message: String,okTitle: String = "OK" , okHandler: ((UIAlertAction) -> Void)? = nil){
        
        let alart = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alart.addAction(UIAlertAction(title: okTitle, style: .cancel, handler: okHandler))
        
        self.present(alart, animated: true, completion: nil)
    }
    
    
    
    func setBackbtn(){
        navigationItem.hidesBackButton = true
        
        var backImage = ""
        
        if "lang".localized == "en"{
            backImage = "back_btn"
        }else{
            backImage = "back_btn"
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: backImage)!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleBackBtn))
        
    }
    
    
    @objc func handleBackBtn(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func hideShadowNav(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}


extension String{
    var isBlank: Bool{
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    
    var localized: String{
        return NSLocalizedString(self, comment: "")
    }
}



extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}


class DateFormat{
    static func dateFormat(dateEx: String,dateFormat: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = dateFormat   //"yyyy-MM-dd'T'HH:mm:ss"
        //"yyyy-MM-dd'T'HH:mm:ss.SSS"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MM-dd-yyyy"
        
        if let date = dateFormatterGet.date(from: dateEx) {
            //  print(dateFormatterPrint.string(from: date))
            return dateFormatterPrint.string(from: date)
        } else {
            print("There was an error decoding the string (Date)")
        }
        return "N/A"
    }
}

public enum ImageFormat {
    case png
    case jpeg(CGFloat)
}

extension UIImage {
    
    public func base64(format: ImageFormat) -> String? {
        var imageData: Data?
        switch format {
        case .png: imageData = self.pngData()
        case .jpeg(let compression): imageData = self.jpegData(compressionQuality: compression)
        }
        return imageData?.base64EncodedString()
    }
}

extension UITextField {
    
    enum Direction {
        case left
        case right
    }
    
    // add image to textfield
    func withImage(direction: Direction, image: UIImage, colorSeparator: UIColor, colorBorder: UIColor) {
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 35))
        mainView.layer.cornerRadius = 5
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 35))
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = CGFloat(0.5)
        view.layer.borderColor = colorBorder.cgColor
        mainView.addSubview(view)
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 12.0, y: 5, width: 24.0, height: 24.0)
        view.addSubview(imageView)
        
        let seperatorView = UIView()
        seperatorView.backgroundColor = colorSeparator
        mainView.addSubview(seperatorView)
        
        if Direction.left == direction { // image left
            seperatorView.frame = CGRect(x: 0, y: 0, width: 1, height: 35)
            self.leftViewMode = .always
            self.leftView = mainView
        } else { // image right
            seperatorView.frame = CGRect(x: 45, y: 0, width: 1, height: 35)
            self.rightViewMode = .always
            self.rightView = mainView
        }
        
        self.layer.borderColor = colorBorder.cgColor
        self.layer.borderWidth = CGFloat(1)
        self.layer.cornerRadius = 5
    }
    
    // Handle The Wrong Input Password Case
    func handleInvalidCasefor(message: String) {
        self.shake()
        self.text = ""
        self.attributedPlaceholder = NSAttributedString(
            string: message, attributes: [.foregroundColor: #colorLiteral(red: 1, green: 0.3529411765, blue: 0.2509803922, alpha: 1),
                                          .font: UIFont.boldSystemFont(ofSize: 17.0)]
        )
    }
    
    // shake animation for the view
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = 0.4
        animation.values = [-15.0, 15.0, -15.0, 15.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
}


extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}

