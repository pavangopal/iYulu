//
//  LeftTableViewDataSource.swift
//  Yulu
//
//  Created by Pavan Gopal on 11/3/18.
//  Copyright © 2018 Pavan Gopal. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {
    
    weak var tableView: UITableView?
    
    var friends:[String] = [] {
        didSet{
            tableView?.reloadData()
        }
    }
    
    required init(friends:[String],tableView:UITableView) {
        self.friends = friends
        self.tableView = tableView
        super.init()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellId)
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId, for: indexPath)
        cell.textLabel?.text = friends[indexPath.row]
        return cell
    }
    
}
