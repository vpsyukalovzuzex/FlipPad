//
// SettingsInteractorProtocol.swift
//

import Foundation

protocol SettingsInteractorProtocol: AnyObject {
    
    var presenter: SettingsOutputInteractorProtocol? { get set }
}
