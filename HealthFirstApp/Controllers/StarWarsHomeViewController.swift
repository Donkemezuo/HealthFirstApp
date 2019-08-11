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
    }
    

}

extension StarWarsHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch starWarsHomeView.viewSegmentedControl.selectedSegmentIndex {
        case 0:
            guard let peopleTVCell = tableView.dequeueReusableCell(withIdentifier: "PeopleTableViewCell", for: indexPath) as? PeopleTableViewCell else { return UITableViewCell()}
            
            peopleTVCell.textLabel?.text = "Raymond"
            
            return peopleTVCell
        case 1:
            print(starWarsHomeView.viewSegmentedControl.selectedSegmentIndex)
            guard let placesTVCell = tableView.dequeueReusableCell(withIdentifier: "PlacesTableViewCell", for: indexPath) as? PlacesTableViewCell else {return UITableViewCell()}
            
            placesTVCell.textLabel?.text = "Yenagoa"
            
            return placesTVCell
        default:
            return UITableViewCell()
        }
    }
    
    
}
