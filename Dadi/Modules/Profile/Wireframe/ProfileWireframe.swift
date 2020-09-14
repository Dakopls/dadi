//
//  ProfileWireframe.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 13/09/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import UIKit

//mock, implementation of module TBD
class ProfileWireframe {
    
    var profile: UIViewController?
    
    static func createModule() -> UIViewController {
        let profile = ProfileViewController()
        return profile
    }
}
