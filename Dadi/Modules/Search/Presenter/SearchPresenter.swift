//
//  SearchPresenter.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 14/09/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import UIKit

class SearchPresenter: SearchPresenterProtocol, SearchInteractorOutputProtocol {
    
    var home: SeekerHomeViewProtocol?
    var locations: LocationsViewProtocol?
    var rooms: RoomsViewProtocol?
    var detail: RoomDetailViewProtocol?
    var booking: BookingViewProtocol?
    
    var wireframe: SearchWireframeProtocol?
    var interactor: SearchInteractorInputProtocol?
    
    func perform(action: SearchAction) {
        switch action {
        case .searchPressed:
            wireframe?.navigate(to: .locations)
        case .listingPressed: break
//            wireframe?.navigate(to: .listing)
        case .fetchLocation(let text):
            interactor?.do(.requestLocations(text: text))
        case .selectLocation(let location):
            interactor?.do(.storeLocation(entity: location))
            wireframe?.navigate(to: .rooms(location: location.title))
        case .fetchRooms:
            interactor?.do(.requestRooms)
        case .selectRoom(let entity):
            interactor?.do(.storeRoom(entity: entity))
            wireframe?.navigate(to: .roomDetail)
        case .fetchRoomDetail:
            interactor?.do(.requestRoomDetail)
        case .selectBooking:
            wireframe?.navigate(to: .booking)
        }
    }
    
    func handle(_ result: SearchInteractorResult) {
        switch result {
        case .locationsFailure(let error):
            print(error) //TBD
        case .roomsFailure(let error):
            print(error) //TBD
        case .roomDetailFailure(let error):
            print(error) //TBD
        case .locationsSuccess(let locations):
            self.locations?.populate(.success(entity: locations))
        case .roomsSuccess(let rooms):
            self.rooms?.populate(.success(entity: rooms))
        case .roomDetailSuccess(let detail):
            self.detail?.populate(.success(entity: detail))
        }
    }
}
