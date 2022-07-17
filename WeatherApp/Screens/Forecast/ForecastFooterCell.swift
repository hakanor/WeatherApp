//
//  ForecastFooterCell.swift
//  WeatherApp
//
//  Created by Hakan Or on 13.07.2022.
//

import UIKit

class ForecastFooterCell: UITableViewCell {
    static let identifier = "ForecastFooterCell"
    
    // MARK: - Subviews
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Monday"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var icon: UIImageView = {
        let icon = UIImageView()
        var image = UIImage(systemName: "sun.max")
        icon.image = image
        icon.tintColor = .black
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.text = "33"
        label.font = .monospacedSystemFont(ofSize: 16, weight: .heavy)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var feelsLikeLabel: UILabel = {
        let label = UILabel()
        label.text = "34"
        label.font = .monospacedSystemFont(ofSize: 16, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        contentView.addSubview(containerView)
        contentView.backgroundColor = .clear

        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        containerView.addSubview(dayLabel)
        containerView.addSubview(icon)
        containerView.addSubview(tempLabel)
        containerView.addSubview(feelsLikeLabel)

        dayLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        dayLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        dayLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true

        icon.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        icon.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        icon.trailingAnchor.constraint(equalTo: tempLabel.leadingAnchor,constant: -20).isActive = true
        
        tempLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        tempLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        tempLabel.trailingAnchor.constraint(equalTo: feelsLikeLabel.leadingAnchor, constant: -20).isActive = true

        feelsLikeLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        feelsLikeLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        feelsLikeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Configuration
    func setFooterCellLabels(day:String, iconName:String, feelsLike:String, temp:String){
        dayLabel.text = day
        let url = "https://openweathermap.org/img/wn/\(iconName)@2x.png"
        self.icon.imageFromUrl(from: url)
        feelsLikeLabel.text = feelsLike
        tempLabel.text = temp
    }
}
