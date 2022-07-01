//
// URLManager.swift
//

import Foundation
import Support

public final class URLManager {
    
    // MARK: -
    
    public static var folder: URL {
        return .document ?? URL(fileURLWithPath: "")
    }
    
    public static var urls: [URL] {
        let folder = self.folder
        guard let contents = try? fileManager.contentsOfDirectory(atPath: folder.path) else {
            return []
        }
        let dgc = PathExtension.dgc.rawValue
        let dcfb = PathExtension.dcfb.rawValue
        return contents
            .filter {
                return $0.hasSuffix(dgc) || $0.hasSuffix(dcfb)
            }
            .map {
                return folder.appendingPathComponent($0)
            }
            .sorted {
                let a = (try? fileManager.attributesOfItem(atPath: $0.path)[.modificationDate]) as? Date ?? Date()
                let b = (try? fileManager.attributesOfItem(atPath: $1.path)[.modificationDate]) as? Date ?? Date()
                return a < b
            }
    }
    
    // MARK: -
    
    private static var fileManager: FileManager {
        return .default
    }
    
    // MARK: -
    
    public static func createDefaultFolderIfNeeded() throws {
        let path = folder.path
        if fileManager.fileExists(atPath: path) {
            return
        }
        try fileManager.createDirectory(atPath: path, withIntermediateDirectories: true)
    }
    
    public static func createDefaultFilesIfNeeded(from urls: [URL]) throws {
        guard self.urls.isEmpty else {
            return
        }
        let folder = self.folder
        for atUrl in urls {
            let toUrl = folder.appendingPathComponent(atUrl.lastPathComponent)
            try fileManager.copyItem(
                atPath: atUrl.path,
                toPath: toUrl.path
            )
        }
    }
    
    public static func createNewFile(with data: Data, name: String, pathExtension: PathExtension, index: Int? = nil) throws {
        let number = index == nil ? "" : " \(index!)"
        let url = folder
            .appendingPathComponent(name + number)
            .appendingPathExtension(pathExtension.rawValue)
        if fileManager.fileExists(atPath: url.path) {
            try createNewFile(with: data, name: name, pathExtension: pathExtension, index: (index ?? 0) + 1)
            return
        }
        try data.write(to: url)
    }
    
    public static func renameFile(at url: URL, with name: String) throws {
        let data = try Data(contentsOf: url)
        let pathExtenson = url.pathExtension
        try data.write(
            to: url
                .deletingLastPathComponent()
                .appendingPathComponent(name)
                .appendingPathExtension(pathExtenson)
        )
        try fileManager.removeItem(atPath: url.path)
    }
    
    public static func duplicateFile(at url: URL, index: Int? = nil) throws {
        let name = url.deletingPathExtension().lastPathComponent
        let pathExtension = url.pathExtension
        let number = index == nil ? "" : " \(index!)"
        let toUrl = url
            .deletingLastPathComponent()
            .appendingPathComponent(name + " Copy" + number)
            .appendingPathExtension(pathExtension)
        if fileManager.fileExists(atPath: toUrl.path) {
            try duplicateFile(at: url, index: (index ?? 0) + 1)
            return
        }
        try fileManager.copyItem(
            atPath: url.path,
            toPath: toUrl.path
        )
    }
    
    public static func duplicateFiles(at urls: [URL]) throws {
        for url in urls {
            try duplicateFile(at: url)
        }
    }
    
    public static func deleteFiles(at urls: [URL]) throws {
        for url in urls {
            try fileManager.removeItem(atPath: url.path)
        }
    }
}
