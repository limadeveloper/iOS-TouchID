//
//  ViewController.swift
//  TouchID
//
//  Created by John Silva on 4/21/15.
//  Copyright (c) 2015 John Silva. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet var tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ok(sender: UIButton) {
        useTouchID()
    }
    
    func useTouchID() {
        let authContext = LAContext()
        let authPolicy = LAPolicy.DeviceOwnerAuthenticationWithBiometrics
        
        var authError: NSErrorPointer = nil
        if (authContext.canEvaluatePolicy(authPolicy, error: authError)) {
            
            authContext.evaluatePolicy(authPolicy, localizedReason: "Coloque o dedo no sensor biométrico do seu device", reply: {(success: Bool, error: NSError?) in
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if (success) {
                        self.tf.text = "Isto é uma mensagem secreta"
                    }else {
                        println("Dedo errado")
                    }
                })
            })
            
        }else {
            println("Seu dispositivo não suporta o Touch ID")
        }
    }

}

