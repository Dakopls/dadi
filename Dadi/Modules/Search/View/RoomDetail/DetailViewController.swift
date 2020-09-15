//
//  DetailViewController.swift
//  Badi
//
//  Created by user on 28/01/2020.
//  Copyright © 2020 BadiGeeks. All rights reserved.
//

import UIKit
import MapKit
import Kingfisher
import TinyConstraints

class DetailViewController: UIViewController, RoomDetailViewProtocol {
    
    // MARK: - Properties
    var presenter: SearchPresenterProtocol?
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 400)
    lazy var labelWidth = self.view.frame.width - 40.0
    
    // MARK: - Views
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .white
        view.frame = self.view.bounds
        view.contentSize = contentViewSize
        return view
    }()

    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = contentViewSize
        return view
    }()
    
    lazy var photo: UIImageView = {
        let photo = UIImageView()
        photo.backgroundColor = .systemIndigo
        return photo
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "verdana", size: 24)
        label.textAlignment = NSTextAlignment.left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    lazy var price: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "verdana", size: 21)
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    lazy var desc: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "verdana", size: 17)
        label.textAlignment = NSTextAlignment.left
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    lazy var owner: UILabel = {
        let label = UILabel()
        label.text = "Owner"
        label.font = UIFont(name: "verdana", size: 21)
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    lazy var bio: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "verdana", size: 17)
        label.textAlignment = NSTextAlignment.left
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    lazy var location: UILabel = {
        let label = UILabel()
        label.text = "Location"
        label.font = UIFont(name: "verdana", size: 21)
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    lazy var map: MKMapView = {
        let map = MKMapView()
        map.mapType = MKMapType.standard
        return map
    }()

    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        self.presenter?.perform(action: .fetchRoomDetail)
    }
    
    fileprivate func viewSettings() {
        addViews()
        addConstraints()
    }
    
    fileprivate func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(photo)
        containerView.addSubview(name)
        containerView.addSubview(price)
        containerView.addSubview(desc)
        containerView.addSubview(owner)
        containerView.addSubview(bio)
        containerView.addSubview(location)
        containerView.addSubview(map)
    }
    
    fileprivate func addConstraints() {
        photo.edgesToSuperview(excluding: .bottom)
        photo.height(314.0)
        name.topToBottom(of: photo, offset: 18.0)
        name.left(to: containerView, offset: 20.0)
        name.right(to: containerView, offset: -20.0)
        price.topToBottom(of: name, offset: 10.0)
        price.left(to: containerView, offset: 20.0)
        price.right(to: containerView, offset: -20.0)
        desc.topToBottom(of: price, offset: 10.0)
        desc.left(to: containerView, offset: 20.0)
        desc.right(to: containerView, offset: -20.0)
        owner.topToBottom(of: desc, offset: 20)
        owner.left(to: containerView, offset: 20.0)
        owner.right(to: containerView, offset: -20.0)
        bio.topToBottom(of: owner, offset: 10)
        bio.left(to: containerView, offset: 20.0)
        bio.right(to: containerView, offset: -20.0)
        location.topToBottom(of: bio, offset: 20)
        location.left(to: containerView, offset: 20.0)
        location.right(to: containerView, offset: -20.0)
        map.topToBottom(of: location, offset: 18)
        map.height(314.0)
        map.left(to: containerView, offset: 0.0)
        map.right(to: containerView, offset: 0.0)
    }
    
    //MARK: - RoomDetailViewProtocol
    func populate(_ state: RoomDetailState) {
        switch state {
        case .success(let entity):
            populateView(entity)
        case .error(let error):
            print(error) //TBD
        }
    }
    
    private func populateView(_ entity: RoomDetailEntity) {
//        self.photo.kf.setImage(with: URL(string: room_detail.photos[0].url_big!))
        self.name.text = entity.title
        self.price.text = entity.price
        self.desc.text = entity.description
        self.bio.text = entity.owner.display
        self.map.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: entity.lat, longitude:entity.lng), span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)), animated: false)
    }
}
