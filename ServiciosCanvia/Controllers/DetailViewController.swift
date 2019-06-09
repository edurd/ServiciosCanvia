//
//  DetailViewController.swift
//  ServiciosCanvia
//
//  Created by Eduardo Hoyos Loli on 6/7/19.
//  Copyright © 2019 Eduardo Hoyos Loli. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UITableViewController {
    
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var nameMenuLabel: UILabel!
    @IBOutlet weak var ccategoryLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    var menu : Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detalle"
        if let menu = menu {
            if let image = menu.imageUrl {
                menuImage.kf.setImage(with: URL(string: image))
            }
            nameMenuLabel.text = menu.name
            ccategoryLabel.text = menu.category
            descLabel.text = menu.desc
            if let price = menu.price {
                priceLabel.text = "$ \(price)"
            }
            
        }
        
    }
}
