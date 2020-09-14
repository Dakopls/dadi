//
//  SeekerHomeViewController.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 20/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import UIKit

class SeekerHomeViewController: UIViewController, SeekerHomeViewProtocol {
    
    var presenter: SearchPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func searchPressed() {
        presenter?.perform(action: .searchPressed)
    }
    
    @IBAction func listingPressed() {
        presenter?.perform(action: .listingPressed)
    }
}
