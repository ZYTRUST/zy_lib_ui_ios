//
//  ZyUIConfirmApi.swift
//  zy_lib_ui_ios
//
//  Created by Edwin on 05/20/2022.
//

import Foundation

class ZyUIConfirmApi: ZyUIConfirmDelegateProtocol {

    public typealias CallbackConfirmUI = (ZyUIConfirmResult<Bool, Bool>) -> Void
    private var callback:CallbackConfirmUI!
    
    private var vc: UIViewController
    
    private var confirmView:ZyUIConfirmView!
    
    public init(onView:UIViewController){
        vc = onView
    }
    
    public func showConfirm(request:ZyUIRequest,
                            completion:@escaping CallbackConfirmUI){
        self.callback = completion
        
        confirmView = ZyUIConfirmView.instantiate(fromStoryboard: "ZyUI",withBundle: type(of: self))
        confirmView.modalPresentationStyle = .fullScreen
        confirmView.request = request
        confirmView.delegate = self
        vc.present(confirmView,animated: request.animated, completion:{})
    }
    
    func ok(data: String) {
        callback(.ok(true))
    }
    
    func cancel(data: String) {
        callback(.cancel(true))
    }
}
