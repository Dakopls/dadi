//
//  RoomsInteractorOutputProtocol.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

enum RoomsInteractorResult {
    case roomsFailure(String)
    case roomsSuccess([RoomViewModel])
    case roomDetailSuccess(RoomDetailViewModel)
}

protocol RoomsInteractorOutputProtocol: class {
    
    func handle(_ result: RoomsInteractorResult)
}
