//
// ColorsView.swift
//

import UIKit
import DifferenceKit

class ColorsView: UIViewController,
                  ColorsViewProtocol,
                  ColorsInputViewProtocol,
                  UICollectionViewDataSource,
                  UICollectionViewDelegate,
                  UICollectionViewDelegateFlowLayout {
    
    // MARK: -
    
    struct Element: Differentiable {
        
        // MARK: -
        
        var r: Int
        var g: Int
        var b: Int
        
        var color: UIColor {
            return UIColor(
                red: CGFloat(r) / 255.0,
                green: CGFloat(g) / 255.0,
                blue: CGFloat(b) / 255.0,
                alpha: 1.0
            )
        }
        
        // MARK: -
        
        var differenceIdentifier: Int {
            var hasher = Hasher()
            hasher.combine(r)
            hasher.combine(g)
            hasher.combine(b)
            return hasher.finalize()
        }
        
        func isContentEqual(to source: ColorsView.Element) -> Bool {
            return r == source.r && g == source.g && b == source.b
        }
    }
    
    // MARK: - UICollectionViewProtocol
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: -
    
    private var source = [Element]()
    
    // MARK: - ColorsViewProtocol
    
    var presenter: ColorsOutputViewProtocol?
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    // MARK: - ColorsInputViewProtocol
    
    func setNewSource(_ newSource: [ColorsView.Element]) {
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
        let reuseIdentifier = String(describing: ColorsCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ColorsCollectionViewCell
        if let element = source[safe: indexPath.row] {
            cell.color = element.color
        }
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectColor()
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width / 8.0
        return CGSize(
            width: size,
            height: size
        )
    }
}
