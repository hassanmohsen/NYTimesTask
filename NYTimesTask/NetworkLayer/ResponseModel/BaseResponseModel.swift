//
//  BaseResponseModel.swift
//  NYTimesTask
//
//  Created by Hassan on 12/8/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation



struct BaseResponseModel<T:Codable> : Codable {
    let status , copyright: String?
    let num_results : Int?
    let results : T?
    let fault : BaseResponseFault?
}

struct BaseResponseFault : Codable {
    let faultstring : String?
    let detail : BaseResponseFaultDetail?
}
struct BaseResponseFaultDetail : Codable {
    let errorcode : String?
}
