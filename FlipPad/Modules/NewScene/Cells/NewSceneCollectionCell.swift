//
// NewSceneCollectionCell.swift
//

import UIKit
import Support

class NewSceneCollectionCell: UICollectionViewCell {
    
    // MARK: -
    
    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var selectView: UIView!
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    
    // MARK: -
    
    override var isSelected: Bool {
        get {
            return super.isSelected
        }
        set {
            super.isSelected = newValue
            selectView.isHidden = !newValue
        }
    }
    
    // MARK: -
    
    var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    // MARK: -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.setCornerRadius(2.0)
        selectView.setCornerRadius(2.0)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title = nil
    }
}
