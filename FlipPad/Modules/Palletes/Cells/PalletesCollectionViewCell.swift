//
// PalletesCollectionViewCell.swift
//

import UIKit
import Support

class PalletesCollectionViewCell: UICollectionViewCell {
    
    // MARK: -
    
    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet private weak var selectView: UIView!
    
    @IBOutlet private weak var nameLabel: UILabel!
    
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
    
    var palleteName: String? {
        didSet {
            update()
        }
    }
    
    // MARK: -
    
    private var viewController: UIViewController?
    
    // MARK: -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        isSelected = false
        selectView.setCornerRadius(2.0)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        isSelected = false
        palleteName = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = bounds.width
        viewController?.view.frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: size,
            height: size
        )
    }
    
    // MARK: -
    
    private func update() {
        viewController?.view.removeFromSuperview()
        nameLabel.text = palleteName
        guard
            let palleteName = palleteName,
            let viewController = ColorsRouter.create(palleteName: palleteName, delegate: nil).viewController
        else {
            return
        }
        containerView.addSubview(viewController.view)
        self.viewController = viewController
    }
}
