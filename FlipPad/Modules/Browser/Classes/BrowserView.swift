//
// BrowserView.swift
//

import UIKit

class BrowserView: UIViewController,
                   BrowserViewProtocol,
                   BrowserInputViewProtocol {
    
    private struct Action: OptionSet {
        
        // MARK: -
        
        static var newScene: Action {
            return Action(rawValue: 1 << 0)
        }
        
        static var `import`: Action {
            return Action(rawValue: 1 << 1)
        }
        
        static var rename: Action {
            return Action(rawValue: 1 << 2)
        }
        
        static var duplicate: Action {
            return Action(rawValue: 1 << 3)
        }
        
        static var delete: Action {
            return Action(rawValue: 1 << 4)
        }
        
        static var export: Action {
            return Action(rawValue: 1 << 5)
        }
        
        static var select: Action {
            return Action(rawValue: 1 << 6)
        }
        
        static var done: Action {
            return Action(rawValue: 1 << 7)
        }
        
        static var `default`: Action {
            return [
                .newScene,
                .import,
                .select
            ]
        }
        
        static var selection: Action {
            return [
                .rename,
                .duplicate,
                .delete,
                .export,
                .done
            ]
        }
        
        // MARK: -
        
        let rawValue: Int
    }
    
    // MARK: -
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    @IBOutlet private weak var leftStackView: UIStackView!
    @IBOutlet private weak var rightStackView: UIStackView!
    
    @IBOutlet private weak var newSceneButton: UIButton!
    @IBOutlet private weak var importButton: UIButton!
    @IBOutlet private weak var renameButton: UIButton!
    @IBOutlet private weak var duplicateButton: UIButton!
    @IBOutlet private weak var deleteButton: UIButton!
    @IBOutlet private weak var exportButton: UIButton!
    @IBOutlet private weak var selectButton: UIButton!
    @IBOutlet private weak var doneButton: UIButton!
    
    // MARK: - BrowserViewProtocol
    
    var presenter: BrowserOutputViewProtocol?
    
    // MARK: -
    
    private var action = Action.default {
        didSet {
            reloadButtons()
        }
    }
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadButtons(animated: false)
    }
    
    // MARK: - BrowserInputViewProtocol
    
    var selectedIndexSet: IndexSet {
        guard let indexPaths = collectionView.indexPathsForSelectedItems else {
            return IndexSet()
        }
        let rows = indexPaths.map { $0.row }
        return IndexSet(rows)
    }
    
    // MARK: -
    
    private func reloadButtons(animated: Bool = true) {
        let closure = { [weak self] in
            guard let self = self else {
                return
            }
            self.newSceneButton.isHidden = !self.action.contains(.newScene)
            self.importButton.isHidden = !self.action.contains(.import)
            self.renameButton.isHidden = !self.action.contains(.rename)
            self.duplicateButton.isHidden = !self.action.contains(.duplicate)
            self.deleteButton.isHidden = !self.action.contains(.delete)
            self.exportButton.isHidden = !self.action.contains(.export)
            self.selectButton.isHidden = !self.action.contains(.select)
            self.doneButton.isHidden = !self.action.contains(.done)
        }
        if (animated) {
            UIView.animate(withDuration: 0.12) {
                self.leftStackView.alpha = 0.0
                self.rightStackView.alpha = 0.0
            } completion: { _ in
                closure()
                UIView.animate(withDuration: 0.12) {
                    self.leftStackView.alpha = 1.0
                    self.rightStackView.alpha = 1.0
                }
            }
        } else {
            closure()
        }
    }
    
    // MARK: -
    
    @IBAction private func newSceneButtonAction(_ sender: UIButton) {
        presenter?.didSelectNewScene()
    }
    
    @IBAction private func importButtonAction(_ sender: UIButton) {
        presenter?.didSelectImport()
    }
    
    @IBAction private func renameButtonAction(_ sender: UIButton) {
        presenter?.didSelectRename()
    }
    
    @IBAction private func duplicateButtonAction(_ sender: UIButton) {
        presenter?.didSelectDuplicate()
    }
    
    @IBAction private func deleteButtonAction(_ sender: UIButton) {
        presenter?.didSelectDelete()
    }
    
    @IBAction private func exportButtonAction(_ sender: UIButton) {
        presenter?.didSelectExport()
    }
    
    @IBAction private func selectButtonAction(_ sender: UIButton) {
        action = .selection
    }
    
    @IBAction private func doneButtonAction(_ sender: UIButton) {
        action = .default
    }
}
