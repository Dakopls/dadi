//
//  RoomEntity.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 14/09/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

struct RoomEntity: Codable {
    var id: Int
    var title: String
    var price: String
    var city: String
    var pictures: [PictureEntity]
    var owner: OwnerEntity
}
