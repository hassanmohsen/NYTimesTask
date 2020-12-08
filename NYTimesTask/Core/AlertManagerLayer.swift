//
//  AlertManagerLayer.swift
//  NYTimesTask
//
//  Created by Hassan on 12/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation


struct AlertManagerLayer {
    static func showAlert(withModel model : AlertManagerModel) -> Void {
        switch model {
        case .error(message: let message, done: let done, cancel: let cancel):
            print(message , done , cancel ?? "")
        case .success(message: let message, done: let done, cancel: let cancel):
            print(message , done , cancel ?? "")
        case .warning(message: let message, done: let done, cancel: let cancel):
            print(message , done , cancel ?? "")
        }
    }
}
