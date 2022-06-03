//
// ColorSelectionOutputViewProtocol.swift
//

import Foundation
import UIKit

protocol ColorSelectionOutputViewProtocol: ColorsDelegate {
    
    // MARK: -
    
    var palleteName: String? { get }
    
    // MARK: -
    
    func viewDidLoad()
    
    func didTapNewColor()
    
    func didChangeOpacity()
}
