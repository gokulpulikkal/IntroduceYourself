//
//  ViewController.swift
//  IntroduceYourself
//
//  Created by Gokul P on 05/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var schoolNameEditText: UITextField!
    @IBOutlet weak var LastnameEditText: UITextField!
    @IBOutlet weak var firstNameEditText: UITextField!
    
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var petsCountlabel: UILabel!
    
    @IBOutlet weak var morePetsStepper: UIStepper!
    
    @IBOutlet weak var wantMorepetsSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dismissKeyboard()
    }

    @IBAction func stepperDidChange(_ sender: UIStepper) {
        petsCountlabel.text = "\(Int(sender.value))"
    }
    @IBAction func introduceButtonTapped(_ sender: UIButton) {
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)

        let introduction = "My name is \(firstNameEditText.text!) \(LastnameEditText.text!) and I attend \(schoolNameEditText.text!). I am currently in my \(year!) year and I own \(petsCountlabel.text!) dogs. It is \(wantMorepetsSwitch.isOn) that I want more pets."

        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
}

extension UIViewController {
    func dismissKeyboard() {
       let tap: UITapGestureRecognizer = UITapGestureRecognizer( target:     self, action:    #selector(UIViewController.dismissKeyboardTouchOutside))
       tap.cancelsTouchesInView = false
       view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
       view.endEditing(true)
    }
}
