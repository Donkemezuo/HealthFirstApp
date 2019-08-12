//
//  PeopleDetailsView.swift
//  HealthFirstApp
//
//  Created by Donkemezuo Raymond Tariladou on 8/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import UIKit

class PeopleDetailsView: UIView {
    
    public lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        nameLabel.textColor = .white
        nameLabel.numberOfLines = 0
        return nameLabel
    }()
    
    public lazy var genderLabel: UILabel = {
        let genderLabel = UILabel()
        genderLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        genderLabel.textColor = .white
        return genderLabel
    }()
    
    public lazy var heightLabel: UILabel = {
        let heightLabel = UILabel()
        heightLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        heightLabel.textColor = .white
        return heightLabel
    }()
    
    
    public lazy var skinColorLabel: UILabel = {
        let skinColorLabel = UILabel()
        skinColorLabel.textColor = .white
        skinColorLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        return skinColorLabel
    }()
    
    public lazy var hairColor: UILabel = {
        let hairColor = UILabel()
        hairColor.textColor = .white
        hairColor.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        return hairColor
    }()
    
    public lazy var birthYear: UILabel = {
        let birthYear = UILabel()
        birthYear.textColor = .white
        birthYear.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        return birthYear
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
        setNameLabelComstrains()
        setGenderLabelConstrains()
        setHeightLabel()
        setSkinColorLabelConstrains()
        setHairColorLabelConstrains()
        setBirthYearLabelConstrains()
    }
    
    private func setNameLabelComstrains(){
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0.8).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
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
    
    private func setSkinColorLabelConstrains(){
        addSubview(skinColorLabel)
        skinColorLabel.translatesAutoresizingMaskIntoConstraints = false
        skinColorLabel.topAnchor.constraint(equalToSystemSpacingBelow: heightLabel.bottomAnchor, multiplier: 0.8).isActive = true
        skinColorLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2).isActive = true
        skinColorLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        skinColorLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        
    }
    
    private func setHairColorLabelConstrains(){
        addSubview(hairColor)
        hairColor.translatesAutoresizingMaskIntoConstraints = false
        hairColor.topAnchor.constraint(equalToSystemSpacingBelow: heightLabel.bottomAnchor, multiplier: 0.8).isActive = true
        hairColor.leadingAnchor.constraint(equalToSystemSpacingAfter: skinColorLabel.trailingAnchor, multiplier: 0.5).isActive = true
        hairColor.widthAnchor.constraint(equalTo: skinColorLabel.widthAnchor).isActive = true
        hairColor.heightAnchor.constraint(equalTo: skinColorLabel.heightAnchor).isActive = true
    }
    
    private func setBirthYearLabelConstrains(){
        addSubview(birthYear)
        birthYear.translatesAutoresizingMaskIntoConstraints = false
        birthYear.topAnchor.constraint(equalToSystemSpacingBelow: hairColor.bottomAnchor, multiplier: 0.5).isActive = true
        birthYear.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        birthYear.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        birthYear.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
    }
    

}
