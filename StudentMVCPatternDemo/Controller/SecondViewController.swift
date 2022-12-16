//
//  SecondViewController.swift
//  StudentMVCPatternDemo
//
//  Created by Mac on 08/11/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var StudentIdTextField: UITextField!
    @IBOutlet weak var StudentFirstNameTextField: UITextField!
    @IBOutlet weak var StudentLastNameTextField: UITextField!
    @IBOutlet weak var StudentMarkTextField: UITextField!
    
    var delegateOnSecondViewController : BackDataPassingProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func clickBtnToAddStudentRecord(_ sender: UIButton) {
        guard let delegate = delegateOnSecondViewController else {
            print("delegate not created")
            return
        }
        
    // MARK - validate the each field
        
        if (self.StudentIdTextField.text!.isEmpty)
        {
            let wrongId = UIAlertController(title: "Alert", message: "Please Enter Student Id", preferredStyle: UIAlertController.Style.alert)
            wrongId.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(wrongId, animated: true,completion: nil)
        }
        else if(self.StudentFirstNameTextField.text!.isEmpty){
            let wrongFirstName = UIAlertController(title: "Alert", message: "Please Enter Student First Name", preferredStyle: UIAlertController.Style.alert)
            wrongFirstName.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(wrongFirstName, animated: true, completion: nil)
        }
        else if(self.StudentLastNameTextField.text!.isEmpty){
            let wrongLastName = UIAlertController(title: "Alert", message: "Please Enter Student Last Name", preferredStyle: UIAlertController.Style.alert)
            wrongLastName.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(wrongLastName, animated: true, completion: nil)
        }
        else if(self.StudentMarkTextField.text!.isEmpty){
            let wrongMark = UIAlertController(title: "Alert", message: "Please Enter Student Mark", preferredStyle: UIAlertController.Style.alert)
            wrongMark.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(wrongMark, animated: true, completion: nil)
        }
        
        
        let id = self.StudentIdTextField.text
        let idInt = Int(id!) ?? 0
        
        let StudentFirstName = self.StudentFirstNameTextField.text ?? "Default"
        let StudentLastName = self.StudentLastNameTextField.text ?? "Default"
        
        let Mark = self.StudentMarkTextField.text
        let StudentMark = Float(Mark!) ?? 0.0
        
        delegate.pssingDataToFirstViewController(student: Student(StudentId: idInt, StudentFirstName: StudentFirstName, StudentLastName: StudentLastName, StudentMarks: StudentMark))
        
        navigationController?.popViewController(animated: true)
    }
}
