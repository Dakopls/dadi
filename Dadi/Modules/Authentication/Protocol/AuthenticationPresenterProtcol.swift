//
//  AuthenticationPresenterProtcol.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 12/09/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import UIKit

enum AuthenticationAction {
    case loginSelected
    case registerSelected
    case submitLogin
    case submitRegister
}

protocol AuthenticationPresenterProtocol: class {
    var entry: EntryViewController? { get set }
    var login: LoginViewController? { get set }
    var register: RegisterViewController? { get set }
    var wireframe: AuthenticationWireframeProtocol? { get set }
    
    func perform(action: AuthenticationAction)
}
