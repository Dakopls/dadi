//
//  RoomsAPIDataManagerProtocol.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

typealias APIDataManagerRoomsResultBlock = (Result<RoomsEntity, ErrorModel>) -> Void
typealias APIDataManagerRoomDetailResultBlock = (Result<RoomDetailEntity, ErrorModel>) -> Void

protocol RoomsAPIDataManagerProtocol: class {
    
    func load(page: Int, per: Int, resultBlock: @escaping APIDataManagerRoomsResultBlock)
    
    func requestRoomDetail(roomId: Int, resultBlock: @escaping APIDataManagerRoomDetailResultBlock)
}
