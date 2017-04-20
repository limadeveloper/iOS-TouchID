//
//  ViewController.swift
//  TouchID
//
//  Created by John Lima on 4/21/15.
//  Copyright (c) 2015 John Lima. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet fileprivate weak var textField: UITextField!
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Actions
    @IBAction fileprivate func startTouchId(sender: UIButton) {
        useTouchID()
    }
    
    fileprivate func useTouchID() {
        
        let authContext = LAContext()
        let authPolicy = LAPolicy.deviceOwnerAuthenticationWithBiometrics
        
        var authError: NSErrorPointer? = nil
        if (authContext.canEvaluatePolicy(authPolicy, error: authError!)) {
            
            authContext.evaluatePolicy(authPolicy, localizedReason: "Coloque o dedo no sensor biométrico do seu device", reply: {(success: Bool, error: NSError?) in
                
                DispatchQueue.main.async(execute: { () -> Void in
                    if (success) {
                        self.textField.text = "Isto é uma mensagem secreta"
                    }else {
                        print("Dedo errado")
                    }
                })
            } as! (Bool, Error?) -> Void)
            
        }else {
            print("Seu dispositivo não suporta o Touch ID")
        }
    }

}

