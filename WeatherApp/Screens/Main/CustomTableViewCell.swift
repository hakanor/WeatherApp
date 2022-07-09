//
//  CustomTableViewCell.swift
//  WeatherApp
//
//  Created by Hakan Or on 5.07.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Subviews
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
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
    
    private lazy var timeLabel: UILabel = {
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
        
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        containerView.addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 20).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 20).isActive = true
        
        containerView.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: statusLabel.topAnchor).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: statusLabel.trailingAnchor).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true

        containerView.addSubview(degreeLabel)
        degreeLabel.translatesAutoresizingMaskIntoConstraints = false
        degreeLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant: 10).isActive = true
        degreeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 20).isActive = true
        degreeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
        containerView.addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.topAnchor.constraint(equalTo: degreeLabel.bottomAnchor, constant: 10).isActive = true
        locationLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -20).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.layer.cornerRadius = 16
        containerView.layer.applySketchShadow()
    }
    
    // MARK: - Configuration
    func setLabels(statusLabel: String, timeLabel: String, degreeLabel: String, locationLabel: String){
        self.statusLabel.text = statusLabel
        self.locationLabel.text = locationLabel
        self.timeLabel.text = timeLabel
        self.degreeLabel.text = degreeLabel
    }
}
