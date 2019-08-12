//
//  PlacesDetailViewController.swift
//  HealthFirstApp
//
//  Created by Donkemezuo Raymond Tariladou on 8/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class PlanetsDetailViewController: UIViewController {
    private var planet: PlanetDataWrapper!
    private var planetDetailsView = PlanetsDetailsView()
    private var screenTap: UITapGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurePopUpViewConstrains()
        configureDismissView()
        displayPlanetInfo()

    }
    
    
    init(planet: PlanetDataWrapper){
        super.init(nibName: nil, bundle: nil)
        self.planet = planet
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func configureDismissView(){
        screenTap = UITapGestureRecognizer(target: self, action: #selector(screenTapped))
        view.addGestureRecognizer(screenTap)
    }
    
    @objc private func screenTapped(){
        self.dismiss(animated: true)
    }
    
    private func configurePopUpViewConstrains(){
        view.addSubview(planetDetailsView)
        planetDetailsView.translatesAutoresizingMaskIntoConstraints = false
        planetDetailsView.backgroundColor = UIColor(hexString: "083D77")
        planetDetailsView.layer.cornerRadius = 10
        planetDetailsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        planetDetailsView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        planetDetailsView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        planetDetailsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }

    private func displayPlanetInfo(){
        planetDetailsView.diameterLabel.text = "Diameter: \(planet.diameter)"
        planetDetailsView.orbitalPeriod.text = "Orbital Period: \(String(describing: planet.orbital_period))"
        planetDetailsView.gravityLabel.text = "Gravity: \(planet.gravity)"
        planetDetailsView.planetNameLabel.text = "Planet Name: \(planet.name)"
        planetDetailsView.populationLabel.text = "Population: \(planet.population)"
        planetDetailsView.surfaceWaterLabel.text = "Surface Water: \(String(describing: planet.surface_water))"
        planetDetailsView.terrainLabel.text = "Terrain: \(planet.terrain)"
        planetDetailsView.rotationalPeriod.text = "Rotational Period: \(String(describing: planet.rotation_period))"
    }
}
