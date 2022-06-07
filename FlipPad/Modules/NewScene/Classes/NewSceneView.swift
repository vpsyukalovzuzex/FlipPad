//
// NewSceneView.swift
//

import UIKit
import Support
import DifferenceKit

class NewSceneView: UIViewController,
                    NewSceneViewProtocol,
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
    
    @IBOutlet private weak var fpsSlider: UISlider!
    
    @IBOutlet private weak var fpsLabel: UILabel!
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: -
    
    private var source = [Element]()
    
    // MARK: - NewSceneViewProtocol
    
    var presenter: NewSceneOutputViewProtocol?
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    // MARK: - NewSceneInputViewProtocol
    
    var selectedIndexPaths: [IndexPath]? {
        return collectionView.indexPathsForSelectedItems
    }
    
    // MARK: -
    
    func setFpsFloat(_ fpsFloat: Float) {
        fpsSlider.value = fpsFloat
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
    
    func setSelectIndexPaths(_ indexPaths: [IndexPath]?) {
        self.setSelectIndexPaths(indexPaths, animated: true)
    }
    
    func setSelectIndexPaths(_ indexPaths: [IndexPath]?, animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            guard let indexPaths = indexPaths else {
                self.selectedIndexPaths?.forEach { self.collectionView.deselectItem(at: $0, animated: animated) }
                return
            }
            indexPaths.forEach { self.collectionView.selectItem(at: $0, animated: animated, scrollPosition: .top) }
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
    
    @IBAction private func fpsSliderAction(_ sender: UISlider) {
        presenter?.didChangeFps(sender.value)
    }
    
    @IBAction private func continueButtonAction(_ sender: UIButton) {
        presenter?.didTapContinue()
    }
}
