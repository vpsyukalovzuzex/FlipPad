//
// DCFBDocumentAccessor.swift
//

import Foundation
import Support
import FMDB

class DCFBDocumentAccessor: DocumentAccessorProtocol {
    
    // MARK: -
    
    private let databaseQueue: FMDatabaseQueue?
    
    // MARK: -
    
    required init(url: URL) {
        self.databaseQueue = FMDatabaseQueue(url: url)
        setup()
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
    
    var resolution: Resolution {
        let resolution = getString(for: .resolution)
        let values = resolution?.components(separatedBy: "x")
        return Resolution(
            width: Int(values?[safe: 0] ?? "") ?? 0,
            height: Int(values?[safe: 1] ?? "") ?? 0
        )
    }
    
    var isUpgraded: Bool {
        let a = isUpgradedA()
        let b = isUpgradedB()
        let c = isUpgradedC()
        return a && b && c
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
        return Cell(
            pencil: Image(data: getCellData(for: .pencil, at: path)),
            paint: Image(data: getCellData(for: .paint, at: path)),
            structure: Image(data: getCellData(for: .structure, at: path)),
            background: Image(data: getCellData(for: .background, at: path))
        )
    }
    
    func setCell(_ cell: Cell, for path: Path) throws {
        setCellData(cell.pencil.data, for: .pencil, at: path)
        setCellData(cell.paint.data, for: .paint, at: path)
        setCellData(cell.structure.data, for: .structure, at: path)
        setCellData(cell.background.data, for: .background, at: path)
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
        if !isUpgradedA() {
            databaseQueue?.inDatabase { try? $0.executeUpdate("ALTER TABLE cells ADD COLUMN structure BLOB", values: nil) }
            setString("1", for: .migration)
        }
        if !isUpgradedB() {
            // TODO: -
            setString(.yes, for: .isStraightAlpha)
        }
        if !isUpgradedC() {
            databaseQueue?.inDatabase { try? $0.executeUpdate("UPDATE cells SET x = x - 1, y = y - 1", values: nil) }
            setString("2", for: .migration)
        }
    }
    
    // MARK: -
    
    private func setup() {
        databaseQueue?.inDatabase {
            try? $0.executeUpdate("CREATE TABLE IF NOT EXISTS cells (id INTEGER PRIMARY KEY, x INTEGER, y INTEGER, label VARCHAR(50), pencil BLOB, paint BLOB, vector BLOB)", values: nil)
            try? $0.executeUpdate("CREATE TABLE IF NOT EXISTS settings (id INTEGER PRIMARY KEY, name VARCHAR(50), value VARCHAR(50))", values: nil)
            try? $0.executeUpdate("CREATE TABLE IF NOT EXISTS settingsData (id INTEGER PRIMARY KEY, name VARCHAR(50), value BLOB)", values: nil)
        }
    }
    
    // MARK: -
    
    private func getCellData(for layer: String, at path: Path) -> Data? {
        var result: Data?
        databaseQueue?.inDatabase {
            let set = try? $0.executeQuery("SELECT ? FROM cells WHERE x = ? AND y = ?", values: [layer, path.x, path.y])
            set?.next()
            result = set?.data(forColumnIndex: 0)
            set?.close()
        }
        return result
    }
    
    private func setCellData(_ data: Data?, for layer: String, at path: Path) {
        var sql: String
        if isCellExists(at: path) {
            sql = "UPDATE cells SET ? = ? WHERE x = ? AND y = ?"
        } else {
            sql = "INSERT INTO cells (?, x, y) VALUES (?, ?, ?)"
        }
        databaseQueue?.inDatabase { try? $0.executeUpdate(sql, values: [layer, data ?? Data(), path.x, path.y]) }
    }
    
    // MARK: -
    
    private func isCellExists(at path: Path) -> Bool {
        var result: Bool?
        databaseQueue?.inDatabase {
            let set = try? $0.executeQuery("SELECT * FROM cells WHERE x = ? AND y = ?", values: [path.x, path.y])
            result = set?.next()
            set?.close()
        }
        return result ?? false
    }
    
    // MARK: -
    
    private func getString(for key: String) -> String? {
        var result: String?
        databaseQueue?.inDatabase {
            let set = try? $0.executeQuery("SELECT value FROM settings WHERE name = ?", values: [key])
            set?.next()
            result = set?.string(forColumnIndex: 0)
            set?.close()
        }
        return result
    }
    
    private func setString(_ string: String?, for key: String) {
        if let string = string {
            if getData(for: key) == nil {
                databaseQueue?.inDatabase { try? $0.executeUpdate("INSERT INTO settings (name, value) VALUES (?, ?)", values: [key, string]) }
            } else {
                databaseQueue?.inDatabase { try? $0.executeUpdate("UPDATE settings SET value = ? WHERE name = ?", values: [key, string]) }
            }
        } else {
            databaseQueue?.inDatabase { try? $0.executeUpdate("DELETE FROM settings WHERE name = ?", values: [key]) }
        }
    }
    
    // MARK: -
    
    private func getData(for key: String) -> Data? {
        var result: Data?
        databaseQueue?.inDatabase {
            let set = try? $0.executeQuery("SELECT value FROM settingsData WHERE name = ?", values: [key])
            set?.next()
            result = set?.data(forColumnIndex: 0)
            set?.close()
        }
        return result
    }
    
    private func setData(_ data: Data?, for key: String) {
        if let data = data {
            if getData(for: key) == nil {
                databaseQueue?.inDatabase { try? $0.executeUpdate("INSERT INTO settingsData (name, value) VALUES (?, ?)", values: [key, data]) }
            } else {
                databaseQueue?.inDatabase { try? $0.executeUpdate("UPDATE settingsData SET value = ? WHERE name = ?", values: [key, data]) }
            }
        } else {
            databaseQueue?.inDatabase { try? $0.executeUpdate("DELETE FROM settingsData WHERE name = ?", values: [key]) }
        }
    }
    
    // MARK: -
    
    func isUpgradedA() -> Bool {
        return getString(for: .migration) == "1"
    }
    
    func isUpgradedB() -> Bool {
        return getString(for: .isStraightAlpha) == .yes
    }
    
    func isUpgradedC() -> Bool {
        return getString(for: .migration) == "2"
    }
}

// MARK: -

private extension String {
    
    // MARK: -
    
    static var resolution: String {
        return "resolution"
    }
    
    // MARK: -
    
    static var pencil: String {
        return "pencil"
    }
    
    static var paint: String {
        return "paint"
    }
    
    static var structure: String {
        return "structure"
    }
    
    static var background: String {
        return "background"
    }
    
    // MARK: -
    
    static var migration: String {
        return "migration"
    }
    
    static var isStraightAlpha: String {
        return "is_straight_alpha"
    }
    
    static var yes: String {
        return "YES"
    }
}
