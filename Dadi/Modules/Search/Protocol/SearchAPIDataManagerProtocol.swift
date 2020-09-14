//
//  RoomsAPIDataManagerProtocol.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

typealias APIDataManagerLocationResult = (Result<[LocationEntity], Error>)
typealias APIDataManagerRoomsResult = (Result<[RoomEntity], Error>)
typealias APIDataManagerRoomDetailResult = (Result<RoomDetailEntity, Error>)

typealias APIDataManagerLocationResultBlock = (Result<[LocationEntity], Error>) -> Void
typealias APIDataManagerRoomsResultBlock = (Result<[RoomEntity], Error>) -> Void
typealias APIDataManagerRoomDetailResultBlock = (Result<RoomDetailEntity, Error>) -> Void

protocol SearchAPIDataManagerProtocol: class {
    
    func requestLocations(input: String, resultBlock: @escaping APIDataManagerLocationResultBlock)
    func requestRooms(bounds: String, resultBlock: @escaping APIDataManagerRoomsResultBlock)
    func requestRoomDetail(roomId: Int, resultBlock: @escaping APIDataManagerRoomDetailResultBlock)
//    func postBooking(entity: BookingEntity, resultBlock: @escaping APIDataManagerBookingResultBlock) //TBD
}
