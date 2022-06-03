//
// PalletesInputInteractorProtocol.swift
//

import Foundation
import Core

protocol PalletesInputInteractorProtocol: AnyObject {
    
    // MARK: -
    
    var palletes: [Pallete] { get }
    
    // MARK: -
    
    func start()
    
    func newPallete() throws
    
    func deletePallete(at index: Int) throws
    
    func renamePallete(at index: Int, with name: String) throws
}
