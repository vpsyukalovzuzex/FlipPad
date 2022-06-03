//
// PalletesOutputInteractorProtocol.swift
//

import Foundation
import Core

protocol PalletesOutputInteractorProtocol: AnyObject {
    
    // MARK: -
    
    var defaultPalleteName: String? { get }
    
    // MARK: -
    
    func didSelectPallete(at index: Int)
    
    func didUpdatePalletes(_ palletes: [Pallete])
}
