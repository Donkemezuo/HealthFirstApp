//
//  StarWarsHomeViewController.swift
//  HealthFirstApp
//
//  Created by Donkemezuo Raymond Tariladou on 8/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit


class StarWarsHomeViewController: UIViewController {
    
    private var starWarsHomeView = StarWarsHomeView()
    private var starWarsAPIClient = StarWarsAPIClient()
   
    
    private var planets = [PlanetDataWrapper](){
        didSet {
            DispatchQueue.main.async {
                self.starWarsHomeView.starWarsTableView.reloadData()
            }
        }
    }

    private var people = [PeopleDataWrapper](){
        didSet {
            DispatchQueue.main.async {
                self.starWarsHomeView.starWarsTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(starWarsHomeView)
        view.backgroundColor = UIColor(hexString: "083D77")
      self.title = "Starwars"
        starWarsHomeView.starWarsTableView.dataSource = self
        starWarsHomeView.starWarsTableView.delegate = self
        configureSegmentedConstrol()
        getFirstPeopleDataSet()
        getPlacesData()
    }
    
    
    private func configureSegmentedConstrol(){
        starWarsHomeView.viewSegmentedControl.addTarget(self, action: #selector(segmentedControlPressed), for: .valueChanged)
    }
    
    @objc private func segmentedControlPressed()  {
        starWarsHomeView.starWarsTableView.reloadData()
}
    
    private func getFirstPeopleDataSet(){
        starWarsAPIClient.getPeopleData {[weak self](queryResult) in
            switch queryResult {
            case .failure(let error):
                self?.showAlert(title: "Error", message: "\(error.localizedDescription) encountered while fetching people data")
            case .success(let peopleData):
                self?.people = peopleData
            }
        }
    }
    
    private func fetchNextSetOfPeopleData(){
        starWarsAPIClient.makeNextQueryForPeopleData {[weak self](queryResult) in
            switch queryResult {
            case .failure(let error):
                self?.showAlert(title: "Error", message: "Error \(error.localizedDescription) encountered while fetching more people data")
            case .success(let morePeopleData):
                if let previousPeopleData = self?.people {
            self?.people = previousPeopleData + morePeopleData
            
                }
            }
        }
    }
    
    private func getPlacesData(){
        starWarsAPIClient.getPlanetsData { [weak self] (queryResult) in
            switch queryResult {
            case .failure(let error):
                self?.showAlert(title: "Error", message: "\(error.localizedDescription) encountered while fetching planet data")
            case .success(let placesData):
                self?.planets = placesData
            }
        }
    }
    
    private func fetchNextSetOfPlanetData(){
        starWarsAPIClient.makeNextPlanetDataQuery { [weak self ](queryResult) in
            switch queryResult {
            case .failure(let error):
                 self?.showAlert(title: "Error", message: "Error \(error.localizedDescription) encountered while fetching more planet data")
            case .success(let morePlanetData):
                if let previousPlanetData = self?.planets {
                    self?.planets = previousPlanetData + morePlanetData
                }
            }
        }
    }
    
    
    private func segueToDetailsView(selectedIndex: Int, indexPath: IndexPath){
        switch selectedIndex {
        case 0:
            let person = people[indexPath.row]
            let personDetailVC = PeopleDetailsViewController(person: person)
            personDetailVC.modalTransitionStyle = .coverVertical
            personDetailVC.modalPresentationStyle = .overCurrentContext
            self.present(personDetailVC, animated: true, completion: nil)
            
        case 1:
            let planet = planets[indexPath.row]
            let planetDetailVC = PlanetsDetailViewController(planet: planet)
            planetDetailVC.modalTransitionStyle = .coverVertical
            planetDetailVC.modalPresentationStyle = .overCurrentContext
            self.present(planetDetailVC, animated: true, completion: nil)
            
        default:
            break
        }
    }
    
    
}
extension StarWarsHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch starWarsHomeView.viewSegmentedControl.selectedSegmentIndex {
        case 0:
            return people.count
        case 1:
            return planets.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if starWarsHomeView.viewSegmentedControl.selectedSegmentIndex == 0 {
            let person = people[indexPath.row]
            guard let peopleTVCell =  starWarsHomeView.starWarsTableView.dequeueReusableCell(withIdentifier: "PeopleTableViewCell", for: indexPath) as? PeopleTableViewCell else { fatalError("PeopleTableViewCell is nil") }
            peopleTVCell.nameLabel.text = person.name
            peopleTVCell.genderLabel.text = "Gender: \(person.gender)"
            peopleTVCell.heightLabel.text = "Height: \(person.height)"
            if person.created != nil {
                peopleTVCell.createdDateLabel.text = "Created Since \(String(describing: person.created))"
            } else {
                peopleTVCell.createdDateLabel.text = "Created date not specified"
            }
            
            peopleTVCell.backgroundColor = .clear
            peopleTVCell.selectionStyle = .none
            
            return peopleTVCell
        } else {
            let place = planets[indexPath.row]
            guard let placesTVCell = starWarsHomeView.starWarsTableView.dequeueReusableCell(withIdentifier: "PlacesTableViewCell", for: indexPath) as? PlacesTableViewCell else { fatalError("PlacesTableViewCell is nil") }
            
            placesTVCell.planetNameLabel.text = "Name: \(place.name)"
            placesTVCell.planetClimate.text = "Climate: \(place.climate)"
            placesTVCell.planetPopulation.text = "Population: \(place.population)"
            placesTVCell.createdDateLabel.text = "Created Since \(String(describing: place.created))"
            placesTVCell.backgroundColor = .clear
            placesTVCell.selectionStyle = .none
            
            return placesTVCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let height = starWarsHomeView.viewSegmentedControl.selectedSegmentIndex == 0 ? CGFloat(100) : CGFloat(150)
     return height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        segueToDetailsView(selectedIndex: starWarsHomeView.viewSegmentedControl.selectedSegmentIndex, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
        if starWarsHomeView.viewSegmentedControl.selectedSegmentIndex == 0 {
            
            if indexPath.row == people.count - 2 {
                self.fetchNextSetOfPeopleData()
            }
        } else {
            if indexPath.row == planets.count - 2 {
                self.fetchNextSetOfPlanetData()
            }
        }
}
}

