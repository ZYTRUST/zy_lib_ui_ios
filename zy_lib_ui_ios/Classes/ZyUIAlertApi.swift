//
//  ZyUIAlertApi.swift
//  zy_lib_ui_ios
//
//  Created by Edwin on 05/20/2022.
//

import Foundation

class ZyUIAlertApi: ZyUIAlertDelegateProtocol {

    public typealias CallbackAlertUI = (ZyUIAlertResult<Bool>) -> Void
    private var callback:CallbackAlertUI!
    
    private var vc: UIViewController
    
    private var alertView:ZyUIAlertView!
    
    public init(onView:UIViewController){
        vc = onView
    }
    
    public func showAlert(request:ZyUIRequest,
                          completion:@escaping CallbackAlertUI){
        self.callback = completion
        
        alertView = ZyUIAlertView.instantiate(fromStoryboard: "ZyUI",withBundle: type(of: self))
        alertView.modalPresentationStyle = .fullScreen
        alertView.request = request
        alertView.delegate = self
        vc.present(alertView,animated: request.animated, completion:{})
    }
    
    func ok(data: String) {
        callback(.ok(true))
    }
}
