//
// UICollectionViewProtocol.swift
//

import UIKit

public protocol UICollectionViewProtocol: UIViewController {
    
    var collectionView: UICollectionView! { get }
    
    // MARK: -
    
    var selectedIndexPaths: [IndexPath]? { get }
    
    // MARK: -
    
    func setSelectIndexPaths(_ indexPaths: [IndexPath]?)
    func setSelectIndexPaths(_ indexPaths: [IndexPath]?, animated: Bool)
}

// MARK: -

extension UICollectionViewProtocol {
    
    // MARK: -
    
    var selectedIndexPaths: [IndexPath]? {
        return collectionView.indexPathsForSelectedItems
    }
    
    // MARK: -
    
    func setSelectIndexPaths(_ indexPaths: [IndexPath]?) {
        self.setSelectIndexPaths(indexPaths, animated: true)
    }
    
    func setSelectIndexPaths(_ indexPaths: [IndexPath]?, animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) { [weak self] in
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
}
