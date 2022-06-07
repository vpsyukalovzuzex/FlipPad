//
// BrowserView.swift
//

import UIKit
import Support
import DifferenceKit

class BrowserView: UIViewController,
                   BrowserViewProtocol,
                   BrowserInputViewProtocol,
                   UICollectionViewDataSource,
                   UICollectionViewDelegate,
                   UICollectionViewDelegateFlowLayout {
    
    // MARK: -
    
    struct Action: OptionSet {
        
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
    
    struct Section: Differentiable {
        
        // MARK: -
        
        var id: String
        
        // MARK: - Differentiable
        
        var differenceIdentifier: String {
            return id
        }
        
        func isContentEqual(to source: BrowserView.Section) -> Bool {
            return id == source.id
        }
    }
    
    struct Element: Differentiable {
        
        // MARK: -
        
        var id: String
        
        var thumbnail: UIImage?
        var name: String?
        
        var isLoading: Bool
        
        // MARK: - Differentiable
        
        var differenceIdentifier: String {
            return id
        }
        
        func isContentEqual(to source: BrowserView.Element) -> Bool {
            return thumbnail == source.thumbnail && name == source.name && isLoading == source.isLoading
        }
    }
    
    // MARK: -
    
    @IBOutlet private weak var blurView: BlurView!
    
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
    
    private var action = Action.default
    
    private var source = [ArraySection<Section, Element>]()
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blurView.isHidden = .isMacCatalyst
        presenter?.viewDidLoad()
    }
    
    // MARK: - BrowserInputViewProtocol
    
    var selectedIndexPaths: [IndexPath]? {
        return collectionView.indexPathsForSelectedItems
    }
    
    var sourceView: UIView {
        return view
    }
    
    var sourceRect: CGRect {
        if .isMacCatalyst {
            return CGRect(
                x: 0.0,
                y: 0.0,
                width: 128.0,
                height: 64.0
            )
        }
        return newSceneButton.frame
    }
    
    // MARK: -
    
    func setAction(_ action: BrowserView.Action) {
        setAction(action, animated: true)
    }
    
    func setAction(_ action: BrowserView.Action, animated: Bool) {
        self.action = action
        reload(animated: animated)
    }
    
    func setNewSource(_ newSource: [ArraySection<Section, Element>]) {
        let stagedChangeset = StagedChangeset(source: source, target: newSource)
        collectionView.reload(using: stagedChangeset) { [weak self] source in
            self?.source = source
        }
    }
    
    func setSelectIndexPaths(_ indexPaths: [IndexPath]?) {
        setSelectIndexPaths(indexPaths, animated: true)
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source[section].elements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = String(describing: BrowserCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BrowserCollectionViewCell
        if let element = source[safe: indexPath.section]?.elements[safe: indexPath.row] {
            cell.thumbnail = element.thumbnail
            cell.name = element.name
            if element.isLoading {
                cell.startAnimating()
            } else {
                cell.stopAnimating()
            }
        }
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didTapDocument(at: indexPath)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size: CGFloat = .isPhone ? .phoneBrowserItemSize : .padBrowserItemSize
        return CGSize(
            width: size,
            height: size
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(
                top: .isMacCatalyst ? 0.0 : .iOSBrowserTopInset,
                left: 0.0,
                bottom: 0.0,
                right: 0.0
            )
        }
        return .zero
    }
    
    // MARK: -
    
    private func reload(animated: Bool = true) {
        reloadButtons(animated: animated)
#if targetEnvironment(macCatalyst)
        reloadToolbar()
#endif
    }
    
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
                let alpha: CGFloat = 0.0
                self.leftStackView.alpha = alpha
                self.rightStackView.alpha = alpha
            } completion: { _ in
                closure()
                UIView.animate(withDuration: 0.12) {
                    let alpha: CGFloat = 1.0
                    self.leftStackView.alpha = alpha
                    self.rightStackView.alpha = alpha
                }
            }
        } else {
            closure()
        }
    }
    
    // MARK: -
    
    @objc private func newSceneAction() {
        presenter?.didTapNewScene()
    }
    
    @objc private func importAction() {
        presenter?.didTapImport()
    }
    
    @objc private func renameAction() {
        presenter?.didTapRename()
    }
    
    @objc private func duplicateAction() {
        presenter?.didTapDuplicate()
    }
    
    @objc private func deleteAction() {
        presenter?.didTapDelete()
    }
    
    @objc private func exportAction() {
        presenter?.didTapExport()
    }
    
    @objc private func selectAction() {
        presenter?.didTapSelect()
    }
    
    @objc private func doneAction() {
        presenter?.didTapDone()
    }
    
    // MARK: -
    
    @IBAction private func newSceneButtonAction(_ sender: UIButton) {
        newSceneAction()
    }
    
    @IBAction private func importButtonAction(_ sender: UIButton) {
        importAction()
    }
    
    @IBAction private func renameButtonAction(_ sender: UIButton) {
        renameAction()
    }
    
    @IBAction private func duplicateButtonAction(_ sender: UIButton) {
        duplicateAction()
    }
    
    @IBAction private func deleteButtonAction(_ sender: UIButton) {
        deleteAction()
    }
    
    @IBAction private func exportButtonAction(_ sender: UIButton) {
        exportAction()
    }
    
    @IBAction private func selectButtonAction(_ sender: UIButton) {
        selectAction()
    }
    
    @IBAction private func doneButtonAction(_ sender: UIButton) {
        doneAction()
    }
}

