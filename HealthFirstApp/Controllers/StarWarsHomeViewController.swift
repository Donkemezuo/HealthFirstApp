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
    
    private func makeInfiniteDataCall(selectedIndex: Int, indexpath: IndexPath){
        switch selectedIndex {
        case 0:
            if indexpath.row == people.count - 2 {
                self.fetchNextSetOfPeopleData()
            }
        case 1:
            if indexpath.row == planets.count - 2 {
                self.fetchNextSetOfPlanetData()
            }
        default:
            break
        }
    }
    
    
}
extension StarWarsHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starWarsHomeView.viewSegmentedControl.selectedSegmentIndex == 0 ? people.count : planets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if starWarsHomeView.viewSegmentedControl.selectedSegmentIndex == 0 {
            let person = people[indexPath.row]
            guard let peopleTVCell =  starWarsHomeView.starWarsTableView.dequeueReusableCell(withIdentifier: "PeopleTableViewCell", for: indexPath) as? PeopleTableViewCell else { fatalError("PeopleTableViewCell is nil") }
            peopleTVCell.displayCellInfo(withPeopleData: person)
            return peopleTVCell
        } else {
            let place = planets[indexPath.row]
            guard let placesTVCell = starWarsHomeView.starWarsTableView.dequeueReusableCell(withIdentifier: "PlacesTableViewCell", for: indexPath) as? PlacesTableViewCell else { fatalError("PlacesTableViewCell is nil") }
            placesTVCell.displayCellInfo(withPlanetData: place)
            return placesTVCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return starWarsHomeView.viewSegmentedControl.selectedSegmentIndex == 0 ? CGFloat(100) : CGFloat(150)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    segueToDetailsView(selectedIndex: starWarsHomeView.viewSegmentedControl.selectedSegmentIndex, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    makeInfiniteDataCall(selectedIndex: starWarsHomeView.viewSegmentedControl.selectedSegmentIndex, indexpath: indexPath)
}
}


