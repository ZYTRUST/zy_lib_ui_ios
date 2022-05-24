//
//  ZyApiUI.swift
//  zy_lib_ui_ios
//
//  Created by Edwin on 05/20/2022.
//

import Foundation

public class ZyApiUI {
    
    public typealias CallbackConfirmUI = (ZyUIConfirmResult<Bool, Bool>) -> Void
    public typealias CallbackAlertUI = (ZyUIAlertResult<Bool>) -> Void
    
    private var vc: UIViewController
    
    public init(onView:UIViewController){
        vc = onView
    }
    
    public func showConfirm(request:ZyUIRequest,
                            completion:@escaping CallbackConfirmUI){
        let confirmApi = ZyUIConfirmApi(onView: vc)
        confirmApi.showConfirm(request: request)
        { (result:(ZyUIConfirmResult<Bool, Bool>)) in
            
            switch result {
                case .ok(let result):
                    completion(.ok(result))
                case .cancel(let result):
                    completion(.cancel(result))
            }
        }
    }
    
    public func showAlert(request:ZyUIRequest,
                          completion:@escaping CallbackAlertUI){
        let api = ZyUIAlertApi(onView: vc)
        api.showAlert(request: request)
        { (result:(ZyUIAlertResult<Bool>)) in
            
            switch result {
                case .ok(let result):
                    completion(.ok(result))
            }
        }
    }
    
    
}
