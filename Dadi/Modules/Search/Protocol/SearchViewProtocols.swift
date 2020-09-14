//
//  SearchViewProtocols.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

protocol SeekerHomeViewProtocol: class {
    
    var presenter: SearchPresenterProtocol? { get set }
}

enum LocationsState {
    case success(entity: [LocationEntity])
    case error(error: String)
}

protocol LocationsViewProtocol: class {
    
    var presenter: SearchPresenterProtocol? { get set }
    
    func populate(_ state: LocationsState)
}

enum RoomsState {
    case success(entity: [RoomEntity])
    case error(error: String)
}

protocol RoomsViewProtocol: class {
    
    var presenter: SearchPresenterProtocol? { get set }
    
    func populate(_ state: RoomsState)
}

enum RoomDetailState {
    case success(entity: RoomDetailEntity)
    case error(error: String)
}

protocol RoomDetailViewProtocol: class {
    
    var presenter: SearchPresenterProtocol? { get set }
    
    func populate(_ state: RoomDetailState)
}

protocol BookingViewProtocol: class {
    
    var presenter: SearchPresenterProtocol? { get set }
}
