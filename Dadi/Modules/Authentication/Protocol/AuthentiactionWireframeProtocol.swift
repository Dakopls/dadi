//
//  AuthentiactionWireframeProtocol.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 12/09/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import UIKit

enum AuthenticationPage {
    case login
    case register
    case finish
    case onboarding
}

protocol AuthenticationWireframeProtocol: class {
    
    var entry: UIViewController! { get set }
    var login: UIViewController? { get set }
    var register: UIViewController? { get set }
    
    var presenter: AuthenticationPresenterProtocol? { get set }
    
    func navigate(to page: AuthenticationPage)
}
