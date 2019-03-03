//
//  ResultViewController.swift
//  ApexLegends
//
//  Created by 엄태형 on 2019. 3. 3..
//  Copyright © 2019년 엄태형. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //Search Info
    var id = String()
    var platform = String()
    
    //Apex Data
    var stats: [Stats] = [] // 통합스탯
    var childStats: [Children] = [] //캐릭별 스탯
    
    private let apexService: ApexServiceType = ApexService()

    override func viewDidLoad() {
        super.viewDidLoad()
        apexService.searchApex(id: id, platform: platform) { (result) in
            switch result {
            case .success(let value):
                self.stats = value.data.stats
                self.childStats = value.data.children
            case .failure(let error):
                print(error)
            }
        }
    }

}
