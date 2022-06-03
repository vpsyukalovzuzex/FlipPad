//
// ColorSelectionView.swift
//

import UIKit
import Support

class ColorSelectionView: UIViewController,
                          ColorSelectionViewProtocol,
                          ColorSelectionInputViewProtocol {
    
    // MARK: -
    
    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet private weak var opacityLabel: UILabel!
    
    @IBOutlet private weak var slider: UISlider!
    
    @IBOutlet private weak var colorView: UIView!
    
    // MARK: -
    
    private var viewController: UIViewController?
    
    // MARK: - ColorSelectionViewProtocol
    
    var presenter: ColorSelectionOutputViewProtocol?
    
    // MARK: - ColorSelectionInputViewProtocol
    
    var opacity: Float {
        return slider.value
    }
    
    // MARK: -
    
    func setColor(_ color: UIColor) {
        colorView.backgroundColor = color
    }
    
    func setOpacity(_ opacity: Float) {
        slider.value = opacity
        let backgroundColor = colorView.backgroundColor
        colorView.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(opacity))
    }
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = presenter?.palleteName
        opacityLabel.text = "Opacity:".localized
        colorView.setStroke()
        colorView.setCornerRadius(0.5 * colorView.frame.height)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "New color",
            style: .plain,
            target: self,
            action: #selector(newColorBarButtonItemAction(_:))
        )
        guard
            let palleteName = presenter?.palleteName,
            let viewController = ColorsRouter.create(palleteName: palleteName, delegate: presenter).viewController
        else {
            return
        }
        containerView.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        self.viewController = viewController
        presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewController?.view.frame = containerView.bounds
    }
    
    @IBAction private func sliderAction(_ sender: UISlider) {
        presenter?.didChangeOpacity()
    }
    
    // MARK: -
    
    @objc private func newColorBarButtonItemAction(_ sender: UIBarButtonItem) {
        presenter?.didTapNewColor()
    }
}
