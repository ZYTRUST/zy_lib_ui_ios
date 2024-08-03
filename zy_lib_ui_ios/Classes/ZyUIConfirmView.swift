//
//  ZyUIView.swift
//  zy_lib_ui_ios
//
//  Created by Edwin on 05/20/2022.
//

import Foundation

protocol ZyUIConfirmDelegateProtocol{
    
    func ok(data:String)
    func cancel(data:String)
}

class ZyUIConfirmView: ParentViewController{
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    @IBAction func onPressedOk(_ sender: Any) {
        if self.delegate != nil {
            self.delegate?.ok(data: "OK")
            self.dismissMe(animated: request.animated, completion: nil)
        }
    }
    
    @IBAction func onPressedCancel(_ sender: Any) {
        if self.delegate != nil {
            self.delegate?.cancel(data: "OK")
            self.dismissMe(animated: request.animated, completion: nil)
        }
    }
    
    var request = ZyUIRequest()
    var delegate : ZyUIConfirmDelegateProtocol? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMessage.text = request.message
        lblMessage.textColor = UIColor(resource: ColorResource.greyDark)
        lblMessage.fontRegular()
        
        btnOk.setTitle(request.lblOk, for: .normal)
        
        btnCancel.setTitleColor(UIColor(hex: request.titleHexColorCancel), for: .normal)
        btnCancel.backgroundColor = UIColor(hex: request.bgHexColorCancel)
        btnCancel.setTitle(request.lblCancel, for: .normal)
        
    }
}
