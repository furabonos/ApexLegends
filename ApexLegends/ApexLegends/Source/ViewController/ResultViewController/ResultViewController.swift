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
    
    //UI
    @IBOutlet weak var collectionView: UICollectionView!
    let aarr = ["aa", "bb", "cc"]
    
    //Delegate
    private let apexService: ApexServiceType = ApexService()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialize()
    }
    
    func setupInitialize() {
        //Call Data
        apexService.searchApex(id: id, platform: platform) { (result) in
            switch result {
            case .success(let value):
                self.stats = value.data.stats
                self.childStats = value.data.children
                self.collectionView.reloadData()
                print("ssip = \(self.stats[0].displayValue)")
            case .failure(let error):
                print(error)
            }
        }
        
        //UI
        collectionView.register(UINib(nibName: "StatHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "StatHeader")
        
        collectionView.register(
            UINib(nibName: "ResultCell", bundle: nil),
            forCellWithReuseIdentifier: "ResultCell"
        )

    }
    
    @IBAction func backButtonClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension ResultViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return aarr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as! ResultCell
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind:
        String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:
            "StatHeader", for: indexPath) as! StatHeader
        if stats.count > 0 {
            header.levelValueLabel.text = stats[0].displayValue
            header.killValueLabel.text = stats[1].displayValue
            header.damageValueLabel.text = stats[2].displayValue
        }
        return header
    }
}

extension ResultViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
}
