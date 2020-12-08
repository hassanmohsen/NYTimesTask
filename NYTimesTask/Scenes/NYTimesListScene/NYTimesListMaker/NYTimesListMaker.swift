//
//  NYTimesListMaker.swift
//  NYTimesTask
//
//  Created by Hassan on 12/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation
import UIKit

struct NYTimesListMaker {
    static func make() -> UIViewController {
        
        let listViewModel = NYTimesListViewModel.init(networkManager: NetworkManagerMaker.networkMake())
        let listVC = NYTimesListViewController.init(viewModel: listViewModel)
        let listNavigation = UINavigationController.init(rootViewController: listVC)
        return listNavigation
        
    }
}
