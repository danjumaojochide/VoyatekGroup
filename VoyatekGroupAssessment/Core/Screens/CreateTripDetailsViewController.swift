//
//  CreateTripDetailsViewController.swift
//  VoyatekGroupAssessment
//
//  Created by Danjuma Nasiru on 20/11/2024.
//

import UIKit

class CreateTripDetailsViewController: UIViewController {
    
    var xBtn = UILabel()
    var tripNameField = PaddedTextField()
    var travelStyleField = PaddedTextField()
    var tripDescriptionField = UITextView()
    var nextBtn = UIButton()
    var onProceed: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        setup()
        nextBtn.addTarget(self, action: #selector(proceedAction), for: .touchUpInside)
    }
    
    @objc func dismissAction() {
        dismiss(animated: true)
    }
    
    @objc func proceedAction() {
        if(validatefields()) {
            dismiss(animated: true)
            onProceed?()
        }
    }
    
    func setup() {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 25
        view.addSubview(containerView)
        let containerHeight = UIScreen.main.bounds.height * 0.8
        containerView.anchorBottomLeftRightHeight(bottom: view.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, height: containerHeight)
        //        containerView.anchorPlusHeight(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor, height: containerHeight)
        
        let palmImage = UIImageView(image: UIImage(named: "tree-icon"))
        view.addSubview(palmImage)
        palmImage.anchorTopLeftWidthHeight(top: containerView.topAnchor, leading: view.leadingAnchor, width: 30, height: 30, padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 0))
        
        xBtn.text = "X"
        view.addSubview(xBtn)
        xBtn.anchorTopRight(top: containerView.topAnchor, right: view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: -20))
        xBtn.isUserInteractionEnabled = true
        xBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissAction)))
        
        let titleText = UILabel()
        titleText.text = "Create a Trip"
        view.addSubview(titleText)
        titleText.anchorTopLeft(top: palmImage.bottomAnchor, left: view.leadingAnchor, padding: UIEdgeInsets(top: 40, left: 20, bottom: 0, right: 0))
        
        let desc = UILabel()
        desc.text = "Let's Go! Build Your Next Adventure"
        view.addSubview(desc)
        desc.anchorTopLeft(top: titleText.bottomAnchor, left: view.leadingAnchor, padding: UIEdgeInsets(top: 15, left: 20, bottom: 0, right: 0))
        
        let tripNameTitle = UILabel()
        tripNameTitle.text = "Trip Name"
        view.addSubview(tripNameTitle)
        tripNameTitle.anchorTopLeft(top: desc.bottomAnchor, left: view.leadingAnchor, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 0))
        
        tripNameField.placeholder = "Enter your trip name"
        tripNameField.layer.cornerRadius = 5
        tripNameField.layer.borderWidth = 1
        tripNameField.layer.borderColor = UIColor.gray.cgColor
        view.addSubview(tripNameField)
        tripNameField.anchorTopLeftRightHeight(top: tripNameTitle.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: -20), height: 60)
        
        let travelStyleTitle = UILabel()
        travelStyleTitle.text = "Travel Style"
        view.addSubview(travelStyleTitle)
        travelStyleTitle.anchorTopLeft(top: tripNameField.bottomAnchor, left: view.leadingAnchor, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 0))
        
        travelStyleField.placeholder = "Select your travel style"
        travelStyleField.layer.cornerRadius = 5
        travelStyleField.layer.borderWidth = 1
        travelStyleField.layer.borderColor = UIColor.gray.cgColor
        travelStyleField.rightView = UIImageView(image: UIImage(systemName: "chevron.down"))
        view.addSubview(travelStyleField)
        travelStyleField.anchorTopLeftRightHeight(top: travelStyleTitle.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: -20), height: 60)
        
        let descTitle = UILabel()
        descTitle.text = "Trip Description"
        view.addSubview(descTitle)
        descTitle.anchorTopLeft(top: travelStyleField.bottomAnchor, left: view.leadingAnchor, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 0))
        
        tripDescriptionField.text = "Select your travel style"
        tripDescriptionField.layer.cornerRadius = 5
        tripDescriptionField.layer.borderWidth = 1
        tripDescriptionField.layer.borderColor = UIColor.gray.cgColor
        view.addSubview(tripDescriptionField)
        tripDescriptionField.anchorTopLeftRightHeight(top: descTitle.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 20, bottom: 0, right: -20), height: 120)
        
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.backgroundColor = .vgBlue
        nextBtn.layer.cornerRadius = 5
        view.addSubview(nextBtn)
        nextBtn.anchorBottomLeftRightHeight(bottom: containerView.bottomAnchor, left: view.leadingAnchor, right: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: -40, right: -20), height: 54)
        nextBtn.addTarget(self, action: #selector(proceedAction), for: .touchUpInside)
    }
    
    func validatefields() -> Bool {
        if let tripName = tripNameField.text, let style = travelStyleField.text {
            if !tripName.isEmpty && !style.isEmpty {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
}
