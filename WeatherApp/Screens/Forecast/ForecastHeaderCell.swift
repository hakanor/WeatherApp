//
//  ForecastHeaderCell.swift
//  WeatherApp
//
//  Created by Hakan Or on 12.07.2022.
//

import UIKit

class ForecastHeaderCell: UITableViewCell {
    var gelendeger = ""
    
    // MARK: - Subviews
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Status"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.contentMode = .scaleToFill
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var degreeLabel: UILabel = {
        let label = UILabel()
        label.text = "Degree"
        label.font = .systemFont(ofSize: 34, weight: .heavy)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        contentView.addSubview(containerView)

        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        containerView.addSubview(statusLabel)
        containerView.addSubview(degreeLabel)
        containerView.addSubview(descriptionLabel)

        statusLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 20).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 20).isActive = true

        degreeLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant: 10).isActive = true
        degreeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 20).isActive = true
        degreeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
        descriptionLabel.widthAnchor.constraint(equalToConstant: contentView.bounds.width - 40 ).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: degreeLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -20).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 20).isActive = true
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
    func setLabels(statusLabel: String, degreeLabel: String){
        self.statusLabel.text = statusLabel
        self.degreeLabel.text = degreeLabel
        setDescriptionLabelColors(statusString: statusLabel, degreeString: degreeLabel)
    }
    
    func setDescriptionLabelColors(statusString:String, degreeString:String){
//        Today, (blue)Showers currently , It's .....
        let stringValue = "Today, \(statusLabel.text ?? "null") currently. It's \(degreeLabel.text ?? "null") and"
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: stringValue)
        attributedString.setColorForText(textForAttribute: statusString , withColor: .systemBlue)
        attributedString.setColorForText(textForAttribute: degreeString , withColor: .systemBlue)
        attributedString.setColorForText(textForAttribute:  "°", withColor: .systemBlue)
        descriptionLabel.attributedText = attributedString
    }
}

