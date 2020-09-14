//
//  FavoritesWireframe.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 13/09/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import UIKit

//mock, implementation of module TBD
class FavoritesWireframe {
    
    var rooms: UIViewController?
    
    static func createModule() -> UIViewController {
        let rooms = FavoritesViewController()
        return rooms
    }
}
