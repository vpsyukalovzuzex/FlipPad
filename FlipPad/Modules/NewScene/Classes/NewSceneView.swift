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
    
    private var elements = [Element]()
    
    // MARK: - NewSceneViewProtocol
    
    var presenter: NewSceneOutputViewProtocol?
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    // MARK: - NewSceneInputViewProtocol
    
    var fps: Int {
        get {
            return Int(fpsSlider.value)
        }
        set {
            fpsSlider.value = Float(newValue)
            fpsLabel.text = "\(newValue)"
        }
    }
    
    var selectedIndexPaths: [IndexPath]? {
        return collectionView.indexPathsForSelectedItems
    }
    
    var source: [NewSceneView.Element] {
        get {
            return elements
        }
        set {
            let stagedChangeset = StagedChangeset(source: elements, target: newValue)
            collectionView.reload(using: stagedChangeset) { [weak self] elements in
                self?.elements = elements
            }
        }
    }
    
    // MARK: -
    
    func selectIndexPath(_ indexPath: IndexPath) {
        selectIndexPath(indexPath, animated: true)
    }
    
    func selectIndexPath(_ indexPath: IndexPath, animated: Bool) {
        collectionView.selectItem(at: indexPath, animated: animated, scrollPosition: .top)
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return elements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = String(describing: NewSceneCollectionCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewSceneCollectionCell
        if let element = elements[safe: indexPath.row] {
            cell.title = element.title
        }
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectResolution()
    }
    
    // MARK: -
    
    @IBAction private func fpsSliderAction(_ sender: UISlider) {
        presenter?.didChangeFps()
    }
    
    @IBAction private func continueButtonAction(_ sender: UIButton) {
        presenter?.didSelectContinue()
    }
}
