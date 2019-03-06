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
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialize()
    }
    
    func setupInitialize() {
        
        nameLabel.snp.makeConstraints { (m) in
            m.top.equalTo(self.contentView.snp.top).offset(10)
            m.left.equalTo(self.contentView.snp.left).offset(10)
            m.width.equalTo(130)
            m.height.equalTo(30)
        }
//        champImageView.backgroundColor = .blue
        champImageView.clipsToBounds = true
//        champImageView.contentMode = .as
        
        champImageView.snp.makeConstraints { (m) in
//            m.top.equalTo(nameLabel.snp.bottom).offset(15)
            m.top.equalTo(self.contentView.snp.top)
            m.left.equalTo(self.contentView.snp.left)
            m.width.equalTo(130)
            m.bottom.equalTo(self.contentView.snp.bottom)
        }
    }

}
