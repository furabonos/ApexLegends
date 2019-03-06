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
    
    //레벨(0),킬(o),킬퍼매치,데미지퍼매치,위닝킬,데미지(0),매치플레이,
    @IBOutlet weak var lifetimeLabel: UILabel!
    @IBOutlet weak var redBar: UIView!
    
    @IBOutlet weak var num1Label: UILabel!
    @IBOutlet weak var num2Label: UILabel!
    @IBOutlet weak var num3Label: UILabel!
    @IBOutlet weak var num4Label: UILabel!
    @IBOutlet weak var num5Label: UILabel!
    @IBOutlet weak var num6Label: UILabel!
    @IBOutlet weak var num7Label: UILabel!
    
    
    @IBOutlet weak var num1ValueLabel: UILabel!
    @IBOutlet weak var num2ValueLabel: UILabel!
    @IBOutlet weak var num3ValueLabel: UILabel!
    @IBOutlet weak var num4ValueLabel: UILabel!
    @IBOutlet weak var num5ValueLabel: UILabel!
    @IBOutlet weak var num6ValueLabel: UILabel!
    @IBOutlet weak var num7ValueLabel: UILabel!
    
    
    @IBOutlet weak var num1RankLabel: UILabel!
    @IBOutlet weak var num2RankLabel: UILabel!
    @IBOutlet weak var num3RankLabel: UILabel!
    @IBOutlet weak var num4RankLabel: UILabel!
    @IBOutlet weak var num5RankLabel: UILabel!
    @IBOutlet weak var num6RankLabel: UILabel!
    @IBOutlet weak var num7RankLabel: UILabel!
    
    
    
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
        
        num1Label.adjustsFontSizeToFitWidth = true
        num2Label.adjustsFontSizeToFitWidth = true
        num3Label.adjustsFontSizeToFitWidth = true
        num4Label.adjustsFontSizeToFitWidth = true
        num5Label.adjustsFontSizeToFitWidth = true
        num6Label.adjustsFontSizeToFitWidth = true
        num7Label.adjustsFontSizeToFitWidth = true
        
        num1ValueLabel.adjustsFontSizeToFitWidth = true
        num2ValueLabel.adjustsFontSizeToFitWidth = true
        num3ValueLabel.adjustsFontSizeToFitWidth = true
        num4ValueLabel.adjustsFontSizeToFitWidth = true
        num5ValueLabel.adjustsFontSizeToFitWidth = true
        num6ValueLabel.adjustsFontSizeToFitWidth = true
        num7ValueLabel.adjustsFontSizeToFitWidth = true
        
        blackBar.snp.makeConstraints { (m) in
            m.width.equalTo(viewWidth)
            m.height.equalTo(10)
            m.bottom.equalTo(self.contentView.snp.bottom)
        }

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
        
        num1Label.snp.makeConstraints { (m) in
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(30)
            m.top.equalTo(redBar.snp.bottom).offset(30)
            m.left.equalTo(redBar.snp.left)
        }
        
        num2Label.snp.makeConstraints { (m) in
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(30)
            m.top.equalTo(num1Label.snp.top)
            m.left.equalTo(num1Label.snp.right).offset(10)
        }
        
        num3Label.snp.makeConstraints { (m) in
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(30)
            m.top.equalTo(num1Label.snp.top)
            m.left.equalTo(num2Label.snp.right).offset(10)
        }
        
        num4Label.snp.makeConstraints { (m) in
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(30)
            m.top.equalTo(num1Label.snp.top)
            m.left.equalTo(num3Label.snp.right).offset(10)
            m.right.equalTo(self.contentView.snp.right).offset(-10)
        }
        
        num5Label.snp.makeConstraints { (m) in
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(30)
            m.top.equalTo(num1ValueLabel.snp.bottom).offset(20)
            m.left.equalTo(redBar.snp.left)
        }
        
        num6Label.snp.makeConstraints { (m) in
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(30)
            m.top.equalTo(num5Label.snp.top)
            m.left.equalTo(num5Label.snp.right).offset(10)
        }
        
        num7Label.snp.makeConstraints { (m) in
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(30)
            m.top.equalTo(num6Label.snp.top)
            m.left.equalTo(num6Label.snp.right).offset(10)
        }
        
        num1RankLabel.snp.makeConstraints { (m) in
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(15)
            m.left.equalTo(num1Label.snp.left)
            m.top.equalTo(num1ValueLabel.snp.bottom)
        }
        
        num2RankLabel.snp.makeConstraints { (m) in
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(15)
            m.left.equalTo(num2Label.snp.left)
            m.top.equalTo(num2ValueLabel.snp.bottom)
        }
        
        num3RankLabel.snp.makeConstraints { (m) in
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(15)
            m.left.equalTo(num3Label.snp.left)
            m.top.equalTo(num3ValueLabel.snp.bottom)
        }
        
        num4RankLabel.snp.makeConstraints { (m) in
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(15)
            m.left.equalTo(num4Label.snp.left)
            m.top.equalTo(num4ValueLabel.snp.bottom)
        }
        
        num5RankLabel.snp.makeConstraints { (m) in
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(15)
            m.left.equalTo(num5Label.snp.left)
            m.top.equalTo(num5ValueLabel.snp.bottom)
        }
        
        num6RankLabel.snp.makeConstraints { (m) in
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(15)
            m.left.equalTo(num6Label.snp.left)
            m.top.equalTo(num6ValueLabel.snp.bottom)
        }
        
        num7RankLabel.snp.makeConstraints { (m) in
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(15)
            m.left.equalTo(num7Label.snp.left)
            m.top.equalTo(num7ValueLabel.snp.bottom)
        }

        num1ValueLabel.snp.makeConstraints { (m) in
            m.left.equalTo(num1Label.snp.left)
            m.top.equalTo(num1Label.snp.bottom)//.offset(5)
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(30)
        }

        num2ValueLabel.snp.makeConstraints { (m) in
            m.left.equalTo(num2Label.snp.left)
            m.top.equalTo(num1Label.snp.bottom)//.offset(5)
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(30)
        }
        
        num3ValueLabel.snp.makeConstraints { (m) in
            m.left.equalTo(num3Label.snp.left)
            m.top.equalTo(num1Label.snp.bottom)//.offset(5)
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(30)
        }
      
        num4ValueLabel.snp.makeConstraints { (m) in
            m.left.equalTo(num4Label.snp.left)
            m.top.equalTo(num1Label.snp.bottom)//.offset(5)
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(30)
        }
        
        num5ValueLabel.snp.makeConstraints { (m) in
            m.left.equalTo(num5Label.snp.left)
            m.top.equalTo(num5Label.snp.bottom)//.offset(5)
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(30)
        }
        
        num6ValueLabel.snp.makeConstraints { (m) in
            m.left.equalTo(num6Label.snp.left)
            m.top.equalTo(num5Label.snp.bottom)//.offset(5)
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(30)
        }
        
        num7ValueLabel.snp.makeConstraints { (m) in
            m.left.equalTo(num7Label.snp.left)
            m.top.equalTo(num6Label.snp.bottom)//.offset(5)
            m.width.equalTo((viewWidth - 50) / 4)
            m.height.equalTo(30)
        }

    }

}
