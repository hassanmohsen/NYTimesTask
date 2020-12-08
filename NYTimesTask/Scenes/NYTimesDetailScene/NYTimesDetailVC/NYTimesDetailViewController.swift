//
//  NYTimesDetailViewController.swift
//  NYTimesTask
//
//  Created by Hassan on 12/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import UIKit

class NYTimesDetailViewController: UIViewController {

    //MARK:- IB Outlets
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblsubTitle: UILabel!
    @IBOutlet weak var lblUrl: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    //MARK:- Properties
    private var viewModel : NYTimesDetailViewModelProtocol!
    
    
    //MARK:- Initializer
    init(viewModel : NYTimesDetailViewModelProtocol) {
        super.init(nibName: String.init(describing: NYTimesDetailViewController.self), bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:- View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindValues()
        self.viewModel.getItemDetail()
        
    }
    //MARK:- Configuration
    private func bindValues() -> Void {
        self.viewModel.itemDetail.bind(to: self) { (strongSelf, model) in
            if let model = model {
                CashImagesLayer.cashImage(imageView: strongSelf.imgAvatar, imgUrl: model.media?.first?.mediaMetadata?.last?.url)
                
                strongSelf.lblTitle.text = model.title
                strongSelf.lblsubTitle.text = model.byline
                strongSelf.lblUrl.text = model.url
                strongSelf.lblDate.text = model.published_date
            }
        }
    }
    //MARK:- Private helpers

    

}
