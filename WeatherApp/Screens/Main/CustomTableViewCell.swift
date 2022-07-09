//
//  CustomTableViewCell.swift
//  WeatherApp
//
//  Created by Hakan Or on 5.07.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Subviews
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Showers"
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
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20).isActive = true
        
        contentView.addSubview(timelabel)
        timelabel.translatesAutoresizingMaskIntoConstraints = false
        timelabel.topAnchor.constraint(equalTo: statusLabel.topAnchor).isActive = true
        timelabel.leadingAnchor.constraint(equalTo: statusLabel.trailingAnchor).isActive = true
        timelabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20).isActive = true

        contentView.addSubview(degreeLabel)
        degreeLabel.translatesAutoresizingMaskIntoConstraints = false
        degreeLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant: 20).isActive = true
        degreeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20).isActive = true
        degreeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        contentView.addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.topAnchor.constraint(equalTo: degreeLabel.bottomAnchor, constant: 10).isActive = true
        locationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -20).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    func set(title: String, desc: String){
        statusLabel.text=title
        locationLabel.text=desc
    }
}
