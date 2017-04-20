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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }

    // MARK: - Actions
    @IBAction fileprivate func startTouchId(sender: UIButton) {
        useTouchID()
    }
    
    fileprivate func useTouchID() {
        
        let context = LAContext()
        let policy = LAPolicy.deviceOwnerAuthenticationWithBiometrics
        var authError: NSError? = nil
        
        guard context.canEvaluatePolicy(policy, error: &authError) else {
            print(Texts.Messages.unsupportedDevice)
            return
        }
        
        context.evaluatePolicy(policy, localizedReason: Texts.Messages.putFingerOnSensor, reply: { (success, error) in
            DispatchQueue.main.async {
                guard success else { print("Error: \(Texts.Messages.wrongFinger) \(error?.localizedDescription ?? "")"); return }
                self.textField.text = Texts.Messages.secretMessage
            }
        })
    }
}

