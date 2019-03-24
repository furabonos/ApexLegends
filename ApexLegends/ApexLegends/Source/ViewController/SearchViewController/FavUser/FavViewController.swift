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

    var favArr = Array<String>()
    var popover: Popover!
    var popoverOptions: [PopoverOption] = [
        .type(.auto),
        .blackOverlayColor(UIColor(white: 0.0, alpha: 0.6))
    ]
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    func makePopover(sender: UIButton) {
        tableView = UITableView(frame: CGRect(x: sender.frame.minX, y: 0, width: 200, height: 200))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = true
        self.popover = Popover(options: self.popoverOptions)
        self.popover.show(tableView, fromView: sender)
        tableView.reloadData()
    }
    
}

extension FavViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: Notification.Name("platformTitle"), object: nil, userInfo: ["title": favArr[indexPath.row]])
        self.popover.dismiss()
    }
}

extension FavViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return favArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = self.favArr[indexPath.row]
        return cell
    }
}
