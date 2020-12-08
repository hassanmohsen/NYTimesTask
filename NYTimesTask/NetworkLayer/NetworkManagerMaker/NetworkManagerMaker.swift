//
//  NetworkManagerMaker.swift
//  NYTimesTask
//
//  Created by Hassan on 12/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation

struct NetworkManagerMaker {
    static func networkMake() -> NetworkManagerProtocol {
        return APIRequestManager.init()
    }
}
