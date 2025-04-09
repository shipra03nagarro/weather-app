//
//  ViewController.swift
//  WeatherApp
//
//  Created by Shipra Dhooper on 08/04/25.
//

import UIKit

class ViewController: UIViewController {

    // IBOutlets
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // Private Variable
    private let viewModel = WeatherViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup delegate
        viewModel.delegate = self

        // Register the custom cell
        tableView.register(UINib(nibName: "WeatherInfoCell", bundle: nil), forCellReuseIdentifier: WeatherInfoCell.identifier)

        // Configure table view
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        guard let city = cityTextField.text, !city.isEmpty else {
            showAlert(title: "Error", message: "Please enter a city name.")
            return
        }
        // Show the loading indicator while fetching data
        activityIndicator.startAnimating()

        // Fetch weather data
        viewModel.fetchWeatherReport(for: city)
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - WeatherViewDelegate

extension ViewController: WeatherViewDelegate {
    func didReceiveWeatherData() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.stopAnimating()

            self?.reloadTableView()
        }
    }

    func didFailWithError(_ error: APIError) {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.stopAnimating()

            // Display error message
            self?.showAlert(title: "Error", message: error.localizedDescription)
        }
    }

    private func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getForecast().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherInfoCell.identifier, for: indexPath) as? WeatherInfoCell else {
            return UITableViewCell()
        }

        let forecastDay = viewModel.getForecast()[indexPath.row]
        cell.setUp(with: forecastDay)
        return cell
    }
}
