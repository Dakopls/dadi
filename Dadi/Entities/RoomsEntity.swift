//
//  RoomsEntity.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

struct RoomsEntity {}
//struct FavoritesRoomEntity: MapRepresentable {
//    var roomId: Int
//    var title: String
//    var verified: Bool
//    var matchProfile: Bool
//    var latitude, longitude: Double
//    var lister: FavoritesListerModel
//    var monthlyPrices: RoomMonthlyPricesModel
//    var picture: PictureModel
//
//    init(map: Map) throws {
//        roomId = try map.get("id")
//        title = try map.get("title")
//        verified = try map.get("verified")
//        matchProfile = try map.get("match_profile")
//        latitude = try map.get("lat")
//        longitude = try map.get("lng")
//        lister = try map.get("lister")
//        monthlyPrices = try map.get("monthly_price")
//        picture = try map.get("pictures")
//    }
//}
//
//struct FavoritesListerModel: MapRepresentable {
//    var userId: Int
//    var firstName: String
//    var age: Int
//    var listerScore: String
//    var picture: PictureModel
//
//    init(map: Map) throws {
//        userId = try map.get("id")
//        firstName = try map.get("first_name")
//        age = try map.get("age")
//        listerScore = try map.get("lister_score")
//        picture = try map.get("cover_picture")
//    }
//}
//
//struct FavoritesDataEntity: MapRepresentable {
//    var rooms: [FavoritesRoomEntity]
//
//    init(map: Map) throws {
//        rooms = (try? map.get("rooms")) ?? []
//    }
//}
//
//struct FavoritesEntity: MapRepresentable {
//    var data: FavoritesDataEntity
//    var pagination: PaginationEntity
//
//    init(map: Map) throws {
//        data = try map.get("data")
//        pagination = try map.get("pagination")
//    }
//}
