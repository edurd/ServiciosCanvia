//
//  MenuTableViewCell.swift
//  ServiciosCanvia
//
//  Created by Eduardo Hoyos Loli on 6/7/19.
//  Copyright © 2019 Eduardo Hoyos Loli. All rights reserved.
//

import UIKit
import Kingfisher

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var nameMenuLabel: UILabel!
    @IBOutlet weak var priceMenuLabel: UILabel!
    
    var menu : Menu? {
        didSet {
            if let menu = menu {
                nameMenuLabel.text = menu.name
                if let price = menu.price {
                    priceMenuLabel.text = "$ \(price)"
                }
                
                if let url = menu.imageUrl {
                    menuImage.kf.setImage(with: URL(string: url))
                }
                
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        menuImage.layer.cornerRadius = 40
        menuImage.layer.borderWidth = 1
        menuImage.layer.borderColor = UIColor.orange.cgColor
        menuImage.contentMode = .scaleAspectFill
        priceMenuLabel.backgroundColor = UIColor.orange
        priceMenuLabel.layer.cornerRadius = 12.5
        priceMenuLabel.clipsToBounds = true
        priceMenuLabel.textColor = UIColor.white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
