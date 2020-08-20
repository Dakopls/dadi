//
//  RoomsInteractorInputProtocol.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

enum RoomsJob: Equatable {
    case requestRooms
    case scrollTo(_ index: Int)
    case requestRoomDetail(_ index: Int)
}

protocol RoomsInteractorInputProtocol: class {
    
    var presenter: RoomsInteractorOutputProtocol? { get set }
    var datamanager: RoomsAPIDataManagerProtocol? { get set }
    
    func `do`(_ job: RoomsJob)
}
