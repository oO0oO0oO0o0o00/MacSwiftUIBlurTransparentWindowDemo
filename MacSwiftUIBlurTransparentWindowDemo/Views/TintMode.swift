//
//  TintMode.swift
//  MacSwiftUIBlurTransparentWindowDemo
//
//  Created by MeowCat on 2025/12/17.
//

enum TintMode: String, CaseIterable, Identifiable {
    case normal
    case multiply
    case screen
    case overlay
    case darken
    case lighten
    case colorDodge
    case colorBurn
    case softLight
    case hardLight
    case difference
    case exclusion
    case subtract
    case divide
    case linearBurn
    case linearDodge
    case linearLight
    case pinLight
    
    var id: String { rawValue }
}

extension TintMode {
    var value: String {
        return switch self {
        case .normal: kCAFilterNormalBlendMode
        case .multiply: kCAFilterMultiplyBlendMode
        case .screen: kCAFilterScreenBlendMode
        case .overlay: kCAFilterOverlayBlendMode
        case .darken: kCAFilterDarkenBlendMode
        case .lighten: kCAFilterLightenBlendMode
        case .colorDodge: kCAFilterColorDodgeBlendMode
        case .colorBurn: kCAFilterColorBurnBlendMode
        case .softLight: kCAFilterSoftLightBlendMode
        case .hardLight: kCAFilterHardLightBlendMode
        case .difference: kCAFilterDifferenceBlendMode
        case .exclusion: kCAFilterExclusionBlendMode
        case .subtract: kCAFilterSubtractBlendMode
        case .divide: kCAFilterDivideBlendMode
        case .linearBurn: kCAFilterLinearBurnBlendMode
        case .linearDodge: kCAFilterLinearDodgeBlendMode
        case .linearLight: kCAFilterLinearLightBlendMode
        case .pinLight: kCAFilterPinLightBlendMode
        }
    }
}