#if targetEnvironment(macCatalyst)

private extension BrowserView {
    
    // MARK: -
    
    func reloadToolbar() {
        let toolbar = NSToolbar(identifier: "browser")
        toolbar.delegate = self
        toolbar.displayMode = .default
        macCatalystToolbar = toolbar
    }
}

extension BrowserView: NSToolbarDelegate {
    
    // MARK: -
    
    func toolbar(_ toolbar: NSToolbar, itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier, willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        switch itemIdentifier {
        case .newScene:
            let barButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "plus"),
                style: .done,
                target: self,
                action: #selector(newSceneAction)
            )
            let toolbarItem = NSToolbarItem(itemIdentifier: itemIdentifier, barButtonItem: barButtonItem)
            toolbarItem.title = "New scene"
            return toolbarItem
        case .import:
            let barButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "square.and.arrow.down"),
                style: .done,
                target: self,
                action: #selector(importAction)
            )
            let toolbarItem = NSToolbarItem(itemIdentifier: itemIdentifier, barButtonItem: barButtonItem)
            toolbarItem.title = "Import"
            return toolbarItem
        case .rename:
            let barButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "pencil"),
                style: .done,
                target: self,
                action: #selector(renameAction)
            )
            let toolbarItem = NSToolbarItem(itemIdentifier: itemIdentifier, barButtonItem: barButtonItem)
            toolbarItem.title = "Rename"
            return toolbarItem
        case .duplicate:
            let barButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "doc.on.doc"),
                style: .done,
                target: self,
                action: #selector(duplicateAction)
            )
            let toolbarItem = NSToolbarItem(itemIdentifier: itemIdentifier, barButtonItem: barButtonItem)
            toolbarItem.title = "Duplicate"
            return toolbarItem
        case .delete:
            let barButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "trash"),
                style: .done,
                target: self,
                action: #selector(deleteAction)
            )
            let toolbarItem = NSToolbarItem(itemIdentifier: itemIdentifier, barButtonItem: barButtonItem)
            toolbarItem.title = "Delete"
            return toolbarItem
        case .export:
            let barButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "square.and.arrow.up"),
                style: .done,
                target: self,
                action: #selector(exportAction)
            )
            let toolbarItem = NSToolbarItem(itemIdentifier: itemIdentifier, barButtonItem: barButtonItem)
            toolbarItem.title = "Export"
            return toolbarItem
        case .select:
            let barButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "ellipsis"),
                style: .done,
                target: self,
                action: #selector(selectAction)
            )
            let toolbarItem = NSToolbarItem(itemIdentifier: itemIdentifier, barButtonItem: barButtonItem)
            toolbarItem.title = "Select"
            return toolbarItem
        case .done:
            let barButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "checkmark.rectangle"),
                style: .done,
                target: self,
                action: #selector(doneAction)
            )
            let toolbarItem = NSToolbarItem(itemIdentifier: itemIdentifier, barButtonItem: barButtonItem)
            toolbarItem.title = "Done"
            return toolbarItem
        default:
            return nil
        }
    }
    
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return action.toolbarItemIdentifiers
    }
    
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return action.toolbarItemIdentifiers
    }
}

private extension NSToolbarItem.Identifier {
    
    // MARK: -
    
    static var newScene: NSToolbarItem.Identifier {
        return NSToolbarItem.Identifier("newScene")
    }
    
    static var `import`: NSToolbarItem.Identifier {
        return NSToolbarItem.Identifier("import")
    }
    
    static var rename: NSToolbarItem.Identifier {
        return NSToolbarItem.Identifier("rename")
    }
    
    static var duplicate: NSToolbarItem.Identifier {
        return NSToolbarItem.Identifier("duplicate")
    }
    
    static var delete: NSToolbarItem.Identifier {
        return NSToolbarItem.Identifier("delete")
    }
    
    static var export: NSToolbarItem.Identifier {
        return NSToolbarItem.Identifier("export")
    }
    
    static var select: NSToolbarItem.Identifier {
        return NSToolbarItem.Identifier("select")
    }
    
    static var done: NSToolbarItem.Identifier {
        return NSToolbarItem.Identifier("done")
    }
}

private extension BrowserView.Action {
    
    // MARK: -
    
    var toolbarItemIdentifiers:[NSToolbarItem.Identifier] {
        var result = [NSToolbarItem.Identifier]()
        if contains(.newScene) {
            result.append(.newScene)
        }
        if contains(.import) {
            result.append(.import)
        }
        if contains(.rename) {
            result.append(.rename)
        }
        if contains(.duplicate) {
            result.append(.duplicate)
        }
        if contains(.delete) {
            result.append(.delete)
        }
        if contains(.export) {
            result.append(.export)
        }
        if contains(.select) {
            result.append(.flexibleSpace)
            result.append(.select)
        }
        if contains(.done) {
            result.append(.flexibleSpace)
            result.append(.done)
        }
        return result
    }
}

#endif
