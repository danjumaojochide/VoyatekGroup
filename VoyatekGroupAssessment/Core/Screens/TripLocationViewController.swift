//
//  TripLocationViewController.swift
//  VoyatekGroupAssessment
//
//  Created by Danjuma Nasiru on 20/11/2024.
//

import UIKit

class TripLocationViewController: UIViewController {

    var xBtn = UILabel()
    var headerDivider = UIView()
    var searchTextField = PaddedTextField()
    var flightsTableView = UITableView()
    
    var onSelect: ((Airport) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        
    }
    
    @objc func dismissPicker() {
        dismiss(animated: true)
    }

    func setup() {
        xBtn.text = "X"
        view.addSubview(xBtn)
        xBtn.anchorTopLeft(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 0))
        xBtn.isUserInteractionEnabled = true
        xBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissPicker)))
        
        let titleText = UILabel()
        titleText.text = "Where"
        titleText.textAlignment = .left
        view.addSubview(titleText)
        titleText.anchorTopLeft(top: view.safeAreaLayoutGuide.topAnchor, left: xBtn.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 0))
        
        headerDivider.backgroundColor = .gray
        view.addSubview(headerDivider)
        headerDivider.anchorTopLeftRightHeight(top: titleText.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0), height: 1)
        
        let cityText = UILabel()
        cityText.text = "Please select a city"
        cityText.font = UIFont.systemFont(ofSize: 14, weight: .light)
        view.addSubview(cityText)
        cityText.anchorTopLeft(top: headerDivider.bottomAnchor, left: view.leadingAnchor, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 0))
        
        searchTextField.layer.borderWidth = 1
        searchTextField.layer.borderColor = UIColor.blue.cgColor
        searchTextField.layer.cornerRadius = 5
        view.addSubview(searchTextField)
        searchTextField.anchorTopLeftRightHeight(top: cityText.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: -20), height: 60)
        
        view.addSubview(flightsTableView)
        flightsTableView.register(AirportCell.self, forCellReuseIdentifier: AirportCell.identifier)
        flightsTableView.dataSource = self
        flightsTableView.delegate = self
        flightsTableView.anchor(top: searchTextField.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, padding: UIEdgeInsets(top: 10, left: 20, bottom: -20, right: -20))
    }
}

extension TripLocationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Airport.airports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AirportCell.identifier, for: indexPath) as! AirportCell
        let airport = Airport.airports[indexPath.row]
        cell.configure(airport: airport)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = Airport.airports[indexPath.row]
        onSelect?(selected)
    }
}
