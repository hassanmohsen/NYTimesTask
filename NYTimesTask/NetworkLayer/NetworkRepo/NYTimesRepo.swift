//
//  NYTimesRepo.swift
//  NYTimesTask
//
//  Created by Hassan on 12/8/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation
import Moya


enum NYTimesRepo {
    case mostpopular
}

extension NYTimesRepo : NetworkTargetType {
    var baseURL: URL {
        return URL.init(string: ConstantNetwork.BASE_URL)!
    }
    
    var path: String {
        switch self {
        case .mostpopular:
            return "mostpopular/v2/viewed/1.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .mostpopular:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        
        case .mostpopular:
            return .requestParameters(parameters: ["api-key": ConstantNetwork.API_TOKEN],
                                      encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    var showLoader: Bool {
        return true
    }
    
    
}
