//
//  StudentsTableViewController.swift
//  Students App
//
//  Created by Adi Amoyal on 14/05/2022.
//

import UIKit

class StudentsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Model.instance.addStudent(student: Student(name: "Adi Amoyal", id: "1234567", phone: "0501234567", avatarUrl: "", address: "Israel"))
        Model.instance.addStudent(student: Student(name: "Bar", id: "2345678", phone: "0538334544", avatarUrl: "", address: "Israel"))
        Model.instance.addStudent(student: Student(name: "Kely Sotsky", id: "3456789", phone: "0508346344", avatarUrl: "", address: "Israel"))
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
    
    }

    // MARK: - Table view data source
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Model.instance.data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! StudentTableViewCell
        
        let st = Model.instance.data[indexPath.row]
        cell.id = st.id
        cell.name = st.name
        return cell
    }
    
    var selectedRow = 0
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("Selected row at: \(indexPath.row)")
        selectedRow = indexPath.row
        performSegue(withIdentifier: "openStudentDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "openStudentDetails") {
            let dvc = segue.destination as! StudentDetailsViewController
            let st = Model.instance.getStudent(index: selectedRow)
            dvc.student = st
        }
    }
    
    @objc func loadList(notification: NSNotification){
            //load data here after add student.
            self.tableView.reloadData()
        }
}
