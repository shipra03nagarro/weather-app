//
//  WeatherInfoCell.swift
//  WeatherApp
//
//  Created by Shipra Dhooper on 09/04/25.
//

import UIKit

class WeatherInfoCell: UITableViewCell {
    static let identifier = "WeatherInfoCell"

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUp(with configurable: WeatherCellConfigurable) {
        dateLabel.text = configurable.dateText
        tempLabel.text = configurable.temperatureText
        speedLabel.text = configurable.windSpeedText
        humidityLabel.text = configurable.humidityText
        descLabel.text = configurable.descriptionText
    }
}
