//
//  PeopleTableViewCell.swift
//  HealthFirstApp
//
//  Created by Donkemezuo Raymond Tariladou on 8/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    public lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        nameLabel.textColor = .white
        return nameLabel
    }()
    
    public lazy var genderLabel: UILabel = {
        let genderLabel = UILabel()
        genderLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        genderLabel.textColor = .white
        return genderLabel
    }()
    
    public lazy var heightLabel: UILabel = {
        let heightLabel = UILabel()
        heightLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        heightLabel.textColor = .white
        return heightLabel
    }()
    
    public lazy var createdDateLabel: UILabel = {
        let createdDateLabel = UILabel()
        createdDateLabel.font = UIFont(name: "HelveticaNeue-Italic", size: 14)
        createdDateLabel.textColor = .white
        return createdDateLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        setNameLabelComstrains()
        setGenderLabelConstrains()
        setHeightLabel()
        setCreatedDateLabelConstrains()
    }
    
    private func setNameLabelComstrains(){
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0.8).isActive = true
        nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.5).isActive = true
        nameLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: trailingAnchor, multiplier: 2).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
    }
    
    private func setGenderLabelConstrains(){
        addSubview(genderLabel)
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.topAnchor.constraint(equalToSystemSpacingBelow: nameLabel.bottomAnchor, multiplier: 0.8).isActive = true
        genderLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2).isActive = true
        genderLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        genderLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
    }
    
    
    private func setHeightLabel(){
        addSubview(heightLabel)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.topAnchor.constraint(equalToSystemSpacingBelow: nameLabel.bottomAnchor, multiplier: 0.8).isActive = true
        heightLabel.widthAnchor.constraint(equalTo: genderLabel.widthAnchor).isActive = true
        heightLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: genderLabel.trailingAnchor, multiplier: 0.5).isActive = true
        heightLabel.heightAnchor.constraint(equalTo: genderLabel.heightAnchor).isActive = true
    }
    
    private func setCreatedDateLabelConstrains(){
        addSubview(createdDateLabel)
        createdDateLabel.translatesAutoresizingMaskIntoConstraints = false
        createdDateLabel.topAnchor.constraint(equalToSystemSpacingBelow: heightLabel.bottomAnchor, multiplier: 0.2).isActive = true
        createdDateLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2).isActive = true
        createdDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        createdDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
