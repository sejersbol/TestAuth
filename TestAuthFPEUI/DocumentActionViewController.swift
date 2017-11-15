//
//  DocumentActionViewController.swift
//  TestAuthFPEUI
//
//  Created by Anders Sejersbøl on 14/11/2017.
//

import UIKit
import FileProviderUI

class DocumentActionViewController: FPUIActionExtensionViewController {

  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var actionTypeLabel: UILabel!
  
  @IBOutlet var identifierTextField: UITextField!
  @IBOutlet var actionTypeTextField: UITextField!
  
  var authenticateAction = false
  
  override func prepare(forAction actionIdentifier: String, itemIdentifiers: [NSFileProviderItemIdentifier]) {
    typeLabel?.text = "Type:"
    actionTypeLabel?.text = "Action name:"
    identifierTextField?.text = actionIdentifier
    actionTypeTextField?.text = "Custom action"
  }
  
  override func prepare(forError error: Error) {
    authenticateAction = true
    
    typeLabel?.text = "User name:"
    actionTypeLabel?.text = "Password:"
  }
  
  @IBAction func doneButtonTapped(_ sender: Any) {
    // Perform the action and call the completion block. If an unrecoverable error occurs you must still call the completion block with an error. Use the error code FPUIExtensionErrorCode.failed to signal the failure.
    
    if authenticateAction {
      if let user = identifierTextField.text, let password = actionTypeTextField.text {
        if (user == "blah" && password == "blah1234") {
          // Successful login
          let userDefaults = UserDefaults(suiteName: "group.com.sejersbol.TestAuth")
          userDefaults?.set("true", forKey: "userAuthenticated")
        } else {
          // Not authenticated, do nothing
        }
      }
    }
    
    extensionContext.completeRequest()
  }
  
  @IBAction func cancelButtonTapped(_ sender: Any) {
    extensionContext.cancelRequest(withError: NSError(domain: FPUIErrorDomain, code: Int(FPUIExtensionErrorCode.userCancelled.rawValue), userInfo: nil))
  }
  
}

