//
//  AddStudentViewController.swift
//  Students App
//
//  Created by Adi Amoyal on 13/05/2022.
//

import UIKit

class AddStudentViewController: UIViewController {

    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var address: UITextField!
    
    @IBAction func saveBtn(_ sender: UIButton) {
        let student = Student()
        student.name = name.text!
        student.id = id.text!
        student.phone = phone.text!
        student.address = address.text!
        Model.instance.addStudent(student: student)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        removeSubview()
        
        // TODO: Go back to home page --> List of students
    }
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        removeSubview()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func removeSubview(){
            name.text = ""
            id.text = ""
            phone.text = ""
        address.text = ""
            
            if let viewWithTag = self.view.viewWithTag(100) {
                viewWithTag.removeFromSuperview()
            }else{
                print("No!")
            }
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
