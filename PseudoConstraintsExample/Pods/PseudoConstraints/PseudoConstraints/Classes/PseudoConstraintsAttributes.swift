//
//  PseudoConstraintsAttributes.swift
//  PseudoConstraints
//
//  Created by Zain on 01/07/2020.
//  Copyright © 2020 PseudoLabs. All rights reserved.
//

import Foundation
import UIKit

internal enum PseudoConstraintsAxis {
    case vertical
    case horizontal
    case dimensional
}

public enum PseudoConstraintsPoint {
    case left
    case right
    case top
    case bottom
    case safeAreaLeft
    case safeAreaRight
    case safeAreaTop
    case safeAreaBottom
    case centerX
    case centerY
    case height
    case width
}

extension PseudoConstraintsPoint {
    var axis: PseudoConstraintsAxis {
        switch self {
        case .left, .right, .centerX, .safeAreaLeft, .safeAreaRight:
            return .horizontal
        case .bottom, .top, .centerY, .safeAreaTop, .safeAreaBottom:
            return .vertical
        case .height, .width:
            return .dimensional
            
        }
    }
    
    var safeAreaPoint: PseudoConstraintsPoint {
        switch self {
        case .left, .safeAreaLeft:
            return .safeAreaLeft
        case .top, .safeAreaTop:
            return .safeAreaTop
        case .right, .safeAreaRight:
            return .safeAreaRight
        case .bottom, .safeAreaBottom:
            return .safeAreaBottom
        default:
            return self
        
        }
    }
}

public enum PsuedoConstraintsConstantModifier {
    case equalTo
    case lessThanOrEqualTo
    case greaterThanOrEqualTo
}

internal extension UIView {
    func horizontalAnchor(_ edge: PseudoConstraintsPoint) -> NSLayoutXAxisAnchor {
        switch edge {
        case .left:
            return leadingAnchor
        case .right:
            return trailingAnchor
        case .centerX:
            return centerXAnchor
        case .safeAreaLeft:
            return safeAreaLayoutGuide.leadingAnchor
        case .safeAreaRight:
            return safeAreaLayoutGuide.trailingAnchor
        default:
            return leadingAnchor
        }
    }
    
    func verticalAnchor(_ edge: PseudoConstraintsPoint) -> NSLayoutYAxisAnchor {
        switch edge {
        case .top:
            return topAnchor
        case .bottom:
            return bottomAnchor
        case .centerY:
            return centerYAnchor
        case .safeAreaTop:
            return safeAreaLayoutGuide.topAnchor
        case .safeAreaBottom:
            return safeAreaLayoutGuide.bottomAnchor
        default:
            return topAnchor
        }
    }
    
    func dimensionAnchor(_ edge: PseudoConstraintsPoint) -> NSLayoutDimension {
        switch edge {
        case .width:
            return widthAnchor
        case .height:
            return heightAnchor
        default:
            return widthAnchor
        }
    }
}
