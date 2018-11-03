//
//  Helper.swift
//  Yulu
//
//  Created by Pavan Gopal on 11/3/18.
//  Copyright © 2018 Pavan Gopal. All rights reserved.
//

import Foundation

public func dataFromFile(_ filename: String) -> Data? {
    @objc class TestClass: NSObject { }
    
    let bundle = Bundle(for: TestClass.self)
    if let path = bundle.path(forResource: filename, ofType: "json") {
        return (try? Data(contentsOf: URL(fileURLWithPath: path)))
    }
    return nil
}
