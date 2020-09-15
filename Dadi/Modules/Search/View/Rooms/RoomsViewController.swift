//
//  RoomsViewController.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 25/01/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import UIKit
import Kingfisher

class RoomsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RoomsViewProtocol {

    // MARK: - Properties
    var presenter: SearchPresenterProtocol?
    private var rooms = [RoomEntity]()
    private var location: String
    
    @IBOutlet weak var searchBar: UIView!
    @IBOutlet weak var locationSearched: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    init(location: String) {
        self.location = location
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSettings()
        buttonSettings()
        self.presenter?.perform(action: .fetchRooms)
    }
    
    // MARK: - Setups
    func buttonSettings() {
        self.locationSearched.text = self.location
        self.searchBar.backgroundColor = UIColor.init(red:239/255, green:239/255, blue: 241/255, alpha: 1)
        self.searchBar.layer.cornerRadius = 8.0
        self.searchBar.tintColor = .black
    }
    
    func tableSettings() {
        self.tableView.register(UINib(nibName: "RoomTableViewCell", bundle: nil), forCellReuseIdentifier: "RoomTableViewCell")
        self.tableView.allowsSelection = true
        self.tableView.rowHeight = 272
        self.tableView.separatorStyle = .none
    }

    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int
    {
        var sections = 0
        if self.rooms.count > 0 {
            sections = 1
            self.tableView.backgroundView = nil
        }
        else {
            let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLabel.text = "No rooms available in this location"
            noDataLabel.textColor = UIColor.lightGray
            noDataLabel.textAlignment = .center
            self.tableView.backgroundView = noDataLabel
        }
        return sections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTableViewCell", for: indexPath) as! RoomTableViewCell
        
        let room = self.rooms[indexPath.row]
//        cell.photo?.kf.setImage(with: URL(string: room.photos[0].url_small!))
        cell.name?.text = room.title
        cell.price?.text = room.price
        cell.owner?.text = room.owner.display
        cell.contentView.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        let room = self.rooms[indexPath.row]
        cellDidSelect(cell, with: room)
    }
    
    func cellDidSelect(_ cell: UITableViewCell, with content: RoomEntity) {
        self.presenter?.perform(action: .selectRoom(room: content))
    }
    
    // MARK: - RoomsViewProtocol
    func populate(_ state: RoomsState) {
        switch state {
        case .success(let entity):
            self.rooms = entity
            self.tableView.reloadData()
        case .error(let error):
            print(error) //TBD
        }
    }
}
