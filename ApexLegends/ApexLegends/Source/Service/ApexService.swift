//
//  ApexService.swift
//  ApexLegends
//
//  Created by 엄태형 on 2019. 3. 2..
//  Copyright © 2019년 엄태형. All rights reserved.
//

import Foundation
import Alamofire

protocol ApexServiceType {
    func searchApex(id: String, platform: String, completion: @escaping (Result<Apex>) -> ())
}

struct ApexService: ApexServiceType {
    
    func searchApex(id: String, platform: String, completion: @escaping (Result<Apex>) -> ()) {
        print("start")
        let apiKey = "d13d95e0-b2ac-477b-9cf7-584d3dd5174b"
        let apiURL = "https://public-api.tracker.gg/apex/v1/standard/profile/\(platform)/\(id)"
        
        var headers = [String: String]()
        headers.updateValue(apiKey, forKey: "TRN-Api-Key")
        
        Alamofire
            .request(apiURL, method: .get, headers: headers)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(let value) :
                    do {
                        let decodableValue = try JSONDecoder().decode(Apex.self, from: value)
                        print("aa = \(decodableValue)")
                        completion(Result.success(decodableValue))
                    } catch {
                        completion(.failure(nil, error))
                    }
                case .failure(let error):
                    print("ssip error = \(error)")
                }
        }
    }
}
