//
//  SeasonViewController.swift
//  ApexLegends
//
//  Created by 엄태형 on 2019. 3. 3..
//  Copyright © 2019년 엄태형. All rights reserved.
//

import UIKit
import Popover

class SeasonViewController: UIViewController {

    var texts = [""]
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
        tableView = UITableView(frame: CGRect(x: sender.frame.minX, y: 0, width: 100, height: 135))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        self.popover = Popover(options: self.popoverOptions)
        self.popover.show(tableView, fromView: sender)
        tableView.reloadData()
    }

}

extension SeasonViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: Notification.Name("seasonTitle"), object: nil, userInfo: ["title": texts[indexPath.row]])
        self.popover.dismiss()
    }
}

extension SeasonViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return texts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = self.texts[indexPath.row]
        return cell
    }
}
