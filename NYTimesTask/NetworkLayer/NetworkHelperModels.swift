//
//  NetworkHelperModels.swift
//  NYTimesTask
//
//  Created by Hassan on 12/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation
import Moya



typealias NetworkTargetType = TargetType & NetworkLoaderProtocol


enum Response<T:Codable> {
    case success(T)
    case error(Error)
}


struct ConstantNetwork {
    static var BASE_URL : String = "https://api.nytimes.com/svc/"
    static var API_TOKEN : String = "Ky8AT01bwqOuQpFEHGkbLORqWBbVmEtv"
}
