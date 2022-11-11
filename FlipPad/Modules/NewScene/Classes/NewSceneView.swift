//
// NewSceneView.swift
//

import UIKit
import Support
import DifferenceKit

class NewSceneView: UIViewController,
                    NewSceneInputViewProtocol,
                    UICollectionViewDataSource,
                    UICollectionViewDelegate {
    
    // MARK: -
    
    struct Element: Differentiable {
        
        // MARK: -
        
        var title: String?
        
        // MARK: - Differentiable
        
        var differenceIdentifier: String? {
            return title
        }
        
        func isContentEqual(to source: NewSceneView.Element) -> Bool {
            return title == source.title
        }
    }
    
    // MARK: -
    
    @IBOutlet private weak var playbackSpeedLabel: UILabel!
    @IBOutlet private weak var resolutionsLabel: UILabel!
    @IBOutlet private weak var fpsLabel: UILabel!
    
    @IBOutlet private weak var fpsSlider: UISlider!
        
    @IBOutlet private weak var continueButton: UIButton!
    
    // MARK: - UICollectionViewProtocol
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: -
    
    private var source = [Element]()
    
    private var isContinue = false
    
    // MARK: - NewSceneViewProtocol
    
    var presenter: NewSceneOutputViewProtocol?
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localize()
        presenter?.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isContinue {
            presenter?.didTapContinue()
        }
    }
    
    // MARK: - NewSceneInputViewProtocol
    
    func setFpsFloat(_ fpsFloat: Float) {
        fpsSlider.value = fpsFloat
    }
    
    func setMinFpsFloat(_ minFps: Float) {
        fpsSlider.minimumValue = minFps
    }
    
    func setMaxFpsFloat(_ maxFps: Float) {
        fpsSlider.maximumValue = maxFps
    }
    
    func setFpsString(_ fpsString: String?) {
        fpsLabel.text = fpsString
    }
    
    func setNewSource(_ newSource: [Element]) {
        let stagedChangeset = StagedChangeset(source: source, target: newSource)
        collectionView.reload(using: stagedChangeset) { [weak self] source in
            self?.source = source
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = String(describing: NewSceneCollectionCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewSceneCollectionCell
        if let element = source[safe: indexPath.row] {
            cell.title = element.title
        }
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didTapResolution(at: indexPath)
    }
    
    // MARK: -
    
    private func localize() {
        title = "New scene".localized
        playbackSpeedLabel.text = "Playback speed:".localized
        resolutionsLabel.text = "Resolutions:".localized
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Cancel".localized,
            style: .plain,
            target: self,
            action: #selector(cancelBarButtonItemAction(_:))
        )
        continueButton.setTitle("Continue".localized, for: .normal)
    }
    
    // MARK: -
    
    @objc private func cancelBarButtonItemAction(_ sender: UIBarButtonItem) {
        presenter?.didTapCancel()
    }
    
    // MARK: -
    
    @IBAction private func fpsSliderAction(_ sender: UISlider) {
        presenter?.didChangeFps(sender.value)
    }
    
    @IBAction private func continueButtonAction(_ sender: UIButton) {
        isContinue = true
        dismiss(animated: true)
    }
}
