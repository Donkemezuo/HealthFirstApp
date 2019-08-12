//
//  PlacesTableViewCell.swift
//  HealthFirstApp
//
//  Created by Donkemezuo Raymond Tariladou on 8/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {
    public lazy var planetNameLabel: UILabel = {
        let planetNameLabel = UILabel()
        planetNameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        planetNameLabel.textColor = .white
        return planetNameLabel
    }()
    public lazy var planetPopulation: UILabel = {
        let planetPopulation = UILabel()
        planetPopulation.font = UIFont(name: "HelveticaNeue-BoldItalic", size: 16)
        planetPopulation.textColor = .white
        return planetPopulation
    }()
    public lazy var planetClimate: UILabel = {
        let planetClimate = UILabel()
        planetClimate.font = UIFont(name: "HelveticaNeue-BoldItalic", size: 16)
        planetClimate.textColor = .white
        return planetClimate
    }()
    public lazy var createdDateLabel: UILabel = {
        let createdDateLabel = UILabel()
        createdDateLabel.font = UIFont(name: "HelveticaNeue-Italic", size: 16)
        createdDateLabel.textColor = .white
        return createdDateLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit(){
        setViewConstrains()
    }
    private func setViewConstrains(){
        setPlanetNameConstrains()
        setPopulationConstrains()
        setClimateLabelConstrains()
        setCreatedDateLabelConstrains()
    }
    private func setPlanetNameConstrains(){
        addSubview(planetNameLabel)
        planetNameLabel.translatesAutoresizingMaskIntoConstraints = false
        planetNameLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0.8).isActive = true
        planetNameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.5).isActive = true
        planetNameLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 2).isActive = true
        planetNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        
    }
    private func setPopulationConstrains(){
        addSubview(planetPopulation)
        planetPopulation.translatesAutoresizingMaskIntoConstraints = false
        planetPopulation.topAnchor.constraint(equalToSystemSpacingBelow: planetNameLabel.bottomAnchor, multiplier: 0.8).isActive = true
        planetPopulation.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.5).isActive = true
        planetPopulation.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 2).isActive = true
        planetPopulation.heightAnchor.constraint(equalTo: planetNameLabel.heightAnchor).isActive = true
        
    }
    private func setClimateLabelConstrains(){
        addSubview(planetClimate)
   planetClimate.translatesAutoresizingMaskIntoConstraints = false
        planetClimate.topAnchor.constraint(equalToSystemSpacingBelow: planetPopulation.bottomAnchor, multiplier: 0.5).isActive = true
        planetClimate.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.5).isActive = true
        planetClimate.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 0.5).isActive = true
        planetClimate.heightAnchor.constraint(equalTo: planetPopulation.heightAnchor).isActive = true
    }
    private func setCreatedDateLabelConstrains(){
        addSubview(createdDateLabel)
        createdDateLabel.translatesAutoresizingMaskIntoConstraints = false
        createdDateLabel.topAnchor.constraint(equalToSystemSpacingBelow: planetClimate.bottomAnchor, multiplier: 0.5).isActive = true
        createdDateLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.5).isActive = true
        createdDateLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 0.5).isActive = true
        createdDateLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: 0.1).isActive = true
    }
    public func displayCellInfo(withPlanetData planetData: PlanetDataWrapper){
        planetNameLabel.text = "Name: \(planetData.name)"
        planetClimate.text = "Climate: \(planetData.climate)"
       planetPopulation.text = "Population: \(planetData.population)"
       createdDateLabel.text = "Created Since \(String.convertedDate(fromDate: planetData.createdDate!))"
    }
}
