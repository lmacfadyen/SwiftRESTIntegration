//
//  ViewController.swift
//  SwiftRESTIntegration
//
//  Created by Lawrence F MacFadyen on 2018-03-05.
//  Copyright © 2018 Lawrence F MacFadyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldCode: UITextField!
    @IBOutlet weak var textViewResponse: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func buttonSendPressed(_ sender: Any) {
        guard let code = textFieldCode.text else {return}
        textViewResponse.text = "" // clear response
        if(code.count < 1) {return}
        lookupCode(code: code)
    }
    
    func lookupCode(code: String)
    {
        PostalCodeService.shared.lookupPostalCode(code: code, completionHandler: { (responseObject:PostalCode?, error:RESTError?) -> Void in
            if let issue = error {
                // Back on the main thread
                DispatchQueue.main.async() {
                    let alert = UIAlertController(title: "Error", message: issue.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }

            } else {
                guard let foundCode = responseObject else {return}
                // Back on the main thread
                DispatchQueue.main.async() {
                    self.textViewResponse.text = String(reflecting: foundCode)
                }
            }
        })
    }
}

