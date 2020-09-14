//
//  SearchAPIDataManager.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

final class RoomsAPIDataManager: SearchAPIDataManagerProtocol {
   
    private let dataRetriever = URLDataRetriever()
    
    func requestLocations(input: String, resultBlock: @escaping APIDataManagerLocationResultBlock) {
        let url = "/locations?text=" + input
        self.dataRetriever.retrieve(url: url, method: "GET") { (result: APIDataManagerLocationResult) in
            resultBlock(result)
        }
    }
    
    func requestRooms(bounds: String, resultBlock: @escaping APIDataManagerRoomsResultBlock) {
        let url = "/rooms?bounds=" + bounds
        self.dataRetriever.retrieve(url: url, method: "GET") {
            (result: APIDataManagerRoomsResult) in
            resultBlock(result)
        }
    }
    
    func requestRoomDetail(roomId: Int, resultBlock: @escaping APIDataManagerRoomDetailResultBlock) {
        let url = "/rooms/" + String(roomId)
        self.dataRetriever.retrieve(url: url, method: "GET") {
            (result: APIDataManagerRoomDetailResult) in
            resultBlock(result)
        }
    }
}
