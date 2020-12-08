//
//  NYTimesDetailViewModelProtocol.swift
//  NYTimesTask
//
//  Created by Hassan on 12/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation
import Bond

protocol NYTimesDetailViewModelProtocol {
    
    var itemDetail : Observable<NYTimesListResponseModel?> {get set}
    
    func getItemDetail() -> Void
    
    
}
