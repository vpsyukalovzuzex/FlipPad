//
// Cell.swift
//

import Foundation

public final class Cell {
    
    // MARK: -
    
    public var pencil: Image
    public var paint: Image
    public var structure: Image
    public var background: Image
    
    // MARK: -
    
    public init(
        pencil: Image,
        paint: Image,
        structure: Image,
        background: Image
    ) {
        self.pencil = pencil
        self.paint = paint
        self.structure = structure
        self.background = background
    }
}
