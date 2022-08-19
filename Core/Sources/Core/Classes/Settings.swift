//
// Settings.swift
//

import Foundation
import Support

public final class Settings {
    
    // MARK: -
    
    @Store("fps", 24)
    public static var fps: Int
    
    @Store("minFps", 1)
    public static var minFps: Int
    
    @Store("maxFps", 24)
    public static var maxFps: Int
    
    @Store("resolution", 0)
    public static var resolution: Int
    
    @Store("selectedColorOpacity", 1.0)
    public static var selectedColorOpacity: Float
    
    @Store("selectedColor", Color(r: 0, g: 0, b: 0, a: 255))
    public static var selectedColor: Color
    
    @Store("isVerticalToolbars", false)
    public static var isVerticalToolbars: Bool
    
    @Store("xsheetPosition", 0)
    public static var xsheetPosition: Int
    
    @Store("minPreviousDrawingCount", 1)
    public static var minPreviousDrawingCount: Int
    
    @Store("maxPreviousDrawingCount", 32)
    public static var maxPreviousDrawingCount: Int
    
    @Store("previousDrawingCount", 2)
    public static var previousDrawingCount: Int
    
    @Store("minLightboxOpacity", 0.0)
    public static var minOpacity: Float
    
    @Store("maxLightboxOpacity", 1.0)
    public static var maxOpacity: Float
    
    @Store("isAlwaysDisplayBackground", true)
    public static var isAlwaysDisplayBackground: Bool
    
    @Store("minEraserSize", 1)
    public static var minEraserSize: Int
    
    @Store("maxEraserSize", 10)
    public static var maxEraserSize: Int
    
    @Store("eraserSize", 10)
    public static var eraserSize: Int
    
    @Store("minEraserHardness", 1)
    public static var minEraserHardness: Int
    
    @Store("maxEraserHardness", 10)
    public static var maxEraserHardness: Int
    
    @Store("eraserHardness", 10)
    public static var eraserHardness: Int
}
