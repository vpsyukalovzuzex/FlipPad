//
// PalletesView.swift
//

import UIKit
import DifferenceKit

class PalletesView: UIViewController,
                    PalletesViewProtocol,
                    PalletesInputViewProtocol,
                    UICollectionViewDataSource,
                    UICollectionViewDelegate,
                    UICollectionViewDelegateFlowLayout {
    
    // MARK: -
    
    struct Action: OptionSet {
        
        // MARK: -
        
        static var edit: Action {
            return Action(rawValue: 1 << 0)
        }
        
        static var newPallete: Action {
            return Action(rawValue: 1 << 1)
        }
        
        static var done: Action {
            return Action(rawValue: 1 << 2)
        }
        
        static var delete: Action {
            return Action(rawValue: 1 << 3)
        }
        
        static var rename: Action {
            return Action(rawValue: 1 << 4)
        }
        
        static var `default`: Action {
            return [
                .edit,
                .newPallete
            ]
        }
        
        static var editing: Action {
            return [
                .done,
                .delete,
                .rename
            ]
        }
        
        // MARK: -
        
        let rawValue: Int
    }
    
    // MARK: -
    
    struct Element: Differentiable {
        
        // MARK: -
        
        var palleteName: String?
        
        // MARK: - Differentiable
        
        var differenceIdentifier: String? {
            return palleteName
        }
        
        func isContentEqual(to source: PalletesView.Element) -> Bool {
            return palleteName == source.palleteName
        }
    }
    
    // MARK: - UICollectionViewProtocol
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: -
    
    private var source = [Element]()
    
    // MARK: - PalletesViewProtocol
    
    var presenter: PalletesOutputViewProtocol?
    
    // MARK: - PalletesInputViewProtocol
    
    var action = Action.default
    
    // MARK: -
    
    func setAction(_ action: PalletesView.Action) {
        setAction(action, animated: true)
    }
    
    func setAction(_ action: PalletesView.Action, animated: Bool) {
        self.action = action
        reload(animated: animated)
    }
    
    func setNewSource(_ newSource: [PalletesView.Element]) {
        let stagedChangeset = StagedChangeset(source: source, target: newSource)
        collectionView.reload(using: stagedChangeset) { [weak self] source in
            self?.source = source
        }
    }
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Palletes".localized
        presenter?.viewDidLoad()
    }
    
    // MARK: -
    
    private func reload(animated: Bool = true) {
        var leftBarButtonItems = [UIBarButtonItem]()
        var rightBarButtonItems = [UIBarButtonItem]()
        if action.contains(.edit) {
            leftBarButtonItems.append(
                UIBarButtonItem(
                    title: "Edit".localized,
                    style: .plain,
                    target: self,
                    action: #selector(editBarButtonItemAction(_:))
                )
            )
        }
        if action.contains(.newPallete) {
            rightBarButtonItems.append(
                UIBarButtonItem(
                    title: "New pallete".localized,
                    style: .plain,
                    target: self,
                    action: #selector(newPalleteBarButtonItemAction(_:))
                )
            )
        }
        if action.contains(.done) {
            leftBarButtonItems.append(
                UIBarButtonItem(
                    title: "Done".localized,
                    style: .done,
                    target: self,
                    action: #selector(doneBarButtonItemAction(_:))
                )
            )
        }
        if action.contains(.delete) {
            rightBarButtonItems.append(
                UIBarButtonItem(
                    title: "Delete".localized,
                    style: .plain,
                    target: self,
                    action: #selector(deleteBarButtonItemAction(_:))
                )
            )
        }
        if action.contains(.rename) {
            rightBarButtonItems.append(
                UIBarButtonItem(
                    title: "Rename".localized,
                    style: .plain,
                    target: self,
                    action: #selector(renameBarButtonItemAction(_:))
                )
            )
        }
        navigationItem.setLeftBarButtonItems(leftBarButtonItems, animated: animated)
        navigationItem.setRightBarButtonItems(rightBarButtonItems, animated: animated)
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = String(describing: PalletesCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PalletesCollectionViewCell
        if let element = source[safe: indexPath.row] {
            cell.palleteName = element.palleteName
        }
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didTapPallete()
    }
    
    // MARK: -
    
    @objc private func editBarButtonItemAction(_ sender: UIBarButtonItem) {
        presenter?.didTapEdit()
    }
    
    @objc private func newPalleteBarButtonItemAction(_ sender: UIBarButtonItem) {
        presenter?.didTapNewPallete()
    }
    
    @objc private func doneBarButtonItemAction(_ sender: UIBarButtonItem) {
        presenter?.didTapDone()
    }
    
    @objc private func deleteBarButtonItemAction(_ sender: UIBarButtonItem) {
        presenter?.didTapDelete()
    }
    
    @objc private func renameBarButtonItemAction(_ sender: UIBarButtonItem) {
        presenter?.didTapRename()
    }
}
