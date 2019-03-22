//
//  ResultViewController.swift
//  ApexLegends
//
//  Created by 엄태형 on 2019. 3. 3..
//  Copyright © 2019년 엄태형. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Kingfisher
import FirebaseDatabase
import Firebase

class ResultViewController: UIViewController {
    
    //Search Info
    var id = String()
    var platform = String()
    
    //Apex Data
    var stats: [Stats?] = [] // 통합스탯
    var childStats: [Children?] = [] //캐릭별 스탯
    
    //UI
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var bookmarkBtn: UIBarButtonItem!
    private var activityView: NVActivityIndicatorView!
    
    //Data
    var ref = Database.database().reference()
    var favUser = Array<String>()
    
    //Delegate
    private let apexService: ApexServiceType = ApexService()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialize()
        setupActivityIndicator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        activityView.startAnimating()
    }
    
    func setupInitialize() {
        //Call Data
        apexService.searchApex(id: id, platform: platform) { (result) in
            switch result {
            case .success(let value):
                
                self.stats = value.data.stats
                self.childStats = value.data.children
                self.collectionView.reloadData()
                self.activityView.stopAnimating()
                
            case .failure(let error):
                
                self.present(Method.alert(type: .Result), animated: true, completion: {
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                })
                self.activityView.stopAnimating()
                
            }
        }
        
        //UI
        naviBar.topItem?.title = id
        collectionView.backgroundColor = .black
        
        collectionView.register(UINib(nibName: "StatHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "StatHeader")
        
        collectionView.register(
            UINib(nibName: "ResultCell", bundle: nil),
            forCellWithReuseIdentifier: "ResultCell"
        )
        
        requestBookmark(id: id)

    }
    
    func requestBookmark(id: String) {
        let ref = Database.database().reference().child("ApexFavUser").child(UIDevice.getDeviceId()).child(id)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            if let dictionaries = snapshot.value as? [String: String] {
               print("yes user")
                self.bookmarkBtn.image = UIImage(named: "blackstar")
            }else {
                print("no user")
                self.bookmarkBtn.image = UIImage(named: "star")
            }

        }) { (err) in
            print("fail to fetch posts = \(err)")
        }
    }
    
    private func setupActivityIndicator() {
        activityView = NVActivityIndicatorView(frame: CGRect(x: self.view.center.x - 50, y: self.view.center.y - 50, width: 100, height: 100), type: NVActivityIndicatorType.ballBeat, color: UIColor(red: 0/255.0, green: 132/255.0, blue: 137/255.0, alpha: 1), padding: 25)
        
        activityView.backgroundColor = .white
        activityView.layer.cornerRadius = 10
        self.view.addSubview(activityView)
    }
    
    @IBAction func backButtonClick(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func bookmarkClick(_ sender: Any) {
        let apexRef = Database.database().reference().child("ApexFavUser").child(UIDevice.getDeviceId())
        let ref = apexRef.child(id)
        let values = ["username": id] as [String: Any]

        if bookmarkBtn.image == UIImage(named: "star") {
            //즐겨찾기 추가하지 않은 상태
            ref.updateChildValues(values){ (err, ref) in
                if let err = err {
                    self.present(Method.alert(type: .Fail), animated: true)
                    print("fail updateValue = \(err)")
                    return
                }
                print("success update values")
                self.present(Method.alert(type: .Success), animated: true, completion: {
                    self.bookmarkBtn.image = UIImage(named: "blackstar")
                })
            }
        }else {
           //즐겨찾기 추가되어있는 상태
            ref.removeValue()
            self.present(Method.alert(type: .DelSuccess), animated: true, completion: {
                self.bookmarkBtn.image = UIImage(named: "star")
            })

        }
        
    }
    
    func favUserCheck(type: Bool, array: Array<String>) {
        
    }
    
    
    func changeLabel(str: String) -> String {
        var str2 = str
        switch str {
        case "Kills Per Match": str2 = "Kills/Match"
        case "Damage Per Match": str2 = "Dmg/Match"
        case "Matches Played": str2 = "Match Played"
        case "Winning Kills": str2 = "WinningKill"
        case "Care Package Kills": str2 = "Care PKG Kill"
        case "Legend Specific 2": str2 = "LGD Specific 2"
        default:
            break
        }
        return str2
    }
    
    func plusSharp(str: String) -> String {
        if str != "" {
            return  "#\(str)"
        }else {
            return  str
        }
    }
    
    func deleteRank(str: String) -> String {
        if str.count >= 5 || str == "" {
            return ""
        }else {
            return "#\(str)"
        }
    }
    
}

