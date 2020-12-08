//
//  NetworkManagerProtocol.swift
//  NYTimesTask
//
//  Created by Hassan on 12/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation


protocol NetworkManagerProtocol {
    func sendRequest<T:Codable , R: NetworkTargetType>(responseModel : T.Type , targetMoya : R , completion : @escaping (_ response : Response<T>)-> Void) -> Void
}


protocol NetworkLoaderProtocol {
    var showLoader : Bool {get}
}
