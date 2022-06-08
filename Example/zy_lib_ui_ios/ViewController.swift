//
//  ViewController.swift
//  zy_lib_ui_ios
//
//  Created by Edwin Sanchez on 05/19/2022.
//  Copyright (c) 2022 Edwin Sanchez. All rights reserved.
//

import UIKit
import zy_lib_ui_ios

class ViewController: UIViewController {


    @IBAction func fnConfirm(_ sender: Any) {
        confirm()
    }
    
    
    @IBAction func fnAlert(_ sender: Any) {
        alert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func confirm(){
        let apiUI = ZyApiUI(onView: self)
        var req = ZyUIRequest()
        req.lblOk="Entendido"
        req.titleHexColorOk="#FFFFFFFF"
        req.bgHexColorOk="#43B02AFF"
        req.lblCancel="En otro momento"
        req.titleHexColorCancel="#43B02AFF"
        req.message = "No pudimos validar tu identidad. Por favor volver a intentarlo"
        req.animated = true
        
        apiUI.showConfirm(request: req)
        { (result:(ZyUIConfirmResult<Bool, Bool>)) in
            switch result {
                case .ok(let ok):
                    print("ok pressed")
                case .cancel(let cancel):
                    print("cancel pressed")
            }
        }
    }
    
    func alert(){
        let apiUI = ZyApiUI(onView: self)
        var req = ZyUIRequest()
        req.lblOk="Entendido ok"
        req.titleHexColorOk="#FFFFFFFF"
        req.bgHexColorOk="#43B02AFF"
        req.message = "Superaste la maxima cantidad de intentos"
        req.description = "No pudimos validar tu identidad iintentalo nuevamente mas tarde"
        req.animated = true
        
        apiUI.showAlert(request: req)
        { (result:(ZyUIAlertResult<Bool>)) in
            switch result {
                case .ok(let ok):
                    print("ok pressed")
            }
        }
    }
}

