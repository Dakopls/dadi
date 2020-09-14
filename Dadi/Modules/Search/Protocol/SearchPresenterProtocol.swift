//
//  SearchPresenterProtocol.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

enum SearchAction {
    case searchPressed
    case listingPressed
    case fetchLocation(text: String)
    case selectLocation(location: LocationEntity)
    case fetchRooms
    case selectRoom(room: RoomEntity)
    case fetchRoomDetail
    case selectBooking
}

protocol SearchPresenterProtocol: class {
    
    var home: SeekerHomeViewProtocol? { get set }
    var locations: LocationsViewProtocol? { get set }
    var rooms: RoomsViewProtocol? { get set }
    var detail: RoomDetailViewProtocol? { get set }
    var booking: BookingViewProtocol? { get set }
    
    var interactor: SearchInteractorInputProtocol? { get set }
    var wireframe: SearchWireframeProtocol? { get set }
    
    func perform(action: SearchAction)
}
