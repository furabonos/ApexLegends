//
//  ResultCell.swift
//  ApexLegends
//
//  Created by Euijae Hong on 04/03/2019.
//  Copyright © 2019 엄태형. All rights reserved.
//

import UIKit
import SnapKit

class ResultCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var champImageView: UIImageView!
    
    @IBOutlet weak var num1Label: UILabel!
    @IBOutlet weak var num2Label: UILabel!
    @IBOutlet weak var num3Label: UILabel!
    @IBOutlet weak var num4Label: UILabel!
    @IBOutlet weak var num5Label: UILabel!
    @IBOutlet weak var num6Label: UILabel!
    
    @IBOutlet weak var num1ValueLabel: UILabel!
    @IBOutlet weak var num2ValueLabel: UILabel!
    @IBOutlet weak var num3ValueLabel: UILabel!
    @IBOutlet weak var num4ValueLabel: UILabel!
    @IBOutlet weak var num5ValueLabel: UILabel!
    @IBOutlet weak var num6ValueLabel: UILabel!
    
    
    @IBOutlet weak var num1RankLabel: UILabel!
    @IBOutlet weak var num2RankLabel: UILabel!
    @IBOutlet weak var num3RankLabel: UILabel!
    @IBOutlet weak var num4RankLabel: UILabel!
    @IBOutlet weak var num5RankLabel: UILabel!
    @IBOutlet weak var num6RankLabel: UILabel!
    
    
    
    let viewWidth = UIScreen.main.bounds.size.width
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialize()
    }
    
    func setupInitialize() {
        
        var cellWidth = viewWidth - champImageView.frame.width
        
//        num1Label.sizeToFit()
//        num2Label.sizeToFit()
//        num3Label.sizeToFit()
//        num4Label.sizeToFit()
        
        num1Label.adjustsFontSizeToFitWidth = true
        num2Label.adjustsFontSizeToFitWidth = true
        num3Label.adjustsFontSizeToFitWidth = true
        num4Label.adjustsFontSizeToFitWidth = true
        num5Label.adjustsFontSizeToFitWidth = true
        num6Label.adjustsFontSizeToFitWidth = true
        
//        num1ValueLabel.sizeToFit()
//        num2ValueLabel.sizeToFit()
//        num3ValueLabel.sizeToFit()
//        num4ValueLabel.sizeToFit()
        num1ValueLabel.adjustsFontSizeToFitWidth = true
        num2ValueLabel.adjustsFontSizeToFitWidth = true
        num3ValueLabel.adjustsFontSizeToFitWidth = true
        num4ValueLabel.adjustsFontSizeToFitWidth = true
        num5ValueLabel.adjustsFontSizeToFitWidth = true
        num6ValueLabel.adjustsFontSizeToFitWidth = true
        
        num1RankLabel.adjustsFontSizeToFitWidth = true
        num2RankLabel.adjustsFontSizeToFitWidth = true
        num3RankLabel.adjustsFontSizeToFitWidth = true
        num4RankLabel.adjustsFontSizeToFitWidth = true
        num5RankLabel.adjustsFontSizeToFitWidth = true
        num6RankLabel.adjustsFontSizeToFitWidth = true
        
        
        nameLabel.snp.makeConstraints { (m) in
            m.top.equalTo(self.contentView.snp.top).offset(10)
            m.left.equalTo(self.contentView.snp.left).offset(10)
            m.width.equalTo(130)
            m.height.equalTo(30)
        }
        
        champImageView.contentMode = .scaleAspectFill
        champImageView.snp.makeConstraints { (m) in
            m.top.equalTo(nameLabel.snp.bottom).offset(-5)
            m.top.equalTo(self.contentView.snp.top).offset(25)
            m.left.equalTo(self.contentView.snp.left).offset(-10)
            m.width.equalTo(130)
            m.bottom.equalTo(self.contentView.snp.bottom).offset(20)
        }

        num1Label.snp.makeConstraints { (m) in
            m.left.equalTo(champImageView.snp.right).offset(10)
            m.top.equalTo(self.contentView.snp.top).offset(40)
            m.height.equalTo(20)
            m.width.equalTo(cellWidth / 4)
//            m.width.greaterThanOrEqualTo(cellWidth / 4)

        }

        num2Label.snp.makeConstraints { (m) in
            m.top.equalTo(self.contentView.snp.top).offset(40)
            m.height.equalTo(20)
            m.left.equalTo(num1Label.snp.right).offset(10)
//            m.width.greaterThanOrEqualTo(cellWidth / 4)
            m.width.equalTo(cellWidth / 4)
        }
    
        num3Label.snp.makeConstraints { (m) in
            m.top.equalTo(self.contentView.snp.top).offset(40)
            m.height.equalTo(20)
            m.left.equalTo(num2Label.snp.right).offset(10)
//            m.width.greaterThanOrEqualTo(cellWidth / 4)
            m.width.equalTo(cellWidth / 4)
        }

        
        num4Label.snp.makeConstraints { (m) in
            m.top.equalTo(self.contentView.snp.top).offset(40)
            m.height.equalTo(20)
            m.left.equalTo(num3Label.snp.right).offset(10)
//            m.width.greaterThanOrEqualTo(cellWidth / 4)
            m.width.equalTo(cellWidth / 4)
            m.right.equalTo(self.contentView.snp.right).offset(-10)
        }
        
        num5Label.snp.makeConstraints { (m) in
            m.left.equalTo(champImageView.snp.right).offset(10)
            m.top.equalTo(num1RankLabel.snp.bottom).offset(10)
            m.height.equalTo(20)
            m.width.equalTo(num1Label.snp.width)
        }
        
        num6Label.snp.makeConstraints { (m) in
            m.top.equalTo(num5Label.snp.top)
            m.height.equalTo(20)
            m.left.equalTo(num5Label.snp.right).offset(10)
            m.width.equalTo(num1Label.snp.width)
        }
        
//        num1ValueLabel.backgroundColor = .red
        num1ValueLabel.snp.makeConstraints { (m) in
            m.height.equalTo(30)
            m.top.equalTo(num1Label.snp.bottom).offset(-5)
            m.left.equalTo(num1Label.snp.left)
            m.right.equalTo(num2ValueLabel.snp.left).offset(-5)
        }
        
        num2ValueLabel.snp.makeConstraints { (m) in
            m.height.equalTo(30)
            m.top.equalTo(num2Label.snp.bottom).offset(-5)
            m.left.equalTo(num2Label.snp.left)
            m.width.equalTo(num2Label.snp.width)
        }
        
        num3ValueLabel.snp.makeConstraints { (m) in
            m.height.equalTo(30)
            m.top.equalTo(num3Label.snp.bottom).offset(-5)
            m.left.equalTo(num3Label.snp.left)
            m.width.equalTo(num3Label.snp.width)
        }
        
        num4ValueLabel.snp.makeConstraints { (m) in
            m.height.equalTo(30)
            m.top.equalTo(num4Label.snp.bottom).offset(-5)
            m.left.equalTo(num4Label.snp.left)
            m.width.equalTo(num4Label.snp.width)
        }
        
        num5ValueLabel.snp.makeConstraints { (m) in
            m.height.equalTo(30)
            m.top.equalTo(num5Label.snp.bottom).offset(-5)
            m.left.equalTo(num5Label.snp.left)
            m.right.equalTo(num2ValueLabel.snp.left).offset(-5)
        }
        
        num6ValueLabel.snp.makeConstraints { (m) in
            m.height.equalTo(30)
            m.top.equalTo(num6Label.snp.bottom).offset(-5)
            m.left.equalTo(num2Label.snp.left)
//            m.right.equalTo(num2ValueLabel.snp.left).offset(-5)
        }
        
        num1RankLabel.snp.makeConstraints { (m) in
            m.top.equalTo(num1ValueLabel.snp.bottom).offset(-5)
            m.left.equalTo(num1Label.snp.left)
            m.height.equalTo(20)
            m.right.equalTo(num2RankLabel.snp.left)
//            m.width.equalTo(num1Label.snp.width)
        }
        
        num2RankLabel.snp.makeConstraints { (m) in
            m.top.equalTo(num2ValueLabel.snp.bottom).offset(-5)
            m.left.equalTo(num2Label.snp.left)
            m.height.equalTo(20)
            m.width.equalTo(num2Label.snp.width)
        }
        
        num3RankLabel.snp.makeConstraints { (m) in
            m.top.equalTo(num3ValueLabel.snp.bottom).offset(-5)
            m.left.equalTo(num3Label.snp.left)
            m.height.equalTo(20)
            m.width.equalTo(num3Label.snp.width)
        }
        
        num4RankLabel.snp.makeConstraints { (m) in
            m.top.equalTo(num4ValueLabel.snp.bottom).offset(-5)
            m.left.equalTo(num4Label.snp.left)
            m.height.equalTo(20)
            m.width.equalTo(num4Label.snp.width)
        }
        
        num5RankLabel.snp.makeConstraints { (m) in
            m.top.equalTo(num5ValueLabel.snp.bottom).offset(-5)
            m.left.equalTo(num5Label.snp.left)
            m.height.equalTo(20)
            m.width.equalTo(num5Label.snp.width)
        }
        
        num6RankLabel.snp.makeConstraints { (m) in
            m.top.equalTo(num6ValueLabel.snp.bottom).offset(-5)
            m.left.equalTo(num6Label.snp.left)
            m.height.equalTo(20)
            m.width.equalTo(num6Label.snp.width)
        }
    }

}
