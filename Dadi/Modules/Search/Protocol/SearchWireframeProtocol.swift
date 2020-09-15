//
//  SearchWireframeProtocol.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import UIKit

enum SearchPage {
    case locations
    case rooms(location: String)
    case roomDetail
    case booking
}

protocol SearchWireframeProtocol: class {
    
    var home: UIViewController! { get set }
    var locations: UIViewController? { get set }
    var rooms: UIViewController? { get set }
    var detail: UIViewController? { get set }
    var booking: UIViewController? { get set }
    
    var presenter: SearchPresenter? { get set }
    
    func navigate(to page: SearchPage)
}
