//
//  SearchAPIDataManager.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

final class SearchAPIDataManager: SearchAPIDataManagerProtocol {
   
    private let dataRetriever = URLDataRetriever()
    
    // demo purposes
    private let remote = false
    private var locations = [LocationEntity]()
    private var rooms = [RoomEntity]()
    private var roomDetail: RoomDetailEntity?
    //...
    
    func requestLocations(input: String, resultBlock: @escaping APIDataManagerLocationResultBlock) {
        let url = "/locations?text=" + input
        if remote {
            self.dataRetriever.retrieve(url: url, method: "GET") { (result: APIDataManagerLocationResult) in
                resultBlock(result)
            }
        } else {
            self.locations = [LocationEntity(title: "Gràcia, Barcelona", subtitle: "Neighbourhood", boundingbox: ""),
                              LocationEntity(title: "Granada", subtitle: "City", boundingbox: "")]
            resultBlock(.success(self.locations))
        }
    }
    
    func requestRooms(bounds: String, resultBlock: @escaping APIDataManagerRoomsResultBlock) {
        let url = "/rooms?bounds=" + bounds
        if remote {
            self.dataRetriever.retrieve(url: url, method: "GET") {
                (result: APIDataManagerRoomsResult) in
                resultBlock(result)
            }
        } else {
            self.rooms = [RoomEntity(id: 1, title: "Nice room in the centre of Gràcia!", price: "350€", city: "", pictures: [], owner: OwnerEntity(id: 1, display: "Àngel, 24")),
                          RoomEntity(id: 1, title: "Warm room in best neighbourhood", price: "250€", city: "", pictures: [], owner: OwnerEntity(id: 1, display: "Enric, 26")),
                          RoomEntity(id: 1, title: "Warm room in best neighbourhood", price: "280€", city: "", pictures: [], owner: OwnerEntity(id: 1, display: "Carlos, 23"))]
            resultBlock(.success(self.rooms))
        }
    }
    
    func requestRoomDetail(roomId: Int, resultBlock: @escaping APIDataManagerRoomDetailResultBlock) {
        let url = "/rooms/" + String(roomId)
        if remote {
            self.dataRetriever.retrieve(url: url, method: "GET") {
                (result: APIDataManagerRoomDetailResult) in
                resultBlock(result)
            }
        } else {
//            self.roomDetail = RoomDetailEntity()
//                resultBlock(.success(roomDetail))
        }
    }
}
