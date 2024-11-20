//
//  UIViewExt.swift
//  VoyatekGroupAssessment
//
//  Created by Danjuma Nasiru on 20/11/2024.
//

import Foundation
import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor, leading: NSLayoutXAxisAnchor, trailing: NSLayoutXAxisAnchor, bottom: NSLayoutYAxisAnchor, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: top, constant: padding.top),
            leadingAnchor.constraint(equalTo: leading, constant: padding.left),
            trailingAnchor.constraint(equalTo: trailing, constant: padding.right),
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom)
        ])
    }

    func anchorPlusHeight(top: NSLayoutYAxisAnchor, leading: NSLayoutXAxisAnchor, trailing: NSLayoutXAxisAnchor, bottom: NSLayoutYAxisAnchor, padding: UIEdgeInsets = .zero, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: top, constant: padding.top),
            leadingAnchor.constraint(equalTo: leading, constant: padding.left),
            trailingAnchor.constraint(equalTo: trailing, constant: padding.right),
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom),
            heightAnchor.constraint(equalToConstant: height)
        ])
    }

    func anchorVertical(top: NSLayoutYAxisAnchor, bottom: NSLayoutYAxisAnchor, topConstant: CGFloat, bottomConstant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: top, constant: topConstant),
            bottomAnchor.constraint(equalTo: bottom, constant: bottomConstant)
        ])
    }

    func anchorHorizontal(left: NSLayoutXAxisAnchor, right: NSLayoutXAxisAnchor, leftConstant: CGFloat, RightConstant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: left, constant: leftConstant),
            trailingAnchor.constraint(equalTo: right, constant: RightConstant)
        ])
    }
    
    func anchorTopLeft(top: NSLayoutYAxisAnchor, left: NSLayoutXAxisAnchor, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: top, constant: padding.top),
            leadingAnchor.constraint(equalTo: left, constant: padding.left)
        ])
    }
    
    func anchorTopRight(top: NSLayoutYAxisAnchor, right: NSLayoutXAxisAnchor, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: top, constant: padding.top),
            trailingAnchor.constraint(equalTo: right, constant: padding.right)
        ])
    }
    
    func anchorBottomLeft(bottom: NSLayoutYAxisAnchor, left: NSLayoutXAxisAnchor, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom),
            leadingAnchor.constraint(equalTo: left, constant: padding.left)
        ])
    }
    
    func anchorBottomRight(bottom: NSLayoutYAxisAnchor, right: NSLayoutXAxisAnchor, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom),
            trailingAnchor.constraint(equalTo: right, constant: padding.right)
        ])
    }
    
    func anchorTopLeftRight(top: NSLayoutYAxisAnchor, left: NSLayoutXAxisAnchor, right: NSLayoutXAxisAnchor, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: top, constant: padding.top),
            leadingAnchor.constraint(equalTo: left, constant: padding.left),
            trailingAnchor.constraint(equalTo: right, constant: padding.right)
        ])
    }
    
    func anchorTopLeftRightHeight(top: NSLayoutYAxisAnchor, left: NSLayoutXAxisAnchor, right: NSLayoutXAxisAnchor, padding: UIEdgeInsets = .zero, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: top, constant: padding.top),
            leadingAnchor.constraint(equalTo: left, constant: padding.left),
            trailingAnchor.constraint(equalTo: right, constant: padding.right),
            heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    func anchorBottomLeftRight(bottom: NSLayoutYAxisAnchor, left: NSLayoutXAxisAnchor, right: NSLayoutXAxisAnchor, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom),
            leadingAnchor.constraint(equalTo: left, constant: padding.left),
            trailingAnchor.constraint(equalTo: right, constant: padding.right)
        ])
    }
    
    func anchorBottomLeftRightHeight(bottom: NSLayoutYAxisAnchor, left: NSLayoutXAxisAnchor, right: NSLayoutXAxisAnchor, padding: UIEdgeInsets = .zero, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom),
            leadingAnchor.constraint(equalTo: left, constant: padding.left),
            trailingAnchor.constraint(equalTo: right, constant: padding.right),
            heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    func anchorHeight(height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func anchorTopLeftWidthHeight(top: NSLayoutYAxisAnchor, leading: NSLayoutXAxisAnchor, width: CGFloat, height: CGFloat, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: top, constant: padding.top),
            leadingAnchor.constraint(equalTo: leading, constant: padding.left),
            heightAnchor.constraint(equalToConstant: height),
            widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
    func anchorTopRightWidthHeight(top: NSLayoutYAxisAnchor, trailing: NSLayoutXAxisAnchor, width: CGFloat, height: CGFloat, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: top, constant: padding.top),
            trailingAnchor.constraint(equalTo: trailing, constant: padding.right),
            heightAnchor.constraint(equalToConstant: height),
            widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
    func anchorBottomLeftWidthHeight(bottom: NSLayoutYAxisAnchor, leading: NSLayoutXAxisAnchor, width: CGFloat, height: CGFloat, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom),
            leadingAnchor.constraint(equalTo: leading, constant: padding.left),
            heightAnchor.constraint(equalToConstant: height),
            widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
    func anchorBottomRightWidthHeight(bottom: NSLayoutYAxisAnchor, right: NSLayoutXAxisAnchor, width: CGFloat, height: CGFloat, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom),
            trailingAnchor.constraint(equalTo: right, constant: padding.right),
            heightAnchor.constraint(equalToConstant: height),
            widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
    func anchorHorizontalVerticalCenter(leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
        }
        centerYAnchor.constraint(equalTo: centerY).isActive = true
    }
    
    func anchorSize(width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: width),
            heightAnchor.constraint(equalToConstant: height)
        ])
    }
}
