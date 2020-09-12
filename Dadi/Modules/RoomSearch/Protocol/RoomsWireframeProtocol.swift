//
//  RoomsWireframeProtocol.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import UIKit

enum RoomsPath {
//    case goToRoom(_ roomDetail: RoomDetailModel) //ok...
    case exitRooms
}

protocol RoomsWireframeProtocol: BaseWireframeProtocol {
    
    var view: UIViewController? { get set }
    
    static func createModule() -> UIViewController
    
    func navigate(_ to: RoomsPath)
    
}
