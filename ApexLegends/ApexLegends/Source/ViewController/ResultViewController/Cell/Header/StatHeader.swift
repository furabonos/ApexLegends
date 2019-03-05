//
//  StatHeader.swift
//  ApexLegends
//
//  Created by Euijae Hong on 04/03/2019.
//  Copyright © 2019 엄태형. All rights reserved.
//

import UIKit
import SnapKit

class StatHeader: UICollectionViewCell {
    
    
    @IBOutlet weak var lifetimeLabel: UILabel!
    @IBOutlet weak var redBar: UIView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var killLabel: UILabel!
    @IBOutlet weak var damageLabel: UILabel!
    @IBOutlet weak var headshotLabel: UILabel!
    @IBOutlet weak var levelValueLabel: UILabel!
    @IBOutlet weak var killValueLabel: UILabel!
    @IBOutlet weak var damageValueLabel: UILabel!
    
    let viewWidth = UIScreen.main.bounds.size.width
    
    var blackBar: UIView = {
        var view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialize()
    }
    
    func setupInitialize() {
        self.contentView.addSubview(blackBar)
        blackBar.snp.makeConstraints { (m) in
            m.width.equalTo(viewWidth)
            m.height.equalTo(10)
            m.bottom.equalTo(self.contentView.snp.bottom)
        }
        
//        lifetimeLabel.backgroundColor = .yellow
        lifetimeLabel.snp.makeConstraints { (m) in
            m.top.equalTo(self.contentView.snp.top).offset(20)
            m.left.equalTo(self.contentView.snp.left)
            m.width.equalTo(100)
            m.height.equalTo(30)
        }
        
        redBar.snp.makeConstraints { (m) in
            m.width.equalTo(70)
            m.height.equalTo(2)
            m.top.equalTo(lifetimeLabel.snp.bottom)
            m.left.equalTo(lifetimeLabel.snp.left).offset(15)
        }
        
//        levelLabel.backgroundColor = .yellow
//        killLabel.backgroundColor = .red
//        damageLabel.backgroundColor = .green
//        headshotLabel.backgroundColor = .yellow
        
        levelLabel.snp.makeConstraints { (m) in
//            m.width.equalTo(50)
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(30)
            m.top.equalTo(redBar.snp.bottom).offset(30)
            m.left.equalTo(redBar.snp.left)
        }
        
        killLabel.snp.makeConstraints { (m) in
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(30)
            m.top.equalTo(levelLabel.snp.top)
            m.left.equalTo(levelLabel.snp.right).offset(10)
        }
        
        damageLabel.snp.makeConstraints { (m) in
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(30)
            m.top.equalTo(levelLabel.snp.top)
            m.left.equalTo(killLabel.snp.right).offset(10)
        }
        headshotLabel.adjustsFontSizeToFitWidth = true
        headshotLabel.snp.makeConstraints { (m) in
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(30)
            m.top.equalTo(levelLabel.snp.top)
            m.left.equalTo(damageLabel.snp.right).offset(10)
            m.right.equalTo(self.contentView.snp.right).offset(-10)
        }
//        levelValueLabel.backgroundColor = .yellow
//        levelValueLabel.adjustsFontSizeToFitWidth = true
        levelValueLabel.snp.makeConstraints { (m) in
            m.left.equalTo(levelLabel.snp.left)
            m.top.equalTo(levelLabel.snp.bottom).offset(5)
            m.width.equalTo(70)
            m.height.equalTo(40)
        }
//        let size = killValueLabel.text?.size(withAttributes: [.font: killValueLabel.font]) ?? .zero
//        killValueLabel.backgroundColor = .yellow
        killValueLabel.adjustsFontSizeToFitWidth = true
        killValueLabel.snp.makeConstraints { (m) in
            m.left.equalTo(killLabel.snp.left)
            m.top.equalTo(levelLabel.snp.bottom).offset(5)
            m.width.equalTo(70)
            m.height.equalTo(40)
        }
        
        damageValueLabel.adjustsFontSizeToFitWidth = true
//        damageValueLabel.backgroundColor = .red
        damageValueLabel.snp.makeConstraints { (m) in
            m.left.equalTo(damageLabel.snp.left)
            m.top.equalTo(levelLabel.snp.bottom).offset(5)
            m.width.equalTo(90)
            m.height.equalTo(40)
        }
        
//        levelBar.snp.makeConstraints { (m) in
//            m.left.equalTo(levelLabel.snp.left)
//            m.top.equalTo(levelValueLabel.snp.bottom).offset(10)
//            m.right.equalTo(killLabel.snp.left).offset(-10)
//            m.height.equalTo(2)
//        }
//        
//        killBar.snp.makeConstraints { (m) in
//            m.left.equalTo(killLabel.snp.left)
//            m.top.equalTo(killValueLabel.snp.bottom).offset(10)
//            m.height.equalTo(2)
//            m.right.equalTo(damageLabel.snp.left).offset(-10)
//        }
//        
//        damageBar.snp.makeConstraints { (m) in
//            m.left.equalTo(damageLabel.snp.left)
//            m.height.equalTo(2)
//            m.top.equalTo(damageValueLabel.snp.bottom).offset(10)
//            m.right.equalTo(headshotLabel.snp.left).offset(-10)
//        }
    }

}
