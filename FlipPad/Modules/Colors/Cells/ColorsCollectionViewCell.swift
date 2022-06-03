//
// ColorsCollectionViewCell.swift
//

import UIKit

class ColorsCollectionViewCell: UICollectionViewCell {
    
    // MARK: -
    
    @IBOutlet private weak var colorView: UIView!
    
    // MARK: -
    
    private var strokeLayer = CALayer()
    
    // MARK: -
    
    var color: UIColor? {
        get {
            return colorView.backgroundColor
        }
        set {
            colorView.backgroundColor = newValue
        }
    }
    
    // MARK: -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        strokeLayer.borderColor = UIColor.lightGray.cgColor
        strokeLayer.borderWidth = 0.5
        colorView.layer.addSublayer(strokeLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        strokeLayer.frame = bounds
    }
}
