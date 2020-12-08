//
//  AlertManagerModel.swift
//  NYTimesTask
//
//  Created by Hassan on 12/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation


//struct AlertManagerModel {
//    var message : String
//    var done :String
//    var cancel : String?
//    var messageType : AlertManagerModel
//}
enum AlertManagerModel {
    case error(message : String , done: String , cancel:String?)
    case success(message : String , done: String , cancel:String?)
    case warning(message : String , done: String , cancel:String?)
    
    var title: String {
        switch self {
        case .error:
            return "Error"
        case .success:
            return "Success"
        case .warning:
            return "Warning"
        }
    }
}
