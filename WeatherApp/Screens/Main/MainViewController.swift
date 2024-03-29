//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Hakan Or on 5.07.2022.
//

import UIKit

let refreshControl = UIRefreshControl()


class MainViewController: UIViewController, Alertable {
    // MARK: - Subviews
    private lazy var configuredButton: UIButton = {
        let button = UIButton(type: .contactAdd)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.center = self.view.center
        button.addTarget(self, action: #selector(buttonOnClicked), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Properties
    private var receivedData: String = ""
    private var weatherInfoList: [WeatherInfoResponseBody] = []
    var cities = [String]()
    private let weatherService = WeatherService()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cities = UserDefaults.standard.stringArray(forKey: "cities") ?? ["error"]
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationItem.title="Today"
        
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        refreshControl.endRefreshing()
        
        view.backgroundColor = .white
        
        let button = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(self.buttonOnClicked))
        self.navigationItem.rightBarButtonItem = button
        
        view.addSubview(tableView)
        configureTableView()
        
        cities.forEach { city in
            weatherService.fetchWeather(cityName: city) { response in
                self.weatherInfoList.append(response)
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        configuredButton.constraints.forEach { $0.isActive = false }
        configuredButton.removeFromSuperview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    @objc func refresh(_ sender: AnyObject) {
        for city in cities {
            weatherInfoList.removeAll()
            addNewCity(city: city)
        }
        refreshControl.endRefreshing()
    }
    
    // MARK: - Setup
    func configureTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - User Actions
    @objc func buttonOnClicked(){
        let addCityVC = AddCityViewController()
        addCityVC.delegate = self
        navigationController?.pushViewController(addCityVC, animated: true)
    }
    
    func addNewCity(city:String){
        weatherService.fetchWeather(cityName: city) { response in
            self.weatherInfoList.append(response)
            self.tableView.reloadData()
        }
    }
    
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        let weatherInfo = weatherInfoList[indexPath.row]
        let date = Date()
        cell.setLabels(
            statusLabel: weatherInfo.weather.first?.description ?? "-",
            timeLabel: date.getCurrentTime(),
            degreeLabel: "\(weatherInfo.main.feelsLike)°",
            locationLabel: weatherInfo.name
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let foreCastVC = ForecastViewController()
        foreCastVC.city = cities[indexPath.row]
        navigationController?.pushViewController(foreCastVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cities.remove(at: indexPath.row)
            weatherInfoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            UserDefaults.standard.set(cities, forKey: "cities")
            tableView.reloadData()
        }
    }

    
}

extension MainViewController : MyDataSendingDelegateProtocol {
    func sendDataToFirstViewController(data: String) {
        receivedData = data
        if !cities.contains(data){
            cities.append(data)
            let weatherService = WeatherService()
            weatherService.fetchWeather(cityName: data) { response in
                self.weatherInfoList.append(response)
                UserDefaults.standard.set(self.cities, forKey: "cities")
                self.tableView.reloadData()
            }
        }
    }
    
}
