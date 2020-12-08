//
//  NYTimesDetailViewModel.swift
//  NYTimesTask
//
//  Created by Hassan on 12/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation
import Bond

class NYTimesDetailViewModel: NYTimesDetailViewModelProtocol {
    var itemDetail: Observable<NYTimesListResponseModel?> = Observable<NYTimesListResponseModel?>(nil)
    
    
    
    
    
    
    private var itemId : Int?
    private var item : NYTimesListResponseModel?
    
    init(withID id :Int) {
        self.itemId = id
    }
    init(withItem item : NYTimesListResponseModel) {
        self.item = item
    }
    func getItemDetail() {
        if let _ = itemId {
            // get detail from api
        }else if let item = item {
            self.itemDetail.value = item
        }
    }
    
    
}
