//
//  SearchInteractor.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 14/09/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

class SearchInteractor: SearchInteractorInputProtocol {
   
    var location: LocationEntity?
    var room: RoomEntity?
    
    var presenter: SearchInteractorOutputProtocol?
    var datamanager: SearchAPIDataManagerProtocol?
    
    func `do`(_ job: SearchJob) {
        switch job {
        case .requestLocations(let text):
            fetchLocations(text: text)
        case .storeLocation(let location):
            self.location = location
        case .requestRooms:
            fetchRooms()
        case .storeRoom(let room):
            self.room = room
        case .requestRoomDetail:
            fetchRoomDetail()
        }
    }
    
    private func fetchLocations(text: String) {
        let clean = text.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        self.datamanager?.requestLocations(input: clean) { result in
            switch result {
            case .success(let locations):
                self.handleLocations(result: locations)
            case .failure(let error):
                self.handleLocationsError(error: error)
            }
            
        }
    }
    
    private func fetchRooms() {
        guard let boundingbox = location?.boundingbox else {
            return
        }
        self.datamanager?.requestRooms(bounds: boundingbox) { result in
            switch result {
            case .success(let rooms):
                self.handleRooms(result: rooms)
            case .failure(let error):
                self.handleRoomsError(error: error)
            }
        }
    }
    
    private func fetchRoomDetail() {
        guard let roomId = room?.id else {
            return
        }
        self.datamanager?.requestRoomDetail(roomId: roomId) { result in
            switch result {
            case .success(let detail):
                self.handleRoomDetail(result: detail)
            case .failure(let error):
                self.handleRoomDetailError(error: error)
            }
        }
    }
    
    private func handleLocations(result: [LocationEntity]) {
        self.presenter?.handle(.locationsSuccess(result))
    }
    
    private func handleLocationsError(error: Error) {
        self.presenter?.handle(.locationsFailure(error.localizedDescription))
    }
    
    private func handleRooms(result: [RoomEntity]) {
        self.presenter?.handle(.roomsSuccess(result))
    }
    
    private func handleRoomsError(error: Error) {
        self.presenter?.handle(.roomsFailure(error.localizedDescription))
    }
    
    private func handleRoomDetail(result: RoomDetailEntity) {
        self.presenter?.handle(.roomDetailSuccess(result))
    }
    
    private func handleRoomDetailError(error: Error) {
        self.presenter?.handle(.roomDetailFailure(error.localizedDescription))
    }
}
