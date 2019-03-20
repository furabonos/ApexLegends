//
//  FavViewController.swift
//  ApexLegends
//
//  Created by 엄태형 on 2019. 3. 17..
//  Copyright © 2019년 엄태형. All rights reserved.
//

import UIKit
import Popover
import Firebase

class FavViewController: UIViewController {

    var texts = ["iosios", "XBOX", "PSN"]
    var popover: Popover!
    var popoverOptions: [PopoverOption] = [
        .type(.auto),
        .blackOverlayColor(UIColor(white: 0.0, alpha: 0.6))
    ]
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestFavUser()
    }
    
    func requestFavUser() {
        let ref = Database.database().reference().child("ApexFavUser")
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
        guard let dictionaries = snapshot.value as? [String: String] else { return }//데이터베이스에 저장된 자료가져옴.
            print("ssip = \(dictionaries)")
            //            print("ssip = \(dictionaries["username"] as! String)")
            //            print("here2")
            //            dictionaries.forEach({ (key, value) in
            //                guard let dictionary = value as? [String: Any] else { return }
            //                let username = dictionary["username"] as! String//사진url
            //                print("ssip = \(username)")
            ////                let post = Post(user: user, dictionary: dictionary)
            ////                self.posts.append(post)//자료를 따로 포스트 모델로 가져옴?
            //            })
            
        }) { (err) in
            print("fail to fetch posts = \(err)")
        }
    }
    
    func makePopover(sender: UIButton) {
        tableView = UITableView(frame: CGRect(x: sender.frame.minX, y: 0, width: 100, height: 135))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        self.popover = Popover(options: self.popoverOptions)
        self.popover.show(tableView, fromView: sender)
        tableView.reloadData()
    }
    
}

extension FavViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: Notification.Name("platformTitle"), object: nil, userInfo: ["title": texts[indexPath.row]])
        self.popover.dismiss()
    }
}

extension FavViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return texts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = self.texts[indexPath.row]
        return cell
    }
}
