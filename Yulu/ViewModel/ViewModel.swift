//
//  ViewModel.swift
//  Yulu
//
//  Created by Pavan Gopal on 11/3/18.
//  Copyright © 2018 Pavan Gopal. All rights reserved.
//

import Foundation

class ViewModel {
    
    var user:Dynamic<User>? = Dynamic<User>(nil)
    
}

extension ViewModel {
    func getData() {
        guard let data = dataFromFile(Constants.fileName) else {
            return
        }
        
        let decoder = JSONDecoder()
        do{
            let user = try decoder.decode(User.self, from: data)
            self.user?.value = user
        }catch let error{
            print("Error while parsing:\(error.localizedDescription)")
        }
    }
}
