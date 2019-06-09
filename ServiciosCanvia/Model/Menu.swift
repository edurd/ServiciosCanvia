//
//  Menu.swift
//  ServiciosCanvia
//
//  Created by Eduardo Hoyos Loli on 6/7/19.
//  Copyright © 2019 Eduardo Hoyos Loli. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Menu: NSObject {
    var id : Int?
    var name : String?
    var price : String?
    var category : String?
    var desc : String?
    var imageUrl : String?
    
    
    static func requestMenu(handler : @escaping ([Menu]?) -> Void) {
        let url = Constants.Menu.get
        
        Alamofire.request(url).responseJSON { (response) in
            if let value = response.result.value {
                let json = JSON(value)
                var menus = [Menu]()
                if let array = json["items"].array {
                    let count = array.count
                    for i in 0..<count {
                        let menu = Menu()
                        menu.id = array[i]["id"].intValue
                        menu.name = array[i]["name"].stringValue
                        menu.price = array[i]["price"].stringValue
                        menu.desc = array[i]["description"].stringValue
                        menu.imageUrl = array[i]["image_url"].stringValue
                        menu.category = array[i]["category"].stringValue
                        menus.append(menu)
                    }
                }
                handler(menus)
            }
        }
    }
    
    
}

