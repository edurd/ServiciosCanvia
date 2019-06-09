//
//  ViewController.swift
//  ServiciosCanvia
//
//  Created by Eduardo Hoyos Loli on 6/7/19.
//  Copyright © 2019 Eduardo Hoyos Loli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var menuTableView: UITableView!
    
    var cells = [MenuCell]()
    
    var menuSelected : Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        Menu.requestMenu { (menus) in
            if let menus = menus {
                for menu in menus {
                    self.cells.append(MenuCell(menu: menu, type: .menuItem))
                    self.menuTableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let type = self.cells[indexPath.row].type {
            switch type {
            case .menuItem :
                let cell = menuTableView.dequeueReusableCell(withIdentifier: "menuCellId", for: indexPath) as! MenuTableViewCell
                cell.menu = self.cells[indexPath.row].menu
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let type = self.cells[indexPath.row].type {
            switch type {
            case .menuItem :
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let controller = storyboard.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
//                controller.menu = self.cells[indexPath.row].menu
//                self.navigationController?.pushViewController(controller, animated: true)
                self.menuSelected = self.cells[indexPath.row].menu
                performSegue(withIdentifier: "detailSegue", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let controller = segue.destination as! DetailViewController
            controller.menu = self.menuSelected
        }
    }
}

class MenuCell: NSObject {
    var menu : Menu?
    var type : CellType?
    
    init(menu : Menu, type: CellType) {
        self.menu = menu
        self.type = type
    }
}

enum CellType {
    case menuItem
}
