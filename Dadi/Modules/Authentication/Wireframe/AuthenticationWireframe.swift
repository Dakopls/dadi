//
//  AuthenticationWireframe.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 12/09/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import UIKit

class AuthenticationWireframe: AuthenticationWireframeProtocol {    
    
    var entry: UIViewController!
    var login: UIViewController?
    var register: UIViewController?
    var presenter: AuthenticationPresenterProtocol?
    
    init() {
        self.presenter = AuthenticationPresenter()
        let entry = EntryViewController()
        entry.presenter = self.presenter
        self.presenter?.entry = entry
        self.presenter?.wireframe = self
        self.entry = entry
        //TODO add interactor and API data manager
    }
    
    func navigate(to page: AuthenticationPage) {
        switch page {
        case .login: pushLoginFromEntry()
        case .register: pushRegisterFromEntry()
        case .back: returnToEntry()
        }
    }
    
    private func pushLoginFromEntry() {
        if self.login == nil {
            let login = LoginViewController()
            login.presenter = self.presenter
            presenter?.login = login
            self.login = login as UIViewController
        }
        entry.show(self.login!, sender: self.entry)
    }
    
    private func pushRegisterFromEntry() {
        if self.register == nil {
            let register = RegisterViewController()
            register.presenter = self.presenter
            presenter?.register = register
            self.register = register as UIViewController
        }
        entry.show(self.register!, sender: self.entry)
    }
    
    private func returnToEntry() {
        entry.dismiss(animated: true, completion: nil)
    }
}
