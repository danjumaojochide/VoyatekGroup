//
//  PlannedTripCell.swift
//  VoyatekGroupAssessment
//
//  Created by Danjuma Nasiru on 20/11/2024.
//

import UIKit

class PlannedTripCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup() {
        let parentContainer = UIView(frame: .zero)
        contentView.addSubview(parentContainer)
        parentContainer.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: contentView.bottomAnchor)
        
        let container = UIView(frame: .zero)
        container.layer.cornerRadius = 5
        container.layer.borderColor = UIColor.gray.cgColor
        container.layer.borderWidth = 1
        parentContainer.addSubview(container)
        container.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, bottom: contentView.bottomAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10))
        
        let tripImage = UIImageView(image: UIImage(named: "road-trip"))
        container.addSubview(tripImage)
        tripImage.anchorTopLeftRightHeight(top: container.topAnchor, left: container.leadingAnchor, right: container.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: -10), height: 200)
        
        let tripTitle = UILabel(frame: .zero)
        tripTitle.text = "Bahamas family trip"
        container.addSubview(tripTitle)
        tripTitle.anchorTopLeft(top: tripImage.bottomAnchor, left: container.leadingAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0))
        
        let tripDate = UILabel(frame: .zero)
        tripDate.text = "19th Nov, 2024"
        container.addSubview(tripDate)
        tripDate.anchorTopLeft(top: tripTitle.bottomAnchor, left: container.leadingAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0))
        
        let viewBtn = UIButton(frame: .zero)
        viewBtn.setTitle("View", for: .normal)
        viewBtn.backgroundColor = UIColor.blue
        viewBtn.layer.cornerRadius = 5
        container.addSubview(viewBtn)
        viewBtn.anchorPlusHeight(top: tripDate.bottomAnchor, leading: container.leadingAnchor, trailing: container.trailingAnchor, bottom: container.bottomAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10), height: 54)
    }
}
