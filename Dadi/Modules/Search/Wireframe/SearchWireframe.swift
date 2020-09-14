//
//  SearchWireframe.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 13/09/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import UIKit

class SearchWireframe: SearchWireframeProtocol {
    
    var home: UIViewController!
    var locations: UIViewController?
    var rooms: UIViewController?
    var detail: UIViewController?
    var booking: UIViewController?
    
    var presenter: SearchPresenterProtocol?
    
    init() {
        self.presenter = SearchPresenter()
        let home = SeekerHomeViewController()
        home.presenter = self.presenter
        self.presenter?.home = home
        self.presenter?.wireframe = self
        self.home = home
    }
    
    func navigate(to page: SearchPage) {
        switch page {
        case .locations:
            pushLocations()
        case .rooms(let location):
            pushRooms(location: location)
        case .roomDetail: break
//            pushRoomDetail()
        case .booking: break
//            pushBooking()
        }
    }
    
    private func pushLocations() {
        if self.locations == nil {
            let locations = LocationsViewController()
            locations.presenter = self.presenter
            presenter?.locations = locations
            self.locations = locations as UIViewController
        }
        home.show(self.locations!, sender: self.home)
    }
    
    private func pushRooms(location: String) {
        let rooms = RoomsViewController(location: location)
        rooms.presenter = self.presenter
        presenter?.rooms = rooms
        self.rooms = rooms as UIViewController
        home.show(self.rooms!, sender: self.locations)
    }
    
//    private func pushRoomDetail() {
//        if self.detail == nil {
//            let detail = RoomDetailViewController()
//            detail.presenter = self.presenter
//            presenter?.detail = detail
//            self.detail = detail as UIViewController
//        }
//        home.show(self.detail!, sender: self.rooms)
//    }
//    
//    private func pushBooking() {
//        if self.booking == nil {
//            let booking = BookingViewController()
//            booking.presenter = self.presenter
//            presenter?.booking = booking
//            self.booking = booking as UIViewController
//        }
//        home.show(self.booking!, sender: self.rooms)
//    }
}
