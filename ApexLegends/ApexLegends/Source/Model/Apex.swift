//
//  Apex.swift
//  ApexLegends
//
//  Created by 엄태형 on 2019. 3. 2..
//  Copyright © 2019년 엄태형. All rights reserved.
//

import Foundation

struct Apex: Decodable {
    var data: Datas
    //    var stats: [Stats]
    //    var rank: Int
    
    enum CodingKeys: String, CodingKey {
        case data//, stats, rank
    }
}

struct Datas: Decodable {
    var type: String
    var metadata: ProfileMetadata // ?
    var children: [Children] //캐릭별 스탯
    var stats: [Stats] // 계정전체 스탯
    
    enum CondingKeys: String, CodingKey {
        case type, metadata, children, stats
    }
}

struct ProfileMetadata: Decodable {
    var platformUserHandle: String
    var cacheExpireDate: String
    
    enum CodingKeys: String, CodingKey {
        case platformUserHandle, cacheExpireDate
    }
}

struct Children: Decodable {
    var id: String
    var metadata: ChildMetadata
    var stats: [ChildStats]
    
    enum CodingKeys: String, CodingKey {
        case id, metadata, stats
    }
}

struct ChildStats: Decodable {
    var displayValue: String
    var displayRank: String
    var metadata: CharacterMetadata
//    var percentile: Int
    
    enum CodingKeys: String, CodingKey {
        case displayValue, displayRank, metadata//, percentile
    }
}

struct CharacterMetadata: Decodable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

struct ChildMetadata: Decodable {
    var icon: String
    var legendName: String
    var bgimage: String
    
    enum CodingKeys: String, CodingKey {
        case icon, bgimage
        case legendName = "legend_name"
    }
}

struct Stats: Decodable {
    var displayValue: String
    var displayRank: String
//    var percentile: Int
    var metadata: StatsMetadata
    
    enum CodingKeys: String, CodingKey {
        case displayValue, displayRank, metadata//, percentile
    }
}

struct StatsMetadata: Decodable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
