//
//  NYTimesListResponseModel.swift
//  NYTimesTask
//
//  Created by Hassan on 12/8/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation


struct NYTimesListResponseModel : Codable {
    let url : String?
    let id : Int?
    let asset_id : Int?
    let published_date: String?
    let source : String?
    let updated : String?
    let section : String?
    let subsection: String?
    let nytdsection : String?
    let adx_keywords : String?
    let byline : String?
    let type : String?
    let title : String?
    let media : [NYTimesListMediaResponseModel]?
}
struct NYTimesListMediaResponseModel : Codable {
    let type , subtype , caption , copyright: String?
    let mediaMetadata : [NYTimesListMediaMetaResponseModel]?
    enum CodingKeys : String, CodingKey {
        case type , subtype , caption , copyright
        case mediaMetadata = "media-metadata"
    }
}
struct NYTimesListMediaMetaResponseModel : Codable {
    let url : String?
    let format :String?
    let height ,width :Int?
}
