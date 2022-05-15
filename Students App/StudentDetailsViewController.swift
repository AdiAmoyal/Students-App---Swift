//
//  StudentDetailsViewController.swift
//  Students App
//
//  Created by Adi Amoyal on 14/05/2022.
//

import UIKit

class StudentDetailsViewController: UIViewController {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var student: Student?{
        didSet {
            if (idLabel != nil) {
                idLabel.text = student?.id
                nameLabel.text = student?.name
                phoneLabel.text = student?.phone
                addressLabel.text = student?.address
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let student = student {
            idLabel.text = student.id
            nameLabel.text = student.name
            phoneLabel.text = student.phone
            addressLabel.text = student.address
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
