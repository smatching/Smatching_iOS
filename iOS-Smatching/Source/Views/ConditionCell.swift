//
//  ConditionCellTableViewCell.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 31..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import UIKit

class ConditionCell: UITableViewCell {
    enum CellState {
        case collapsed
        case expanded
        
        var carretImage: UIImage {
            switch self {
            case .collapsed:
                return #imageLiteral(resourceName: "expand")
            case .expanded:
                return #imageLiteral(resourceName: "collapse")
            }
        }
    }
    
    @IBOutlet weak var carret: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    private let expandedViewIndex: Int = 1
    
    var state: CellState = .collapsed {
        didSet {
            toggle()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 5.0
    }

    
    private func toggle() {
        stackView.arrangedSubviews[expandedViewIndex].isHidden = stateIsCollapsed()
        carret.image = state.carretImage
    }
    
    private func stateIsCollapsed() -> Bool {
        return state == .collapsed
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
