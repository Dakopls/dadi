//
//  RoomsViewProtocol.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

enum RoomsState {
    case success(viewModels: [RoomViewModel])
    case error(error: String)
}

protocol RoomsViewProtocol: class {
    
    var presenter: RoomsPresenterProtocol? { get set }
    
    func populate(_ state: RoomsState)

}
