//
//  SearchInteractorOutputProtocol.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

enum SearchInteractorResult {
    case locationsFailure(String)
    case roomsFailure(String)
    case roomDetailFailure(String)
    case locationsSuccess([LocationEntity])
    case roomsSuccess([RoomEntity])
    case roomDetailSuccess(RoomDetailEntity)
}

protocol SearchInteractorOutputProtocol: class {
    
    func handle(_ result: SearchInteractorResult)
}
