//
// BrowserCollectionViewCell.swift
//

import UIKit
import Support

class BrowserCollectionViewCell: UICollectionViewCell {
    
    // MARK: -
    
    @IBOutlet private weak var selectView: UIView!
    
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: -
    
    override var isSelected: Bool {
        get {
            super.isSelected
        }
        set {
            super.isSelected = newValue
            selectView.isHidden = !newValue
        }
    }
    
    // MARK: -
    
    var thumbnail: UIImage? {
        get {
            return thumbnailImageView.image
        }
        set {
            thumbnailImageView.image = newValue
        }
    }
    
    var name: String? {
        get {
            return nameLabel.text
        }
        set {
            nameLabel.text = newValue
        }
    }
    
    // MARK: -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnail = nil
        name = nil
        stopAnimating()
        selectView.setCornerRadius(8.0)
        thumbnailImageView.setCornerRadius(6.0)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnail = nil
        name = nil
        stopAnimating()
    }
    
    // MARK: -
    
    func startAnimating() {
        activityIndicator.startAnimating()
    }
    
    func stopAnimating() {
        activityIndicator.stopAnimating()
    }
}
