//
//  SearchViewController.swift
//  ApexLegends
//
//  Created by 엄태형 on 2019. 3. 2..
//  Copyright © 2019년 엄태형. All rights reserved.
//

import UIKit
import SnapKit
import FirebaseDatabase

class SearchViewController: UIViewController {

    //UI
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var platformBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    
    //VC
    var platformViewController = PlatformViewController()
    var favViewController = FavViewController()
    
    //ETC
    var userArr = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialize()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        requestFavUser()
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func flipImageLeftRight(_ image: UIImage) -> UIImage? {//이미지 좌우반전
        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        let context = UIGraphicsGetCurrentContext()!
        
        context.translateBy(x: image.size.width, y: image.size.height)
        context.scaleBy(x: -image.scale, y: -image.scale)
        context.draw(image.cgImage!, in: CGRect(origin:CGPoint.zero, size: image.size))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
        
    }
    
    func setupInitialize() {
//        bgImageView.image = flipImageLeftRight(UIImage(named: "bloodhound") ?? UIImage())
        
        platformBtn.layer.cornerRadius = 10
        searchBtn.layer.cornerRadius = 10
        
        platformBtn.backgroundColor = .gray
        searchBtn.backgroundColor = .gray
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(setPlatformTitle(notification:)), name: Notification.Name("platformTitle"), object: nil)
        
        platformBtn.snp.makeConstraints { (m) in
            m.width.equalTo((view.frame.width - 50) / 4)
            m.height.equalTo(30)
            m.top.equalTo(bgImageView.snp.top).offset(75)
            m.left.equalTo(view.snp.left).offset(10)
        }

        textField.snp.makeConstraints { (m) in
//            m.width.equalTo((view.frame.width - 50) / 4)
            m.height.equalTo(30)
            m.top.equalTo(platformBtn.snp.top)
            m.left.equalTo(platformBtn.snp.right).offset(10)
        }
        
        searchBtn.snp.makeConstraints { (m) in
            m.width.equalTo((view.frame.width - 50) / 4)
            m.height.equalTo(30)
            m.top.equalTo(textField.snp.top)
            m.left.equalTo(textField.snp.right).offset(10)
            m.right.equalTo(view.snp.right).offset(-10)
        }
        
        //FavUser
//        requestFavUser()
        
    }
    
    func requestFavUser() {
        userArr.removeAll()
        let ref = Database.database().reference().child("ApexFavUser").child(UIDevice.getDeviceId())
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            //            print("ssip = \(snapshot.value)")
            guard let dictionaries = snapshot.value as? [String: Any] else { return }//데이터베이스에 저장된 자료가져옴.
            
            dictionaries.forEach({ (key, value) in
                guard let dictionary = value as? [String: Any] else { return }
                let username = dictionary["username"] as! String//사진url
//                self.userArr.removeAll()
                self.userArr.append(username)
                
            })
            
        }) { (err) in
            print("fail to fetch posts = \(err)")
        }
    }
    
    //Popover Notification
    @objc func setPlatformTitle(notification: Notification) {
        guard let notificationInfo = notification.userInfo as? [String: String] else { return }
        guard let platformTitle = notificationInfo["title"] else { return }
        print("ssip = \(platformTitle)")
//        platformBtn.setTitle(platformTitle, for: .normal)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        resultViewController.id = platformTitle
        resultViewController.platform = "5"
        
        self.navigationController?.pushViewController(resultViewController, animated: true)
        
    }
    

    //Button Action
    @IBAction func platformBtnClick(_ sender: Any) {
        DispatchQueue.main.async {
//            self.platformViewController.makePopover(sender: self.platformBtn)
            self.favViewController.favArr = self.userArr
            self.favViewController.makePopover(sender: self.platformBtn)
        }
    }
    
    @IBAction func searchBtnClick(_ sender: Any) {
        if textField.text?.count == 0 {
            self.present(Method.alert(type: .Search), animated: true)
        }else {
            guard let id = textField.text else { return }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
            
            resultViewController.id = id
            resultViewController.platform = "5"
            resultViewController.favUser = userArr
            
            self.navigationController?.pushViewController(resultViewController, animated: true)
        }
//        guard let season = seasonBtn.title(for: .normal) else { return }
        
    }
    
}
