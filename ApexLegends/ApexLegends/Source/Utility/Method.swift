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
}

class Method: NSObject {
    static func alert(type: Types) -> UIAlertController {
        switch type {
        case .Search:
            let alertController = UIAlertController(title: "알림",message: "ID 혹은 플랫폼이 입력되지 않았습니다. \n 다시한번 확인해주세요", preferredStyle: UIAlertController.Style.alert)
            let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.cancel, handler: nil)
            alertController.addAction(cancelButton)
            return alertController
//            self.present(alertController,animated: true,completion: nil)
        case .Result:
            let alertController = UIAlertController(title: "알림",message: "ID가 검색이 되지않습니다. \n ID를 다시 확인해주세요.", preferredStyle: UIAlertController.Style.alert)
            let cancelButton = UIAlertAction(title: "확인", style: UIAlertAction.Style.cancel) { (action) in
                let resultVC = ResultViewController()
                resultVC.navigationController?.popViewController(animated: true)
            }
            alertController.addAction(cancelButton)
            return alertController
//            self.present(alertController,animated: true,completion: nil)
        default:
            break
        }
    }
}
