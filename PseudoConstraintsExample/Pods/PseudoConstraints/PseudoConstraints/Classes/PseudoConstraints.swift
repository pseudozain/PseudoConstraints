//
//  PseudoConstraints.swift
//  PseudoConstraints
//
//  Created by Zain on 01/07/2020.
//  Copyright © 2020 PseudoLabs. All rights reserved.
//

import Foundation
import UIKit

// MARK: All edges constraints

public extension UIView {
    
    /// Aliges edges of a view with same edges of provided view
    ///
    /// - Parameters:
    ///   - edges: Array of `PseudoConstraintsPoint` as edges of view to align
    ///   - view: View of  type `UIView` with which edges will be aligned
    ///   - constantModifier: A `PsuedoConstraintsConstantModifier` constant modifier to make constraints
    ///   - constant: A `CGFloat` offset between constraints
    ///   - Priorioriy: A `NSLayoutPriority` for all proivded constraints
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func alignEdges(_ edges: [PseudoConstraintsPoint], withView view: UIView, _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        
        for edge in edges {
            _ = alignEdge(edge, withView: view, constantModifier, constant: constant, priority: priority)
        }
        
        return self
    }
    
    /// Aliges edges of a view with same edges of provided view
    ///
    /// - Parameters:
    ///   - edges: Array of `PseudoConstraintsPoint` as edges of view to align
    ///   - view: View of  type `UIView` with which edges will be aligned
    ///   - constantModifier: A `PsuedoConstraintsConstantModifier` constant modifier to make constraints
    ///   - constants: An array of `CGFloat` offsets between constraints
    ///   - Priorioriy: A `NSLayoutPriority` for all proivded constraints
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func alignEdges(_ edges: [PseudoConstraintsPoint], withView view: UIView, _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, constants: [CGFloat], priority: UILayoutPriority = .required) -> UIView {
        
        for edge in edges {
            _ = alignEdge(edge, withView: view, constantModifier, constant: constants[edges.firstIndex(of: edge) ?? 0], priority: priority)
        }
        
        return self
    }
}

// MARK: Dimension constraints

public extension UIView {
    
