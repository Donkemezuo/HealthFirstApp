//
//  PeopleDetailsViewController.swift
//  HealthFirstApp
//
//  Created by Donkemezuo Raymond Tariladou on 8/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class PeopleDetailsViewController: UIViewController {
    
    private var peopleDetailView = PeopleDetailsView()
    private var person: PeopleDataWrapper!
    private var screenTap: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = UIColor.white
        configurePopUpViewConstrains()
        configureDismissView()
        displayPersonInformations()
    }
    
    init(person: PeopleDataWrapper){
        super.init(nibName: nil, bundle: nil)
        self.person = person
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configurePopUpViewConstrains(){
         view.addSubview(peopleDetailView)
        peopleDetailView.translatesAutoresizingMaskIntoConstraints = false
         peopleDetailView.backgroundColor = UIColor(hexString: "083D77")
        peopleDetailView.layer.cornerRadius = 10
        peopleDetailView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        peopleDetailView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        peopleDetailView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        peopleDetailView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    
    private func configureDismissView(){
        screenTap = UITapGestureRecognizer(target: self, action: #selector(screenTapped))
        view.addGestureRecognizer(screenTap)
    }
    
    @objc private func screenTapped(){
       self.dismiss(animated: true)
    }
    
    private func displayPersonInformations(){
        peopleDetailView.nameLabel.text = "Name: \(person.name)"
        peopleDetailView.birthYear.text = "Birth Year: \(String(describing: person.birth_year))"
        peopleDetailView.genderLabel.text = "Gender: \(person.gender)"
        peopleDetailView.heightLabel.text = "Height: \(person.height)"
        peopleDetailView.skinColorLabel.text = "Skin Color: \(String(describing: person.skin_color))"
        
        switch person.hair_color {
        case "brown":
            if person.gender == "male" {
                 peopleDetailView.hairColor.text = "Hair Color: \(String(describing: person.hair_color)) 👨🏾‍🦰"
            } else if person.gender == "female" {
                 peopleDetailView.hairColor.text = "Hair Color: \(String(describing: person.hair_color)) 👩🏾‍🦰"
            } else {
            peopleDetailView.hairColor.text = "Hair Color: \(String(describing: person.hair_color))🧞‍♂️"
            }
        
        case "black":
            if person.gender == "male" {
                peopleDetailView.hairColor.text = "Hair Color: \(String(describing: person.hair_color)) 👦🏿"
            } else if person.gender == "female" {
                peopleDetailView.hairColor.text = "Hair Color: \(String(describing: person.hair_color)) 🧒🏿"
            } else {
                peopleDetailView.hairColor.text = "Hair Color: \(String(describing: person.hair_color))🧞‍♂️"
            }
        case "white":
            
            if person.gender == "male" {
                peopleDetailView.hairColor.text = "Hair Color: \(String(describing: person.hair_color)) 👨🏻‍🦳"
            } else if person.gender == "female" {
                peopleDetailView.hairColor.text = "Hair Color: \(String(describing: person.hair_color))👩🏽‍🦳 "
            } else {
                peopleDetailView.hairColor.text = "Hair Color: \(String(describing: person.hair_color))🧞‍♂️"
            }
        default:
            peopleDetailView.hairColor.text = "Hair Color: \(String(describing: person.hair_color))"
        }
    }
    
}
