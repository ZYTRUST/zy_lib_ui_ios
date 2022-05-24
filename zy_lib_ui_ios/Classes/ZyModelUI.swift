//
//  ZyModelUI.swift
//  zy_lib_ui_ios
//
//  Created by Edwin on 05/20/2022.
//

import Foundation

public struct ZyUIRequest{
    public init(){}
    
    public var message: String?
    public var description: String?
    
    public var lblOk: String?
    public var titleHexColorOk: String="#FFFFFFFF"
    public var bgHexColorOk: String="#43B02AFF"
    
    public var lblCancel: String?
    public var titleHexColorCancel: String="#43B02AFF"
    public var bgHexColorCancel: String="" //no background default
    
    public var animated: Bool=true
}

public enum ZyUIConfirmResult <T,C> {
    case ok(T)
    case cancel(C)
}

public enum ZyUIAlertResult <T> {
    case ok(T)
}
