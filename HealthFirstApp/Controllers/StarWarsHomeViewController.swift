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
   
    
    private var places = [PlacesDataWrapper]() {
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
        getPeopleData()
        getPlacesData()
        
    }
    
    private func configureSegmentedConstrol(){
        starWarsHomeView.viewSegmentedControl.addTarget(self, action: #selector(segmentedControlPressed), for: .valueChanged)
        
    }
    
    @objc private func segmentedControlPressed()  {
        starWarsHomeView.starWarsTableView.reloadData()
}
    
    private func getPeopleData(){
        StarWarsAPIClient.getPeopleData { (queryResult) in
            switch queryResult {
            case .failure(let error):
                print("Error \(error) encountered while fetching data")
            case .success(let peopleData):
                self.people = peopleData
            }
            
        }
    }
    
    private func getPlacesData(){
        StarWarsAPIClient.getPlacesData { (queryResult) in
            switch queryResult {
            case .failure(let error):
                print("Error: \(error) encountered while fetching data")
            case .success(let placesData):
                self.places = placesData
            }
        }
    }
    
    
    
    
}
extension StarWarsHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch starWarsHomeView.viewSegmentedControl.selectedSegmentIndex {
        case 0:
            return people.count
        case 1:
            return places.count
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
            
            return peopleTVCell
        } else {
            let place = places[indexPath.row]
            guard let placesTVCell = starWarsHomeView.starWarsTableView.dequeueReusableCell(withIdentifier: "PlacesTableViewCell", for: indexPath) as? PlacesTableViewCell else { fatalError("PlacesTableViewCell is nil") }
            
            placesTVCell.planetNameLabel.text = "Name: \(place.name)"
            placesTVCell.planetClimate.text = "Climate: \(place.climate)"
            placesTVCell.planetPopulation.text = "Population: \(place.population)"
            placesTVCell.createdDateLabel.text = "Created Since \(String(describing: place.created))"
            placesTVCell.backgroundColor = .clear
            
            
            return placesTVCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if starWarsHomeView.viewSegmentedControl.selectedSegmentIndex == 0{
            return 100
        } else {
        return 150
        }
 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = people[indexPath.row]
        self.present(PeopleDetailsViewController(person: person), animated: true, completion: nil)
    }
}

