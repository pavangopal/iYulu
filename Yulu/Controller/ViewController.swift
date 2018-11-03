//
//  ViewController.swift
//  Yulu
//
//  Created by Pavan Gopal on 11/3/18.
//  Copyright © 2018 Pavan Gopal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rightTableView: UITableView!
    @IBOutlet weak var leftTableView: UITableView!
    
    let viewModel = ViewModel()
    var leftTableViewDataSource: TableViewDataSource?
    var rightTableViewDataSource: TableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftTableViewDataSource = TableViewDataSource(friends: [], tableView: leftTableView)
        rightTableViewDataSource = TableViewDataSource(friends: [], tableView: rightTableView)
        
        viewModel.user?.bind = { user in
            self.splitArrayIntoTwoDataSource(user: user,limit:20)
        }
        
        viewModel.getData()
    }
}

extension ViewController {
    func splitArrayIntoTwoDataSource(user:User,limit:Int){
        
        let totalCount = user.friends.count
        
        if user.friends.count > limit{
            leftTableViewDataSource?.friends = Array(user.friends[0...(limit-1)])
            rightTableViewDataSource?.friends = Array(user.friends[limit..<totalCount])
        }else{
            leftTableViewDataSource?.friends = Array(user.friends[0..<totalCount])
        }
    }
}
