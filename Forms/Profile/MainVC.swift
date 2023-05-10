//
//  MainVC.swift
//  Forms
//
//  Created by sankara-pt6210 on 10/05/23.
//

import UIKit

class MainVC: UIViewController {
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
}
