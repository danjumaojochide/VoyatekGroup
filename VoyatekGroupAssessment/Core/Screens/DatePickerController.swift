//
//  DatePickerController.swift
//  VoyatekGroupAssessment
//
//  Created by Danjuma Nasiru on 20/11/2024.
//

import UIKit
import FSCalendar

class DatePickerController: UIViewController {

    var xBtn: UILabel = UILabel()
    var headerDivider = UIView()
    var fsCalender: FSCalendar!
    var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM d"
        return formatter
    }
    var bottomStack: UIStackView = UIStackView(frame: .zero)
    var startDate = UILabel()
    var endDate = UILabel()
    
    var onDateSelected: ((String, String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupDismissBar()
        setupBottomBar()
        
        fsCalender = FSCalendar(frame: .zero)
        fsCalender.scope = .month
        fsCalender.scrollDirection = .vertical
        fsCalender.backgroundColor = UIColor.clear
        fsCalender.headerHeight = 50
        view.addSubview(fsCalender)
        fsCalender.anchor(top: headerDivider.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: bottomStack.topAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20))
        
        fsCalender.delegate = self
        fsCalender.dataSource = self
    }
    
    @objc func dismissPicker() {
        dismiss(animated: true)
    }
    
    @objc func dateSelected() {
        onDateSelected?(startDate.text!, endDate.text!)
    }
    
    func setupDismissBar() {
        xBtn.text = "X"
        view.addSubview(xBtn)
        xBtn.anchorTopLeft(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 0))
        xBtn.isUserInteractionEnabled = true
        xBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissPicker)))
        
        let titleText = UILabel()
        titleText.text = "Date"
        titleText.textAlignment = .left
        view.addSubview(titleText)
        titleText.anchorTopLeft(top: view.safeAreaLayoutGuide.topAnchor, left: xBtn.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 0))
        
        headerDivider.backgroundColor = .gray
        view.addSubview(headerDivider)
        headerDivider.anchorTopLeftRightHeight(top: titleText.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0), height: 1)
    }
    
    func setupBottomBar() {
        bottomStack.axis = .vertical
        bottomStack.distribution = .fill
        bottomStack.alignment = .leading
        bottomStack.spacing = 20
        bottomStack.backgroundColor = .white
        view.addSubview(bottomStack)
        bottomStack.anchorBottomLeftRight(bottom: view.safeAreaLayoutGuide.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: -20, right: 0))
        
        let dateStack = UIStackView(frame: .zero)
        dateStack.axis = .horizontal
        dateStack.distribution = .fillEqually
        dateStack.alignment = .fill
        dateStack.spacing = 10
        
        
        let chooseBtn = UIButton(frame: .zero)
        chooseBtn.setTitle("Choose Date", for: .normal)
        chooseBtn.backgroundColor = .vgBlue
        chooseBtn.layer.cornerRadius = 10
        chooseBtn.addTarget(self, action: #selector(dateSelected), for: .touchUpInside)
        
        bottomStack.addArrangedSubview(dateStack)
        bottomStack.addArrangedSubview(chooseBtn)
        dateStack.anchorHorizontal(left: bottomStack.leadingAnchor, right: bottomStack.trailingAnchor, leftConstant: 20, RightConstant: -20)
        chooseBtn.anchorHeight(height: 54)
        chooseBtn.anchorHorizontal(left: bottomStack.leadingAnchor, right: bottomStack.trailingAnchor, leftConstant: 20, RightConstant: -20)
        
        let startDateStack = UIStackView(frame: .zero)
        startDateStack.axis = .vertical
        startDateStack.distribution = .fill
        startDateStack.alignment = .fill
        startDateStack.spacing = 10
        
        let endDateStack = UIStackView(frame: .zero)
        endDateStack.axis = .vertical
        endDateStack.distribution = .fill
        endDateStack.alignment = .fill
        endDateStack.spacing = 10
        
        let startTitle = UILabel(frame: .zero)
        startTitle.text = "Start Date"
        
        
        
        let startDateContainer = UIView(frame: .zero)
        startDateContainer.layer.borderWidth = 1
        startDateContainer.layer.borderColor = UIColor.gray.cgColor
        startDateContainer.layer.cornerRadius = 5
        startDateContainer.addSubview(startDate)
        startDate.text = ""
        startDate.translatesAutoresizingMaskIntoConstraints = false
        startDate.leadingAnchor.constraint(equalTo: startDateContainer.leadingAnchor, constant: 10).isActive = true
        startDate.centerYAnchor.constraint(equalTo: startDateContainer.centerYAnchor).isActive = true
        startDateContainer.anchorHeight(height: 50)
        startDateStack.addArrangedSubview(startTitle)
        startDateStack.addArrangedSubview(startDateContainer)
        
        let endTitle = UILabel(frame: .zero)
        endTitle.text = "End Date"
        
        let endDateContainer = UIView(frame: .zero)
        endDateContainer.layer.borderWidth = 1
        endDateContainer.layer.borderColor = UIColor.gray.cgColor
        endDateContainer.layer.cornerRadius = 5
        endDateContainer.addSubview(endDate)
        endDate.text = ""
        endDate.translatesAutoresizingMaskIntoConstraints = false
        endDate.leadingAnchor.constraint(equalTo: endDateContainer.leadingAnchor, constant: 10).isActive = true
        endDate.centerYAnchor.constraint(equalTo: endDateContainer.centerYAnchor).isActive = true
        endDateContainer.anchorHeight(height: 50)
        
        endDateStack.addArrangedSubview(endTitle)
        endDateStack.addArrangedSubview(endDateContainer)
        
        
        
        dateStack.addArrangedSubview(startDateStack)
        dateStack.addArrangedSubview(endDateStack)
        
        
    }

}

extension DatePickerController: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let stringDate = formatter.string(from: date)
        if let start = startDate.text {
            if start.isEmpty {
                startDate.text = stringDate
            } else  {
                endDate.text = stringDate
            }
        }
        print(stringDate)
    }
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
}
