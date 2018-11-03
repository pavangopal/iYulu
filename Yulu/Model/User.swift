//
//  Users.swift
//  Yulu
//
//  Created by Pavan Gopal on 11/3/18.
//  Copyright © 2018 Pavan Gopal. All rights reserved.
//

import Foundation

struct User:Codable {
    var name:String?
    var friends:[String] = []
}
