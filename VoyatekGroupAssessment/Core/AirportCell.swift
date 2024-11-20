//
//  CountriesCell.swift
//  VoyatekGroupAssessment
//
//  Created by Danjuma Nasiru on 20/11/2024.
//

import UIKit

class AirportCell: UITableViewCell {

    static let identifier = "AirportCell"
    
    var cityNameLabel = UILabel()
    var airportNameLabel = UILabel()
    var cityImage = UIImageView(frame: .zero)
    var cityCodeLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setup() {
        let container = UIView(frame: .zero)
        addSubview(container)
        container.anchorPlusHeight(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10), height: 60)
        
        let locationIcon = UIImageView(image: UIImage(named: "location-icon"))
        addSubview(locationIcon)
        locationIcon.anchorHorizontalVerticalCenter(leading: leadingAnchor, trailing: nil, centerY: centerYAnchor, padding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0))
        locationIcon.anchorSize(width: 15, height: 20)
        
        cityNameLabel = UILabel()
        cityNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        addSubview(cityNameLabel)
        cityNameLabel.anchorTopLeft(top: topAnchor, left: locationIcon.trailingAnchor, padding: UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 0))
        
        airportNameLabel = UILabel()
        airportNameLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        addSubview(airportNameLabel)
        airportNameLabel.anchorBottomLeft(bottom: bottomAnchor, left: locationIcon.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 15, bottom: -15, right: 0))
        
        addSubview(cityImage)
        cityImage.anchorTopRightWidthHeight(top: topAnchor, trailing: trailingAnchor, width: 25, height: 20, padding: UIEdgeInsets(top: 15, left: 0, bottom: 0, right: -15))
        
        cityCodeLabel = UILabel()
        addSubview(cityCodeLabel)
        cityCodeLabel.anchorBottomLeftRight(bottom: bottomAnchor, left: airportNameLabel.trailingAnchor, right: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: -15, right: -15))
    }

    func configure(airport: Airport) {
        cityNameLabel.text = airport.city
        airportNameLabel.text = airport.name
        cityImage.image = UIImage(named: airport.image)
        cityCodeLabel.text = airport.code
    }
}
