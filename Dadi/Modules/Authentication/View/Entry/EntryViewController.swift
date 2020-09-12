//
//  EntryViewController.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 12/09/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
    
    var presenter: AuthenticationPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginPressed() {
        presenter?.perform(action: .loginSelected)
    }
    
    @IBAction func registerPressed() {
        presenter?.perform(action: .registerSelected)
    }
}
