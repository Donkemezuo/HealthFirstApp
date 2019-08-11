//
//  StarWarsHomeView.swift
//  HealthFirstApp
//
//  Created by Donkemezuo Raymond Tariladou on 8/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class StarWarsHomeView: UIView {
    
    public lazy var viewSegmentedControl: UISegmentedControl = {
        let viewSegmentedControl = UISegmentedControl()
        viewSegmentedControl.insertSegment(withTitle: "People", at: 0, animated: true)
        viewSegmentedControl.insertSegment(withTitle: "Places", at: 1, animated: true)
        viewSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 16) ?? 0, NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        viewSegmentedControl.tintColor = .white 
        viewSegmentedControl.selectedSegmentIndex = 0
        return viewSegmentedControl
    }()
    
    public lazy var starWarsTableView: UITableView = {
        let starWarsTableView = UITableView()
        starWarsTableView.backgroundColor = .clear
        starWarsTableView.register(PeopleTableViewCell.self, forCellReuseIdentifier: "PeopleTableViewCell")
        starWarsTableView.register(PlacesTableViewCell.self, forCellReuseIdentifier: "PlacesTableViewCell")
        return starWarsTableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        setViewConstrains()
    }
    
    private func setViewConstrains(){
        setViewSegmentedControlConstrains()
        setStarWarsTVConstrains()
    }
    
    private func setViewSegmentedControlConstrains(){
        addSubview(viewSegmentedControl)
        viewSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        viewSegmentedControl.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 0.4).isActive = true
        viewSegmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        viewSegmentedControl.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        viewSegmentedControl.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.03).isActive = true
    }
    
    private func setStarWarsTVConstrains(){
        addSubview(starWarsTableView)
        starWarsTableView.translatesAutoresizingMaskIntoConstraints = false
        starWarsTableView.topAnchor.constraint(equalToSystemSpacingBelow: viewSegmentedControl.bottomAnchor, multiplier: 0.4).isActive = true
        starWarsTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        starWarsTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        starWarsTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
