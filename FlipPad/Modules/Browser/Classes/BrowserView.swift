//
// BrowserView.swift
//

import UIKit
import DifferenceKit
import CoreGraphics

class BrowserView: UIViewController,
                   BrowserViewProtocol,
                   BrowserInputViewProtocol,
                   UICollectionViewDataSource,
                   UICollectionViewDelegate,
                   UICollectionViewDelegateFlowLayout {
    
    // MARK: -
    
    fileprivate struct Action: OptionSet {
        
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
    
    private var action = Action.default {
        didSet {
            reload()
        }
    }
    
    private var sections = [ArraySection<Section, Element>]()
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blurView.isHidden = .isMacCatalyst
        reload(animated: false)
        presenter?.viewDidLoad()
    }
    
    // MARK: - BrowserInputViewProtocol
    
    var isSelection: Bool {
        return action == .selection
    }
    
    var selectedIndexPaths: [IndexPath]? {
        return collectionView.indexPathsForSelectedItems
    }
    
    var source: [ArraySection<Section, Element>] {
        get {
            return sections
        }
        set {
            let stagedChangeset = StagedChangeset(source: sections, target: newValue)
            collectionView.reload(using: stagedChangeset) { [weak self] sections in
                self?.sections = sections
            }
        }
    }
    
    // MARK: -
    
    func deselectAllDocuments() {
        deselectAllDocuments(animated: true)
    }
    
    func deselectAllDocuments(animated: Bool) {
        if let indexPaths = collectionView.indexPathsForSelectedItems {
            for indexPath in indexPaths {
                collectionView.deselectItem(at: indexPath, animated: animated)
            }
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].elements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = String(describing: BrowserCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BrowserCollectionViewCell
        if let item = sections[safe: indexPath.section]?.elements[safe: indexPath.row] {
            cell.thumbnail = item.thumbnail
            cell.name = item.name
            if item.isLoading {
                cell.startAnimating()
            } else {
                cell.stopAnimating()
            }
        }
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectDocument()
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size: CGFloat = .isPhone ? .phoneBrowserItemSize : .padBrowserItemSize
        return CGSize(
            width: size,
            height: size
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(
                width: 0.0,
                height: .isMacCatalyst ? 0.0 : .iOSBrowserTopInset
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
    
    @objc private func newSceneAction() {
        presenter?.didSelectNewScene()
    }
    
    @objc private func importAction() {
        presenter?.didSelectImport()
    }
    
    @objc private func renameAction() {
        presenter?.didSelectRename()
    }
    
    @objc private func duplicateAction() {
        presenter?.didSelectDuplicate()
    }
    
    @objc private func deleteAction() {
        presenter?.didSelectDelete()
    }
    
    @objc private func exportAction() {
        presenter?.didSelectExport()
    }
    
    @objc private func selectAction() {
        action = .selection
    }
    
    @objc private func doneAction() {
        action = .default
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
    
    // MARK: -
    
    private func reloadToolbar() {
        guard
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let titlebar = scene.titlebar
        else {
            return
        }
        let toolbar = NSToolbar(identifier: "browser")
        toolbar.delegate = self
        toolbar.displayMode = .default
        titlebar.toolbar = toolbar
        titlebar.titleVisibility = .visible
        if #available(macCatalyst 14.0, *) {
            titlebar.toolbarStyle = .expanded
        }
    }
}

fileprivate extension NSToolbarItem.Identifier {
    
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

fileprivate extension BrowserView.Action {
    
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
