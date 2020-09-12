//
//  RegisterViewController.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 12/09/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var presenter: AuthenticationPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func donePressed() {
        presenter?.perform(action: .submitRegister)
        //TODO: send email and pass to presenter
    }
}
