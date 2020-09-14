//
//  SearchInteractorInputProtocol.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

enum SearchJob {
    case requestLocations(text: String)
    case storeLocation(entity: LocationEntity)
    case requestRooms
    case storeRoom(entity: RoomEntity)
    case requestRoomDetail
}

protocol SearchInteractorInputProtocol: class {
    
    var location: LocationEntity? { get set }
    var room: RoomEntity? { get set }
    
    var presenter: SearchInteractorOutputProtocol? { get set }
    var datamanager: SearchAPIDataManagerProtocol? { get set }
    
    func `do`(_ job: SearchJob)
}
