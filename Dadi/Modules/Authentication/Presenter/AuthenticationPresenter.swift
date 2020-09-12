//
//  AuthenticationPresenter.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 12/09/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import UIKit

class AuthenticationPresenter: AuthenticationPresenterProtocol {
    
    var entry: EntryViewController?
    var login: LoginViewController?
    var register: RegisterViewController?
    var wireframe: AuthenticationWireframeProtocol?
    
    func perform(action: AuthenticationAction) {
        switch action {
        case .loginSelected:
            wireframe?.navigate(to: .login)
        case .registerSelected:
            wireframe?.navigate(to: .register)
        case .submitLogin: break //TBD
        case .submitRegister: break //TBD
        }
    }
}
