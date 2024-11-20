//
//  HomeViewController.swift
//  VoyatekGroupAssessment
//
//  Created by Danjuma Nasiru on 20/11/2024.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var createTripContainer: UIView!
    @IBOutlet weak var plannedTripDropDown: UIView!
    @IBOutlet weak var plannedTripDropDownBtn: UIView!
    @IBOutlet weak var plannedTripsTableView: UITableView!
    var hidePlannedTrips: Bool = true
    
    var selectCityLabel = UILabel()
    var startDateLabel = UILabel()
    var endDateLabel = UILabel()
    var createTripBtn = UIButton(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Plan a Trip"
        setupCreateCard()
        plannedTripsTableView.dataSource = self
        plannedTripsTableView.isHidden = true
        plannedTripDropDown.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(toggleTripsDisplay)))
        selectCityLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gotoSelectAirport)))
        startDateLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gotoSelectDate)))
        endDateLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gotoSelectDate)))
        createTripBtn.addTarget(self, action: #selector(createTrip), for: .touchUpInside)
    }
    
    @objc func toggleTripsDisplay() {
        plannedTripsTableView.isHidden.toggle()
    }
    
    func onAirportSelected(airport: Airport) {
        selectCityLabel.text = airport.name.isEmpty ? "Select City" : airport.name
        print(airport)
        dismiss(animated: true)
    }
    
    func onDatesSelected(startDate: String, endDate: String) {
        startDateLabel.text = startDate.isEmpty ? "Start Date" : startDate
        endDateLabel.text = endDate.isEmpty ? "End Date" : endDate
        dismiss(animated: true)
    }
    
    @objc func gotoSelectAirport() {
        let airportVC = TripLocationViewController()
        airportVC.onSelect = onAirportSelected(airport:)
        present(airportVC, animated: true)
    }
    
    @objc func gotoSelectDate() {
        let datePickerVC = DatePickerController()
        datePickerVC.onDateSelected = onDatesSelected(startDate:endDate:)
        present(datePickerVC, animated: true)
    }
    
    @objc func createTrip() {
        if !startDateLabel.text!.isEmpty && !endDateLabel.text!.isEmpty && !selectCityLabel.text!.isEmpty {
            let createVC = CreateTripDetailsViewController()
            createVC.onProceed = gotoDetailsScreen
            present(createVC, animated: true)
        }
    }
    
    func gotoDetailsScreen() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "TripDetailsViewController") as? TripDetailsViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func setupCreateCard() {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 5
        view.addSubview(containerView)
        containerView.anchorBottomLeftRightHeight(bottom: createTripContainer.bottomAnchor, left: createTripContainer.leadingAnchor, right: createTripContainer.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 15, bottom: -15, right: -15), height: 330)
        
        createTripBtn.setTitle("Create a Trip", for: .normal)
        createTripBtn.setTitleColor(.white, for: .normal)
        createTripBtn.backgroundColor = UIColor.vgBlue
        createTripBtn.layer.cornerRadius = 5
        containerView.addSubview(createTripBtn)
        createTripBtn.anchorBottomLeftRightHeight(bottom: containerView.bottomAnchor, left: containerView.leadingAnchor, right: containerView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 15, bottom: -15, right: -15), height: 62)
        
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.distribution = .fillEqually
        vStack.alignment = .fill
        vStack.spacing = 5
        containerView.addSubview(vStack)
        vStack.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, trailing: containerView.trailingAnchor, bottom: createTripBtn.topAnchor, padding: UIEdgeInsets(top: 15, left: 15, bottom: -10, right: -15))
        
        let whereToView = UIView()
        whereToView.backgroundColor = .vgLightestBlue
        whereToView.layer.borderColor = UIColor.gray.cgColor
        whereToView.layer.borderWidth = 1
        whereToView.layer.cornerRadius = 5
        
        let locationIcon = UIImageView(image: UIImage(named: "location-icon"))
        whereToView.addSubview(locationIcon)
        locationIcon.anchorSize(width: 20, height: 25)
        locationIcon.anchorHorizontalVerticalCenter(leading: whereToView.leadingAnchor, trailing: nil, centerY: whereToView.centerYAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        
        let whereToLabel = UILabel()
        whereToLabel.text = "Where to?"
        whereToView.addSubview(whereToLabel)
        whereToLabel.anchorTopLeft(top: whereToView.topAnchor, left: locationIcon.trailingAnchor, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 0))
        
        selectCityLabel.text = "Select City"
        selectCityLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        selectCityLabel.isUserInteractionEnabled = true
        whereToView.addSubview(selectCityLabel)
        selectCityLabel.anchorBottomLeftRight(bottom: whereToView.bottomAnchor, left: locationIcon.trailingAnchor, right: whereToView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: -30, right: -20))
        
        
        let dateStack = UIStackView()
        dateStack.axis = .horizontal
        dateStack.distribution = .fillEqually
        dateStack.alignment = .fill
        dateStack.spacing = 10
        
        let startDateView = UIView()
        startDateView.backgroundColor = .vgLightestBlue
        startDateView.layer.borderColor = UIColor.gray.cgColor
        startDateView.layer.borderWidth = 1
        startDateView.layer.cornerRadius = 5
        
        let calenderIcon = UIImageView(image: UIImage(named: "CalendarBlank"))
        startDateView.addSubview(calenderIcon)
        calenderIcon.anchorSize(width: 25, height: 25)
        calenderIcon.anchorHorizontalVerticalCenter(leading: startDateView.leadingAnchor, trailing: nil, centerY: startDateView.centerYAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        
        let startDateTitle = UILabel()
        startDateTitle.text = "Start Date"
        startDateView.addSubview(startDateTitle)
        startDateTitle.anchorTopLeft(top: startDateView.topAnchor, left: calenderIcon.trailingAnchor, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 0))
        
        startDateLabel.text = "Enter Date"
        startDateLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        startDateLabel.isUserInteractionEnabled = true
        startDateView.addSubview(startDateLabel)
        startDateLabel.anchorBottomLeft(bottom: startDateView.bottomAnchor, left: calenderIcon.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: -30, right: 0))
        
        let endDateView = UIView()
        endDateView.backgroundColor = .vgLightestBlue
        endDateView.layer.borderColor = UIColor.gray.cgColor
        endDateView.layer.borderWidth = 1
        endDateView.layer.cornerRadius = 5
        
        let calenderIcon2 = UIImageView(image: UIImage(named: "CalendarBlank"))
        endDateView.addSubview(calenderIcon2)
        calenderIcon2.anchorSize(width: 25, height: 25)
        calenderIcon2.anchorHorizontalVerticalCenter(leading: endDateView.leadingAnchor, trailing: nil, centerY: endDateView.centerYAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        
        let endDateTitle = UILabel()
        endDateTitle.text = "End Date"
        endDateView.addSubview(endDateTitle)
        endDateTitle.anchorTopLeft(top: endDateView.topAnchor, left: calenderIcon2.trailingAnchor, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 0))
        
        endDateLabel.text = "Enter Date"
        endDateLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        endDateLabel.isUserInteractionEnabled = true
        endDateView.addSubview(endDateLabel)
        endDateLabel.anchorBottomLeft(bottom: endDateView.bottomAnchor, left: calenderIcon2.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: -30, right: 0))
        
        dateStack.addArrangedSubview(startDateView)
        dateStack.addArrangedSubview(endDateView)
        
        vStack.addArrangedSubview(whereToView)
        vStack.addArrangedSubview(dateStack)
        
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlannedTripCell", for: indexPath) as! PlannedTripCell
        return cell
    }
    
    
}