extension ResultViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (childStats.count) > 0 {
            return childStats.count
        }else {
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as! ResultCell
        if (childStats.count) > 0 {
            cell.nameLabel.text = childStats[indexPath.row]?.metadata.legendName
            cell.champImageView.kf.setImage(with: URL(string: childStats[indexPath.row]?.metadata.icon ?? ""))
            
            cell.num1Label.text = changeLabel(str: childStats[safe: indexPath.row]??.stats[safe: 0]?.metadata.name ?? "")
            cell.num2Label.text = changeLabel(str: childStats[safe: indexPath.row]??.stats[safe: 1]?.metadata.name ?? "")
            cell.num3Label.text = changeLabel(str: childStats[safe: indexPath.row]??.stats[safe: 2]?.metadata.name ?? "")
            cell.num4Label.text = changeLabel(str: childStats[safe: indexPath.row]??.stats[safe: 3]?.metadata.name ?? "")
            cell.num5Label.text = changeLabel(str: childStats[safe: indexPath.row]??.stats[safe: 4]?.metadata.name ?? "")
            cell.num6Label.text = changeLabel(str: childStats[safe: indexPath.row]??.stats[safe: 5]?.metadata.name ?? "")
            
            cell.num1ValueLabel.text = childStats[safe: indexPath.row]??.stats[safe: 0]?.displayValue ?? ""
            cell.num2ValueLabel.text = childStats[safe: indexPath.row]??.stats[safe: 1]?.displayValue ?? ""
            cell.num3ValueLabel.text = childStats[safe: indexPath.row]??.stats[safe: 2]?.displayValue ?? ""
            cell.num4ValueLabel.text = childStats[safe: indexPath.row]??.stats[safe: 3]?.displayValue ?? ""
            cell.num5ValueLabel.text = childStats[safe: indexPath.row]??.stats[safe: 4]?.displayValue ?? ""
            cell.num6ValueLabel.text = childStats[safe: indexPath.row]??.stats[safe: 5]?.displayValue ?? ""
            
            cell.num1RankLabel.text = plusSharp(str: childStats[safe: indexPath.row]??.stats[safe: 0]?.displayRank ?? "")
            cell.num2RankLabel.text = plusSharp(str: childStats[safe: indexPath.row]??.stats[safe: 1]?.displayRank ?? "")
            cell.num3RankLabel.text = plusSharp(str: childStats[safe: indexPath.row]??.stats[safe: 2]?.displayRank ?? "")
            cell.num4RankLabel.text = plusSharp(str: childStats[safe: indexPath.row]??.stats[safe: 3]?.displayRank ?? "")
            cell.num5RankLabel.text = plusSharp(str: childStats[safe: indexPath.row]??.stats[safe: 4]?.displayRank ?? "")
            cell.num6RankLabel.text = plusSharp(str: childStats[safe: indexPath.row]??.stats[safe: 5]?.displayRank ?? "")
            

        }
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind:
        String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:
            "StatHeader", for: indexPath) as! StatHeader
        if (stats.count) > 0 {
            header.num1Label.text = changeLabel(str: stats[safe: 0]??.metadata.name ?? "")
            header.num2Label.text = changeLabel(str: stats[safe: 1]??.metadata.name ?? "")
            header.num3Label.text = changeLabel(str: stats[safe: 2]??.metadata.name ?? "")
            header.num4Label.text = changeLabel(str: stats[safe: 3]??.metadata.name ?? "")
            header.num5Label.text = changeLabel(str: stats[safe: 4]??.metadata.name ?? "")
            header.num6Label.text = changeLabel(str: stats[safe: 5]??.metadata.name ?? "")
            header.num7Label.text = changeLabel(str: stats[safe: 6]??.metadata.name ?? "")
            
            header.num1ValueLabel.text = stats[safe: 0]??.displayValue ?? ""
            header.num2ValueLabel.text = stats[safe: 1]??.displayValue ?? ""
            header.num3ValueLabel.text = stats[safe: 2]??.displayValue ?? ""
            header.num4ValueLabel.text = stats[safe: 3]??.displayValue ?? ""
            header.num5ValueLabel.text = stats[safe: 4]??.displayValue ?? ""
            header.num6ValueLabel.text = stats[safe: 5]??.displayValue ?? ""
            header.num7ValueLabel.text = stats[safe: 6]??.displayValue ?? ""
            
            header.num1RankLabel.text = plusSharp(str: stats[safe: 0]??.displayRank ?? "")
            header.num2RankLabel.text = plusSharp(str: stats[safe: 1]??.displayRank ?? "")
            header.num3RankLabel.text = plusSharp(str: stats[safe: 2]??.displayRank ?? "")
            header.num4RankLabel.text = plusSharp(str: stats[safe: 3]??.displayRank ?? "")
            header.num5RankLabel.text = plusSharp(str: stats[safe: 4]??.displayRank ?? "")
            header.num6RankLabel.text = plusSharp(str: stats[safe: 5]??.displayRank ?? "")
            header.num7RankLabel.text = plusSharp(str: stats[safe: 6]??.displayRank ?? "")
        }
        return header
    }
}

extension ResultViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if stats.count == 0 {
            return CGSize(width: view.frame.width, height: 0)
        }else if stats.count >= 5 {
            return CGSize(width: view.frame.width, height: 280)
        }else {
            return CGSize(width: view.frame.width, height: 230)
        }
        
    }
    
}
