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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(starWarsHomeView)
        view.backgroundColor = .red
      self.title = "Starwars"
        starWarsHomeView.starWarsTableView.dataSource = self
        starWarsHomeView.starWarsTableView.delegate = self
        configureSegmentedConstrol()
        
    }
    
    private func configureSegmentedConstrol(){
        starWarsHomeView.viewSegmentedControl.addTarget(self, action: #selector(segmentedControlPressed), for: .valueChanged)
        
    }
    
    @objc private func segmentedControlPressed()  {
        starWarsHomeView.starWarsTableView.reloadData()
}
    
    
}
extension StarWarsHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if starWarsHomeView.viewSegmentedControl.selectedSegmentIndex == 0 {
            guard let peopleTVCell =  starWarsHomeView.starWarsTableView.dequeueReusableCell(withIdentifier: "PeopleTableViewCell", for: indexPath) as? PeopleTableViewCell else { fatalError("PeopleTableViewCell is nil") }
            
            peopleTVCell.textLabel?.text = "Raymond"
            
            return peopleTVCell
        } else {
            guard let placesTVCell = starWarsHomeView.starWarsTableView.dequeueReusableCell(withIdentifier: "PlacesTableViewCell", for: indexPath) as? PlacesTableViewCell else { fatalError("PlacesTableViewCell is nil") }
            
            placesTVCell.textLabel?.text = "Yenagoa"
            
            return placesTVCell
        }
    }
}

