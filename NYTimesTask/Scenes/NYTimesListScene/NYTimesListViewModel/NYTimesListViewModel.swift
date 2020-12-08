//
//  NYTimesListViewModel.swift
//  NYTimesTask
//
//  Created by Hassan on 12/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation
import Bond

class NYTimesListViewModel: NYTimesListViewModelProtocol {
    var mostPopular: Observable<[NYTimesListResponseModel]> = Observable<[NYTimesListResponseModel]>([])
    
    private var networkManager : NetworkManagerProtocol
    
    init(networkManager : NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    
    func getMostPopular() {
        let mostViewRepo = NYTimesRepo.mostpopular
        networkManager.sendRequest(responseModel: BaseResponseModel<[NYTimesListResponseModel]>.self,
                                   targetMoya: mostViewRepo) { (response) in
                                    switch response {
                                        
                                    case .success(let model):
                                        if let result = model.results {
                                            self.mostPopular.value = result
                                        }else{
                                            AlertManagerLayer.showAlert(withModel: .error(message: model.fault?.faultstring ?? "" ,
                                                                                          done: "OK",
                                                                                          cancel: nil))
                                        }
                                    case .error(let error):
                                        debugPrint(error)
                                        AlertManagerLayer.showAlert(withModel: .error(message: error.localizedDescription,
                                                                                      done: "OK",
                                                                                      cancel: nil))
                                    }
        }
    }

}