    /// Sets constraints for `width` of view with a constant
    ///
    /// - Parameters:
    ///   - constantModifier: A `PsuedoConstraintsConstantModifier` constant modifier to make constraints
    ///   - constant: A `CGFloat` offset between constraints
    ///   - Priorioriy: A `NSLayoutPriority` for all proivded constraints
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func width(_ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, constant: CGFloat, priority: UILayoutPriority = .required) -> UIView {
        
        let constraint: NSLayoutConstraint
        
        switch constantModifier {
        case .equalTo:
            constraint = widthAnchor.constraint(equalToConstant: constant)
        case .greaterThanOrEqualTo:
            constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
        case .lessThanOrEqualTo:
            constraint = widthAnchor.constraint(lessThanOrEqualToConstant: constant)
        }
        
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    /// Sets constraints for `height` of view with a constant
    ///
    /// - Parameters:
    ///   - constantModifier: A `PsuedoConstraintsConstantModifier` constant modifier to make constraints
    ///   - constant: A `CGFloat` offset between constraints
    ///   - Priorioriy: A `NSLayoutPriority` for all proivded constraints
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func height(_ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, constant: CGFloat, priority: UILayoutPriority = .required) -> UIView {
        
        let constraint: NSLayoutConstraint
        
        switch constantModifier {
        case .equalTo:
            constraint = heightAnchor.constraint(equalToConstant: constant)
        case .greaterThanOrEqualTo:
            constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
        case .lessThanOrEqualTo:
            constraint = heightAnchor.constraint(lessThanOrEqualToConstant: constant)
        }
        
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
    
    /// Sets constraints for `height` of view with dimension of another view
    ///
    /// - Parameters:
    ///   - point: A `PseudoConstraintsPoint` to align views width with
    ///   - constantModifier: A `PsuedoConstraintsConstantModifier` constant modifier to make constraints
    ///   - constant: A `CGFloat` offset between constraints
    ///   - Priorioriy: A `NSLayoutPriority` for all proivded constraints
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func height(with point: PseudoConstraintsPoint, _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, ofView view: UIView, multiplier: CGFloat = 1.0, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        
        return pinDimensionEdge(.height, toEdge: point, ofView: view, constantModifier, mutliplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Sets constraints for `width` of view with dimension of another view
    ///
    /// - Parameters:
    ///   - point: A `PseudoConstraintsPoint` to align views width with
    ///   - constantModifier: A `PsuedoConstraintsConstantModifier` constant modifier to make constraints
    ///   - constant: A `CGFloat` offset between constraints
    ///   - Priorioriy: A `NSLayoutPriority` for all proivded constraints
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func width(with point: PseudoConstraintsPoint, _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, ofView view: UIView, multiplier: CGFloat = 1.0, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        
        return pinDimensionEdge(.width, toEdge: point, ofView: view, constantModifier, mutliplier: multiplier, constant: constant, priority: priority)
    }
}

// MARK: Constraints with superview

public extension UIView {
    
    /// Centers a view in its superview. i.e. Aligns `CenterX` and `CenterY` of view with its superview.
    ///
    /// - Parameters:
    ///   - Priorioriy: A `NSLayoutPriority` center a view in its superview
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func centerInSuperView(priority: UILayoutPriority = .required) -> UIView {
        guard let superview = superview else { return self }
        return alignCenterWith(superview)
    }
    
    /// Centers a view horizontally in its superview. i.e. Aligns `CenterX`  of view with its superview.
    ///
    /// - Parameters:
    ///   - Priorioriy: A `NSLayoutPriority` center a view in its superview
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func centerHorizontallyInSuperview(priority: UILayoutPriority = .required) -> UIView {
        guard let superview = superview else { return self }
        return horizontallyCenteredWith(superview)
    }
    
    /// Centers a view vertically in its superview. i.e. Aligns `CenterY`  of view with its superview.
    ///
    /// - Parameters:
    ///   - Priorioriy: A `NSLayoutPriority` center a view in its superview
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func centerVerticallyInSuperview(priority: UILayoutPriority = .required) -> UIView {
        guard let superview = superview else { return self }
        return verticallyCenteredWith(superview)
    }
    
    /// Aliges edge of a view with same edge of its superview
    ///
    /// - Parameters:
    ///   - edge: A `PseudoConstraintsPoint` as edges of view to align
    ///   - constantModifier: A `PsuedoConstraintsConstantModifier` constant modifier to make constraints
    ///   - constant: A `CGFloat` offset between constraints
    ///   - Priorioriy: A `NSLayoutPriority` for all proivded constraints
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func alignEdgeWithSuperview(_ edge: PseudoConstraintsPoint, _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        guard let superview = superview else { return self }
        return alignEdge(edge, withView: superview, constantModifier, constant: constant, priority: priority)
    }
    
    /// Aliges edge of a view with same edge of its superview's safe area
    ///
    /// - Parameters:
    ///   - edge: A `PseudoConstraintsPoint` as edges of view to align
    ///   - constantModifier: A `PsuedoConstraintsConstantModifier` constant modifier to make constraints
    ///   - constant: A `CGFloat` offset between constraints
    ///   - Priorioriy: A `NSLayoutPriority` for all proivded constraints
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func alignEdgeWithSuperviewSafeArea(_ edge: PseudoConstraintsPoint, _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        guard let superview = superview else { return self }
        return pinEdge(edge, toEdge: edge.safeAreaPoint, ofView: superview, constantModifier, constant: constant, priority: priority)
    }
    
    /// Aliges all edges of a view with all edges of its superview
    ///
    /// - Parameters:
    ///   - constantModifier: A `PsuedoConstraintsConstantModifier` constant modifier to make constraints
    ///   - edgeInsets: A `UIEdgeInsets` offset between all constraints
    ///   - Priorioriy: A `NSLayoutPriority` for all proivded constraints
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func alignAllEdgesWithSuperview(_ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, edgeInsets: UIEdgeInsets = .zero, priority: UILayoutPriority = .required) -> UIView {
        return alignEdgeWithSuperview(.left, constantModifier, constant: edgeInsets.left, priority: priority)
            .alignEdgeWithSuperview(.top, constantModifier, constant: edgeInsets.top, priority: priority)
            .alignEdgeWithSuperview(.right, constantModifier, constant: edgeInsets.right, priority: priority)
            .alignEdgeWithSuperview(.bottom, constantModifier, constant: edgeInsets.bottom, priority: priority)
    }
    
    /// Aliges edges of a view with same edges of its superview
    ///
    /// - Parameters:
    ///   - edges: Array of`PseudoConstraintsPoint` as edges of view to align
    ///   - constantModifier: A `PsuedoConstraintsConstantModifier` constant modifier to make constraints
    ///   - constants: Array of `CGFloat` offset between constraints
    ///   - Priorioriy: A `NSLayoutPriority` for all proivded constraints
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func alignEdgesWithSuperview(_ edges: [PseudoConstraintsPoint], _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, constants: [CGFloat], priority: UILayoutPriority = .required) -> UIView {
        guard let superview = superview else { return self }
        
        return alignEdges(edges, withView: superview, constantModifier, constants: constants, priority: priority)
    }
    
    /// Aliges edges of a view with same edges of its superview
    ///
    /// - Parameters:
    ///   - edges: Array of`PseudoConstraintsPoint` as edges of view to align
    ///   - constantModifier: A `PsuedoConstraintsConstantModifier` constant modifier to make constraints
    ///   - constant: A `CGFloat` offset between constraints
    ///   - Priorioriy: A `NSLayoutPriority` for all proivded constraints
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func alignEdgesWithSuperview(_ edges: [PseudoConstraintsPoint], _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        guard let superview = superview else { return self }
        
        return alignEdges(edges, withView: superview, constantModifier, constant: constant, priority: priority)
    }
}

public extension UIView {
    
    /// Aliges a view to left of another view
    ///
    /// - Parameters:
    ///   - view: A `UIView` with which view will be aligned to left
    ///   - constantModifier: A `PsuedoConstraintsConstantModifier` constant modifier to make constraints
    ///   - constant: A `CGFloat` offset between constraints
    ///   - Priorioriy: A `NSLayoutPriority` for all proivded constraints
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func toLeftOf(_ view: UIView, _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        return pinEdge(.right, toEdge: .left, ofView: view, constantModifier, constant: constant, priority: priority)
    }
    
    /// Aliges a view to right of another view
    ///
    /// - Parameters:
    ///   - view: A `UIView` with which view will be aligned to right
    ///   - constantModifier: A `PsuedoConstraintsConstantModifier` constant modifier to make constraints
    ///   - constant: A `CGFloat` offset between constraints
    ///   - Priorioriy: A `NSLayoutPriority` for all proivded constraints
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func toRightOf(_ view: UIView, _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        return pinEdge(.left, toEdge: .right, ofView: view, constant: constant, priority: priority)
    }
    
    /// Aliges a view to top of another view
    ///
    /// - Parameters:
    ///   - view: A `UIView` with which view will be aligned to top
    ///   - constantModifier: A `PsuedoConstraintsConstantModifier` constant modifier to make constraints
    ///   - constant: A `CGFloat` offset between constraints
    ///   - Priorioriy: A `NSLayoutPriority` for all proivded constraints
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func above(_ view: UIView, _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        return pinEdge(.bottom, toEdge: .top, ofView: view, constantModifier, constant: constant, priority: priority)
    }
    
    /// Aliges a view to bottom of another view
    ///
    /// - Parameters:
    ///   - view: A `UIView` with which view will be aligned to bottom
    ///   - constantModifier: A `PsuedoConstraintsConstantModifier` constant modifier to make constraints
    ///   - constant: A `CGFloat` offset between constraints
    ///   - Priorioriy: A `NSLayoutPriority` for all proivded constraints
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func below(_ view: UIView, _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        return pinEdge(.top, toEdge: .bottom, ofView: view, constantModifier, constant: constant, priority: priority)
    }
    
    /// Aliges center of a view with center of another view
    ///
    /// - Parameters:
    ///   - view: A `UIView` to align center with
    ///   - Priorioriy: A `NSLayoutPriority` for all proivded constraints
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func alignCenterWith(_ view: UIView, priority: UILayoutPriority = .required) -> UIView {
        return horizontallyCenteredWith(view, priority: priority).verticallyCenteredWith(view, priority: priority)
    }
    
    /// Aliges `CenterX` of a view with `CenterX` of another view
    ///
    /// - Parameters:
    ///   - view: A `UIView` to align `CenterX` with
    ///   - constantModifier: A `PsuedoConstraintsConstantModifier` constant modifier to make constraints
    ///   - constant: A `CGFloat` offset between constraints
    ///   - Priorioriy: A `NSLayoutPriority` for all proivded constraints
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func horizontallyCenteredWith(_ view: UIView, _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        return pinEdge(.centerX, toEdge: .centerX, ofView: view, constantModifier, constant: constant, priority: priority)
    }
    
    /// Aliges `CenterY` of a view with `CenterY` of another view
    ///
    /// - Parameters:
    ///   - view: A `UIView` to align `CenterX` with
    ///   - constantModifier: A `PsuedoConstraintsConstantModifier` constant modifier to make constraints
    ///   - constant: A `CGFloat` offset between constraints
    ///   - Priorioriy: A `NSLayoutPriority` for all proivded constraints
    ///
    /// - Returns:
    ///   - `UIView`: Same `UIVIew` on which constraints were applied
    ///
    @discardableResult func verticallyCenteredWith(_ view: UIView, _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        return pinEdge(.centerY, toEdge: .centerY, ofView: view, constantModifier, constant: constant, priority: priority)
    }
    
    @discardableResult func alignEdge(_ edge: PseudoConstraintsPoint, withView view: UIView, _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, constant: CGFloat = 0, priority: UILayoutPriority = .required ) -> UIView {
        return pinEdge(edge, toEdge: edge, ofView: view, constantModifier, constant: constant, priority: priority)
    }
    
    @discardableResult func pinEdge(_ edge1: PseudoConstraintsPoint, toEdge edge2: PseudoConstraintsPoint, ofView view: UIView, _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        
        if edge1.axis != edge2.axis {
            assertionFailure("PseudoConstraint Error: all edges of same constraint must be of same axis")
        }
        
        switch edge1.axis {
        case .horizontal:
            return pinHorizontalEdge(edge1, toEdge: edge2, ofView: view, constantModifier, constant: constant, priority: priority)
        case .vertical:
            return pinVerticalEdge(edge1, toEdge: edge2, ofView: view, constantModifier, constant: constant, priority: priority)
        case .dimensional:
            return pinDimensionEdge(edge1, toEdge: edge2, ofView: view, constantModifier, constant: constant, priority: priority)
        }
    }
}

// MARK: Private @discardableResult functions

private extension UIView {
    @discardableResult func pinHorizontalEdge(_ edge1: PseudoConstraintsPoint, toEdge edge2: PseudoConstraintsPoint, ofView view: UIView, _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        
        let constraint: NSLayoutConstraint
        
        if edge1 != .right && edge1 != .safeAreaRight {
            switch constantModifier {
            case .equalTo:
                constraint = horizontalAnchor(edge1).constraint(equalTo: view.horizontalAnchor(edge2), constant: constant)
            case .greaterThanOrEqualTo:
                constraint = horizontalAnchor(edge1).constraint(greaterThanOrEqualTo: view.horizontalAnchor(edge2), constant: constant)
            case .lessThanOrEqualTo:
                constraint = horizontalAnchor(edge1).constraint(lessThanOrEqualTo: view.horizontalAnchor(edge2), constant: constant)
            }
        } else {
            switch constantModifier {
            case .equalTo:
                constraint = view.horizontalAnchor(edge2).constraint(equalTo: horizontalAnchor(edge1), constant: constant)
            case .greaterThanOrEqualTo:
                constraint = view.horizontalAnchor(edge2).constraint(greaterThanOrEqualTo: horizontalAnchor(edge1), constant: constant)
            case .lessThanOrEqualTo:
                constraint = view.horizontalAnchor(edge2).constraint(lessThanOrEqualTo: horizontalAnchor(edge1), constant: constant)
            }
        }
        
        constraint.priority = priority
        constraint.isActive = true
        
        return self
    }
    
    @discardableResult func pinVerticalEdge(_ edge1: PseudoConstraintsPoint, toEdge edge2: PseudoConstraintsPoint, ofView view: UIView, _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        
        let constraint: NSLayoutConstraint
        
        if edge1 != .bottom && edge1 != .safeAreaBottom {
            switch constantModifier {
            case .equalTo:
                constraint = verticalAnchor(edge1).constraint(equalTo: view.verticalAnchor(edge2), constant: constant)
            case .greaterThanOrEqualTo:
                constraint = verticalAnchor(edge1).constraint(greaterThanOrEqualTo: view.verticalAnchor(edge2), constant: constant)
            case .lessThanOrEqualTo:
                constraint = verticalAnchor(edge1).constraint(lessThanOrEqualTo: view.verticalAnchor(edge2), constant: constant)
            }
        } else {
            switch constantModifier {
            case .equalTo:
                constraint = view.verticalAnchor(edge2).constraint(equalTo: verticalAnchor(edge1), constant: constant)
            case .greaterThanOrEqualTo:
                constraint = view.verticalAnchor(edge2).constraint(greaterThanOrEqualTo: verticalAnchor(edge1), constant: constant)
            case .lessThanOrEqualTo:
                constraint = view.verticalAnchor(edge2).constraint(lessThanOrEqualTo: verticalAnchor(edge1), constant: constant)
            }
        }
        
        constraint.priority = priority
        constraint.isActive = true
        
        return self
    }
    
    @discardableResult func pinDimensionEdge(_ edge1: PseudoConstraintsPoint, toEdge edge2: PseudoConstraintsPoint, ofView view: UIView, _ constantModifier: PsuedoConstraintsConstantModifier = .equalTo, mutliplier: CGFloat = 1, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> UIView {
        
        let constraint: NSLayoutConstraint
        
        switch constantModifier {
        case .equalTo:
            constraint = dimensionAnchor(edge1).constraint(equalTo: view.dimensionAnchor(edge2), multiplier: mutliplier, constant: constant)
        case .greaterThanOrEqualTo:
            constraint = dimensionAnchor(edge1).constraint(greaterThanOrEqualTo: view.dimensionAnchor(edge2), multiplier: mutliplier, constant: constant)
        case .lessThanOrEqualTo:
            constraint = dimensionAnchor(edge1).constraint(lessThanOrEqualTo: view.dimensionAnchor(edge2), multiplier: mutliplier, constant: constant)
        }
        
        constraint.priority = priority
        constraint.isActive = true
        
        return self
    }
    
}

