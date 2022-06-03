//
// DGCDocumentAccessor.swift
//

import Foundation

class DGCDocumentAccessor: DocumentAccessorProtocol {
    
    // MARK: -
    
    required init(url: URL) {
        // TODO: -
        fatalError()
    }
    
    // MARK: -
    
    var rows: Int {
        // TODO: -
        fatalError()
    }
    var columns: Int {
        // TODO: -
        fatalError()
    }
    
    var isUpgraded: Bool {
        // TODO: -
        fatalError()
    }
    
    var resolution: Resolution {
        // TODO: -
        fatalError()
    }
    
    var audio: Audio? {
        get {
            // TODO: -
            fatalError()
        }
        set {
            // TODO: -
            fatalError()
        }
    }
    
    // MARK: -
    
    func getLevel(at index: Index) throws -> Level {
        // TODO: -
        fatalError()
    }
    
    func setLevel(_ level: Level, for index: Index) throws {
        // TODO: -
        fatalError()
    }
    
    // MARK: -
    
    func getCell(at path: Path) throws -> Cell {
        // TODO: -
        fatalError()
    }
    
    func setCell(_ cell: Cell, for path: Path) throws {
        // TODO: -
        fatalError()
    }
    
    // MARK: -
    
    func insertLevel(_ level: Level, at index: Index) throws {
        // TODO: -
        fatalError()
    }
    
    func removeLevel(at index: Index) throws {
        // TODO: -
        fatalError()
    }
    
    // MARK: -
    
    func insertColumn(at index: Index) throws {
        // TODO: -
        fatalError()
    }
    
    func removeColumn(at index: Index) throws {
        // TODO: -
        fatalError()
    }
    
    // MARK: -
    
    func insertRow(at index: Index) throws {
        // TODO: -
        fatalError()
    }
    
    func removeRow(at index: Index) throws {
        // TODO: -
        fatalError()
    }
    
    // MARK: -
    
    func upgrade() {
        // TODO: -
        fatalError()
    }
}
