//
//  PlanetsDetailsView.swift
//  HealthFirstApp
//
//  Created by Donkemezuo Raymond Tariladou on 8/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class PlanetsDetailsView: UIView {
    
    public lazy var planetNameLabel: UILabel = {
        let planetNameLabel = UILabel()
        planetNameLabel.numberOfLines = 0
        planetNameLabel.textColor = .yellow
        planetNameLabel.font =  UIFont(name: "HelveticaNeue-Bold", size: 20)
        return planetNameLabel
    }()
    
    public lazy var rotationalPeriod: UILabel = {
        let rotationalPeriod = UILabel()
        rotationalPeriod.numberOfLines = 0
        rotationalPeriod.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        rotationalPeriod.textColor = .white
        return rotationalPeriod
    }()
    
    public lazy var orbitalPeriod: UILabel = {
        let orbitalPeriod = UILabel()
        orbitalPeriod.numberOfLines = 0
        orbitalPeriod.textColor = .white
        orbitalPeriod.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        return orbitalPeriod
    }()
    
    public lazy var gravityLabel: UILabel = {
        let gravityLabel = UILabel()
        gravityLabel.numberOfLines = 0
        gravityLabel.textColor = .white
        gravityLabel.font =  UIFont(name: "HelveticaNeue-Bold", size: 18)
        return gravityLabel
    }()
    
    public lazy var populationLabel: UILabel = {
        let populationLabel = UILabel()
        populationLabel.numberOfLines = 0
        populationLabel.textColor = .white
        populationLabel.font =  UIFont(name: "HelveticaNeue-Bold", size: 18)
        return populationLabel
    }()
    
    public lazy var surfaceWaterLabel: UILabel = {
        let surfaceWaterLabel = UILabel()
        surfaceWaterLabel.numberOfLines = 0
        surfaceWaterLabel.textColor = .white
        surfaceWaterLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        return surfaceWaterLabel
    }()
    
    public lazy var diameterLabel: UILabel = {
        let diameterLabel = UILabel()
        diameterLabel.numberOfLines = 0
        diameterLabel.textColor = .white
        diameterLabel.font =  UIFont(name: "HelveticaNeue-Bold", size: 18)
        return diameterLabel
    }()
    
    public lazy var terrainLabel: UILabel = {
        let terrainLabel = UILabel()
        terrainLabel.numberOfLines = 0
        terrainLabel.textColor = .white
        terrainLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        return terrainLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setConstrains()
    }
    
    private func setConstrains(){
        setPlanetNameLabelConstrains()
        setPopulationLabelConstrains()
        setGravityLabelConstrains()
        setRotationLabelConstrains()
        setOrbitalPeriodLabelConstrains()
        setSurfaceWaterLabelConstrains()
        setDiameterLabelConstrains()
        setTerrainLabelConstrains()
    }
    
    private func setPlanetNameLabelConstrains(){
        addSubview(planetNameLabel)
        planetNameLabel.translatesAutoresizingMaskIntoConstraints = false
        planetNameLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0.5).isActive = true
        planetNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        planetNameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        planetNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
    }
    
    private func setPopulationLabelConstrains(){
        addSubview(populationLabel)
        populationLabel.translatesAutoresizingMaskIntoConstraints = false
        populationLabel.topAnchor.constraint(equalToSystemSpacingBelow: planetNameLabel.bottomAnchor, multiplier: 0.5).isActive = true
        populationLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.5).isActive = true
        populationLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        populationLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
    }
    
    private func setGravityLabelConstrains(){
        addSubview(gravityLabel)
        gravityLabel.translatesAutoresizingMaskIntoConstraints = false
        gravityLabel.topAnchor.constraint(equalToSystemSpacingBelow: planetNameLabel.bottomAnchor, multiplier: 0.5).isActive = true
        gravityLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: populationLabel.trailingAnchor, multiplier: 1.8).isActive = true
        gravityLabel.widthAnchor.constraint(equalTo: populationLabel.widthAnchor).isActive = true
        gravityLabel.heightAnchor.constraint(equalTo: populationLabel.heightAnchor).isActive = true
    }
    
    private func setRotationLabelConstrains(){
        addSubview(rotationalPeriod)
        rotationalPeriod.translatesAutoresizingMaskIntoConstraints = false
        rotationalPeriod.topAnchor.constraint(equalToSystemSpacingBelow: gravityLabel.bottomAnchor, multiplier: 0.5).isActive = true
        rotationalPeriod.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.5).isActive = true
        rotationalPeriod.widthAnchor.constraint(equalTo: gravityLabel.widthAnchor).isActive = true
        rotationalPeriod.heightAnchor.constraint(equalTo: gravityLabel.heightAnchor).isActive = true
    }
    
    private func setOrbitalPeriodLabelConstrains(){
        addSubview(orbitalPeriod)
        orbitalPeriod.translatesAutoresizingMaskIntoConstraints = false
        orbitalPeriod.topAnchor.constraint(equalToSystemSpacingBelow: gravityLabel.bottomAnchor, multiplier: 0.5).isActive = true
        orbitalPeriod.leadingAnchor.constraint(equalToSystemSpacingAfter: rotationalPeriod.trailingAnchor, multiplier: 1.8).isActive = true
        orbitalPeriod.widthAnchor.constraint(equalTo: rotationalPeriod.widthAnchor).isActive = true
        orbitalPeriod.heightAnchor.constraint(equalTo: rotationalPeriod.heightAnchor).isActive = true
    }
    
    private func setSurfaceWaterLabelConstrains(){
        addSubview(surfaceWaterLabel)
        surfaceWaterLabel.translatesAutoresizingMaskIntoConstraints = false
        surfaceWaterLabel.topAnchor.constraint(equalToSystemSpacingBelow: orbitalPeriod.bottomAnchor, multiplier: 0.5).isActive = true
        surfaceWaterLabel.leadingAnchor.constraint(equalTo: rotationalPeriod.leadingAnchor).isActive = true
        surfaceWaterLabel.widthAnchor.constraint(equalTo: rotationalPeriod.widthAnchor).isActive = true
        surfaceWaterLabel.heightAnchor.constraint(equalTo:rotationalPeriod.heightAnchor).isActive = true
    }
    
    private func setDiameterLabelConstrains(){
        addSubview(diameterLabel)
        diameterLabel.translatesAutoresizingMaskIntoConstraints = false
        diameterLabel.topAnchor.constraint(equalToSystemSpacingBelow: orbitalPeriod.bottomAnchor, multiplier: 0.5).isActive = true
        diameterLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: surfaceWaterLabel.trailingAnchor, multiplier: 1.8).isActive = true
        diameterLabel.widthAnchor.constraint(equalTo: surfaceWaterLabel.widthAnchor).isActive = true
        diameterLabel.heightAnchor.constraint(equalTo: rotationalPeriod.heightAnchor).isActive = true
    }
    
    private func setTerrainLabelConstrains(){
        addSubview(terrainLabel)
        terrainLabel.translatesAutoresizingMaskIntoConstraints = false
        terrainLabel.topAnchor.constraint(equalToSystemSpacingBelow: diameterLabel.bottomAnchor, multiplier: 0.5).isActive = true
        terrainLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        terrainLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomAnchor, multiplier: 0.2).isActive = true
        terrainLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
    }
    
    public func displayPlanetInfo(withPlanetData planetData: PlanetDataWrapper){
        diameterLabel.text = "Diameter: \(planetData.diameter)"
        orbitalPeriod.text = "Orbital Period: \(planetData.orbitalPeriod ?? "not specified")"
      gravityLabel.text = "Gravity: \(planetData.gravity)"
       planetNameLabel.text = "Planet Name: \(planetData.name)"
       populationLabel.text = "Population: \(planetData.population)"
        surfaceWaterLabel.text = "Surface Water: \(planetData.surfaceWater ?? "not specified")"
      terrainLabel.text = "Terrain: \(planetData.terrain)"
        rotationalPeriod.text = "Rotational Period: \(planetData.rotationPeriod ?? "not specified")"
    }

}
