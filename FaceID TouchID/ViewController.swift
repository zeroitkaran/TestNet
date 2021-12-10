//
//  ViewController.swift
//  FaceID TouchID
//
//  Created by zeroit01 on 07/12/21.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func BtnLogin(_ sender: Any) {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Identify yourself!"

            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) {
                [weak self] success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        //self?.unlockSecretMessage()
                        
                        print("unlock")
                    } else {
                        // error
                        
                        let ac = UIAlertController(title: "Authentication failed", message: "You could not be verified; please try again.", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        self?.present(ac, animated: true)
                    }
                    
                    if (authenticationError != nil) {
                        print("failss")
                    } else {
                        
                        print("ssss")
                    }
                }
            }
        } else {
            // no biometry
            
            let ac = UIAlertController(title: "Biometry unavailable", message: "Your device is not configured for biometric authentication.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    }
    
}

