//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by Hakan Or on 12.07.2022.
//

import UIKit

class ForecastViewController: UIViewController {
    
    // MARK: - Subviews
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .red
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Properties
    var city="";

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title=city
        view.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00)
        view.addSubview(tableView)
        configureTableView()
    }
    // MARK: - Setup
    func configureTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(ForecastHeaderCell.self, forCellReuseIdentifier: "headercell")
        tableView.register(ForecastCollectionView.self, forCellReuseIdentifier: "collectioncell")
    }
    // MARK: - User Actions
}

// MARK: - UITableViewDelegate
extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
            
        } else if section == 1 {
            return 1
            
        } else if section == 2 {
            return 7
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "headercell") as! ForecastHeaderCell
            cell.backgroundColor = .clear
            cell.setLabels(statusLabel: "Showers", degreeLabel: "36°")
                return cell
            }
        
        if (indexPath.section == 1) && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "collectioncell") as! ForecastCollectionView
            cell.backgroundColor = .clear
                return cell
            }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.backgroundColor = .clear
        cell.setLabels(statusLabel: String(indexPath.section), timeLabel: "s", degreeLabel: "s", locationLabel: "s")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 1) && indexPath.row == 0 {
            return 140
        }
        
        return UITableView.automaticDimension
    }
}
