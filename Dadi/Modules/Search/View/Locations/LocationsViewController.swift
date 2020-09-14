//
//  LocationsViewController.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 14/09/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import UIKit

class LocationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, LocationsViewProtocol {

    // MARK: - Properties
    var presenter: SearchPresenterProtocol?
    private var locations = [LocationEntity]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
        headerSettings()
        tableSettings()
    }
    
    // MARK: - Setups
    func headerSettings() {
        self.searchBar.searchBarStyle = .minimal
        self.searchBar.placeholder = "Enter a location..."
    }
    
    func tableSettings() {
        self.tableView.register(UINib(nibName: "LocationTableViewCell", bundle: nil), forCellReuseIdentifier: "LocationTableViewCell")
        self.tableView.allowsSelection = true
        self.tableView.rowHeight = 68
        self.tableView.separatorStyle = .none
    }

    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int
    {
        var sections = 0
        if self.locations.count > 0 {
            sections = 1
            self.tableView.backgroundView = nil
        }
        else {
            let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLabel.text = "No recent searches"
            noDataLabel.textColor = UIColor.lightGray
            noDataLabel.textAlignment = .center
            self.tableView.backgroundView = noDataLabel
        }
        return sections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell", for: indexPath) as! LocationTableViewCell
        
        let location = self.locations[indexPath.row]
        cell.name?.text = location.title
        cell.kind?.text = location.subtitle
        cell.contentView.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        let location = self.locations[indexPath.row]
        cellDidSelect(cell, with: location)
    }
    
    func cellDidSelect(_ cell: UITableViewCell, with content: LocationEntity) {
        self.presenter?.perform(action: .selectLocation(location: content))
    }
    
    // MARK: - LocationsViewProtocol
    func populate(_ state: LocationsState) {
        switch state {
        case .success(let entity):
            self.locations = entity
            self.tableView.reloadData()
        case .error(let error):
            print(error) //TBD
        }
    }
}

// MARK: - Delegate
extension LocationsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count < 3 { return }
        self.presenter?.perform(action: .fetchLocation(text: searchText))
    }
}
