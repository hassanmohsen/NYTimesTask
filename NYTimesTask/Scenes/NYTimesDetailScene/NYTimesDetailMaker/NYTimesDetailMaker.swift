//
//  NYTimesDetailMaker.swift
//  NYTimesTask
//
//  Created by Hassan on 12/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation
import UIKit

struct NYTimesDetailMaker {
    static func make(withId id : Int) -> UIViewController {
        let viewModel = NYTimesDetailViewModel.init(withID: id)
        let vc = NYTimesDetailViewController.init(viewModel: viewModel)
        return vc
    }
    static func make(withItem item : NYTimesListResponseModel ) -> UIViewController {
        let viewModel = NYTimesDetailViewModel.init(withItem: item)
        let vc = NYTimesDetailViewController.init(viewModel: viewModel)
        return vc
    }
}
