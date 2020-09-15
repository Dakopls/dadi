//
//  RoomDetailEntity.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

struct RoomDetailEntity: Codable {
    var id: Int
    var title: String
    var description: String
    var price: String
    var lat: Double
    var lng: Double
    var owner: OwnerEntity
}
