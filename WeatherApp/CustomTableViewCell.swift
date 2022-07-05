//
//  CustomTableViewCell.swift
//  WeatherApp
//
//  Created by Hakan Or on 5.07.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
//    TODO send object
    func set(title: String, desc: String){
        titleLabel.text=title
        locationLabel.text=desc
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ankara"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Ankara"
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var timelabel: UILabel = {
        let label = UILabel()
        label.text = "10:33 am"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var degreeLabel: UILabel = {
        let label = UILabel()
        label.text = "30°"
        label.font = .systemFont(ofSize: 34, weight: .heavy)
        label.textColor = .black
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20).isActive = true
        
        contentView.addSubview(timelabel)
        timelabel.translatesAutoresizingMaskIntoConstraints = false
        timelabel.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
        timelabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        timelabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20).isActive = true

        contentView.addSubview(degreeLabel)
        degreeLabel.translatesAutoresizingMaskIntoConstraints = false
        degreeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 20).isActive = true
        degreeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20).isActive = true
        degreeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        contentView.addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -20).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
