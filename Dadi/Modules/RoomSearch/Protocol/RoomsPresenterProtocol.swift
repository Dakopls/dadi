//
//  RoomsPresenterProtocol.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

enum RoomsViewAction {
    case load
    case scrollsToItem(_ index: Int)
    case goToRoom(_ index: Int)
    case exitRooms
}

protocol RoomsPresenterProtocol: class {
    
    var view: RoomsViewProtocol? { get set }
    var interactor: RoomsInteractorInputProtocol? { get set }
    var wireframe: RoomsWireframeProtocol? { get set }
    
    func perform(_ action: RoomsViewAction)
}
