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
    var forecastInfoList: ForecastInfoResponseBody?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title=city
        fetchForecastBody()
        
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
        tableView.register(ForecastHeaderCell.self, forCellReuseIdentifier: "headercell")
        tableView.register(ForecastCollectionView.self, forCellReuseIdentifier: "collectioncell")
        tableView.register(ForecastFooterCell.self, forCellReuseIdentifier: ForecastFooterCell.identifier)
    }
    // MARK: - User Actions
    func fetchForecastBody() {
        let service = ForecastService()
        service.fetchForecast(cityName: self.city) { response in
            self.forecastInfoList = response
            self.tableView.reloadData()
        }
    }
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
        // HEADER CELL
        if (indexPath.section == 0) && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "headercell") as! ForecastHeaderCell
            cell.backgroundColor = .clear
            let statusText = forecastInfoList?.list.first?.weather.first?.description ?? "-"
            let degreeText = String(forecastInfoList?.list.first?.main.tempC ?? 0) + "°"
    
            cell.setLabels(statusLabel: statusText, degreeLabel: String(degreeText))
                return cell
            }
        
        // COLLECTION CELL
        if (indexPath.section == 1) && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "collectioncell") as! ForecastCollectionView
            cell.forecastInfo = self.forecastInfoList
            cell.setInfoBody(body: self.forecastInfoList)
            
            var dayText = forecastInfoList?.list.first?.dt_txt ?? ""
            dayText = dayText.dayFormatter(comingDayText: dayText)
            let feelsLikeText = String(forecastInfoList?.list.first?.main.feelsLike ?? 0) + "°"
            let tempText = String(forecastInfoList?.list.first?.main.tempC ?? 0) + "°"
            
            cell.setForecastCollectionViewLabels(
                day: dayText,
                feelsLike: feelsLikeText,
                temp: tempText
            )
            
            cell.backgroundColor = .clear
                return cell
            }
        
        // FOOTER CELL
        let cell = tableView.dequeueReusableCell(withIdentifier: ForecastFooterCell.identifier) as! ForecastFooterCell
        
        var dayText = forecastInfoList?.list[(indexPath.row) * 5].dt_txt ?? ""
        dayText = dayText.dayFormatter(comingDayText: dayText)
        let feelsLikeText = String(forecastInfoList?.list[(indexPath.row) * 5].main.feelsLike ?? 0) + "°"
        let tempText = String(forecastInfoList?.list[(indexPath.row) * 5].main.tempC ?? 0) + "°"
        let icon = String(forecastInfoList?.list[(indexPath.row) * 5].weather.first?.icon ?? "sun.max")
        
        cell.setFooterCellLabels(day: dayText, iconName: icon, feelsLike: feelsLikeText, temp: tempText)
        cell.backgroundColor = .clear
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        forecastInfoList == nil ? 0 : 3
        3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 1) && indexPath.row == 0 {
            return 160
        }
        
        return UITableView.automaticDimension
    }
}
