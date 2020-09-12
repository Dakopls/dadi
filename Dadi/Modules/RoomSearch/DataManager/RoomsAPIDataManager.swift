//
//  RoomsAPIDataManager.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

final class RoomsAPIDataManager: RoomsAPIDataManagerProtocol {
    
    init() {}
    
    func load(page: Int, per: Int, resultBlock: @escaping APIDataManagerRoomsResultBlock) {
//        let body: [String: Any] = ["page": page, "per": per]
//        APIDataManager.shared.makeAPIRequest(forEndpoint: "", parameters: body, result: resultBlock)
    }
    
    func requestRoomDetail(roomId: Int, resultBlock: @escaping APIDataManagerRoomDetailResultBlock) {
        //TODO
    }
}
