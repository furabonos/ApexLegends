//
//  Method.swift
//  ApexLegends
//
//  Created by Euijae Hong on 07/03/2019.
//  Copyright © 2019 엄태형. All rights reserved.
//

import UIKit

enum Types {
    case Search
    case Result
    case Fail
    case Success
    case DelSuccess
}

class Method: NSObject {
    static func alert(type: Types) -> UIAlertController {
        switch type {
        case .Search:
            let alertController = UIAlertController(title: "알림",message: "ID가 입력되지 않았습니다. \n 다시한번 확인해주세요", preferredStyle: UIAlertController.Style.alert)
            let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.cancel, handler: nil)
            alertController.addAction(cancelButton)
            return alertController
        case .Result:
            let alertController = UIAlertController(title: "알림",message: "ID가 검색이 되지않습니다. \n ID를 다시 확인해주세요.", preferredStyle: UIAlertController.Style.alert)
            let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.cancel) { (action) in
                let resultVC = ResultViewController()
                resultVC.navigationController?.popViewController(animated: true)
            }
            alertController.addAction(cancelButton)
            return alertController
        case .Fail:
            let alertController = UIAlertController(title: "알림",message: "즐겨찾기 추가에 실패하였습니다. \n잠시후 다시 시도해주세요.", preferredStyle: UIAlertController.Style.alert)
            let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.cancel) { (action) in
                let resultVC = ResultViewController()
                resultVC.navigationController?.popViewController(animated: true)
            }
            alertController.addAction(cancelButton)
            return alertController
        case .Success:
            let alertController = UIAlertController(title: "알림",message: "즐겨찾기에 추가되었습니다.", preferredStyle: UIAlertController.Style.alert)
            let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.cancel) { (action) in
                let resultVC = ResultViewController()
                resultVC.navigationController?.popViewController(animated: true)
            }
            alertController.addAction(cancelButton)
            return alertController
        case .DelSuccess:
            let alertController = UIAlertController(title: "알림",message: "즐겨찾기에서 삭제되었습니다.", preferredStyle: UIAlertController.Style.alert)
            let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.cancel) { (action) in
                let resultVC = ResultViewController()
                resultVC.navigationController?.popViewController(animated: true)
            }
            alertController.addAction(cancelButton)
            return alertController
        default:
            break
        }
    }
}
