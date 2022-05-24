//
//  ZyUIAlertView.swift
//  zy_lib_ui_ios
//
//  Created by Edwin on 05/20/2022.
//

import Foundation

protocol ZyUIAlertDelegateProtocol{
    func ok(data:String)
}

class ZyUIAlertView: UIViewController {
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnOk: UIButton!
    
    @IBOutlet weak var lblDescripcion: UILabel!
    
    @IBAction func onPressedOk(_ sender: Any) {
        if self.delegate != nil {
            self.delegate?.ok(data: "OK")
            dismiss(animated: request.animated, completion: nil)
        }
    }
    
    var request = ZyUIRequest()
    var delegate : ZyUIAlertDelegateProtocol? = nil
    private var vc: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMessage.text = request.message
        lblDescripcion.text = request.description
        btnOk.setTitle(request.lblOk, for: .normal)
        btnOk.setTitleColor(UIColor(hex: request.titleHexColorOk), for: .normal)
        btnOk.backgroundColor = UIColor(hex: request.bgHexColorOk)
    }
    
}
