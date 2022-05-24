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

class ZyUIConfirmView: UIViewController{
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnOk: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    @IBAction func onPressedOk(_ sender: Any) {
        if self.delegate != nil {
            self.delegate?.ok(data: "OK")
            dismiss(animated: request.animated, completion: nil)
        }
    }
    
    @IBAction func onPressedCancel(_ sender: Any) {
        if self.delegate != nil {
            self.delegate?.cancel(data: "OK")
            dismiss(animated: request.animated, completion: nil)
        }
    }
    
    var request = ZyUIRequest()
    var delegate : ZyUIConfirmDelegateProtocol? = nil
    private var vc: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMessage.text = request.message
        btnOk.setTitle(request.lblOk, for: .normal)
        btnOk.setTitleColor(UIColor(hex: request.titleHexColorOk), for: .normal)
        btnOk.backgroundColor = UIColor(hex: request.bgHexColorOk)
        
        btnCancel.setTitleColor(UIColor(hex: request.titleHexColorCancel), for: .normal)
        btnCancel.backgroundColor = UIColor(hex: request.bgHexColorCancel)
        btnCancel.setTitle(request.lblCancel, for: .normal)
    }
    
}
