//
//  NYTimesListCell.swift
//  NYTimesTask
//
//  Created by Hassan on 12/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import UIKit

class NYTimesListCell: UITableViewCell ,ReusableView , NibLoadableView {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    
    func configure(item : NYTimesListResponseModel) -> Void {
        lblTitle.text = item.title
        lblSubTitle.text = item.byline
        lblDate.text = item.published_date
        CashImagesLayer.cashImage(imageView: imgAvatar, imgUrl: item.media?.first?.mediaMetadata?.first?.url)
    }
    
    
}
