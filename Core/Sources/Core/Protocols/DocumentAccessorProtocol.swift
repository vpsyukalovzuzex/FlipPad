//
// DocumentAccessorProtocol.swift
//

import Foundation

protocol DocumentAccessorProtocol {
    
    // MARK: -
    
    init(url: URL)
    
    // MARK: -
    
    var rows: Int { get }
    var columns: Int { get }
    
    var isUpgraded: Bool { get }
    
    var resolution: Resolution { get }
    
    var audio: Audio? { get set }
    
    // MARK: -
    
    func getLevel(at index: Index) throws -> Level
    
    func setLevel(_ level: Level, for index: Index) throws
    
    // MARK: -
    
    func getCell(at path: Path) throws -> Cell
    
    func setCell(_ cell: Cell, for path: Path) throws
    
    // MARK: -
    
    func insertLevel(_ level: Level, at index: Index) throws
    
    func removeLevel(at index: Index) throws
    
    // MARK: -
    
    func insertColumn(at index: Index) throws
    
    func removeColumn(at index: Index) throws
    
    // MARK: -
    
    func insertRow(at index: Index) throws
    
    func removeRow(at index: Index) throws
    
    // MARK: -
    
    func upgrade()
}
