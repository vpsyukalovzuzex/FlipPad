//
// AccessorProtocol.swift
//

import Foundation

public protocol AccessorProtocol {
    
    // MARK: -
    
    var rows: Int { get }
    var columns: Int { get }
    
    var audio: Audio? { get set }
    
    // MARK: -
    
    func level(at index: Index) -> Level?
    
    func setLevel(_ level: Level, for index: Index)
    
    func appendLevel(_ level: Level)
    
    func insertLevel(_ level: Level, at index: Index)
    
    func removeLevel(at index: Index) -> Level
    
    func removeLevel(_ level: Level) -> Int
    
    // MARK: -
    
    func cell(at path: Path) -> Cell?
    
    func setCell(_ cell: Cell, for path: Path)
    
    // MARK: -
    
    func appendRow()
    
    func insertRow(at index: Index)
    
    func removeRow(at index: Index)
    
    // MARK: -
    
    func clearCell(at path: Path)
    
    func clearRow(at index: Index)
    
    func clearColumn(at index: Index)
}
