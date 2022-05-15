//
//  ViewController.swift
//  Students App
//
//  Created by Adi Amoyal on 11/05/2022.
//

import UIKit

class ViewController: UIViewController, MySegueProtocol {

    @IBOutlet weak var viewController: UIView!
    
    
    var child1: UIViewController?
    var child2: UIViewController?
    var child3: UIViewController?
    
    func getViewContainer(identifier: String) -> UIView {
        viewController
    }
    
    @IBAction func addStudent(_ sender: UIButton) {
        viewController.addSubview(child2!.view);
    }
    
    @IBAction func aboutBtn(_ sender: UIButton) {
        viewController.bringSubviewToFront(child1!.view);
    }
    
    @IBAction func studentListBtn(_ sender: UIButton) {
        viewController.bringSubviewToFront(child3!.view);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performSegue(withIdentifier: "aboutSegue", sender: self)
        performSegue(withIdentifier: "addStudentSegue", sender: self)
        performSegue(withIdentifier: "studentListSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "aboutSegue") {
            child1 = segue.destination
        } else if(segue.identifier == "addStudentSegue") {
            child2 = segue.destination
        } else if(segue.identifier == "studentListSegue") {
            child3 = segue.destination
        }
    }
    
}

protocol MySegueProtocol {
    func getViewContainer(identifier: String) -> UIView
}

class MySegue: UIStoryboardSegue {
    override func perform() {
        let svc = self.source
        let dvc = self.destination
        
        svc.addChild(dvc)
        
        if let svcp = svc as? MySegueProtocol {
            let container = svcp.getViewContainer(identifier: self.identifier!)
            dvc.view.frame = container.frame
            dvc.view.frame.origin.x = 0
            dvc.view.frame.origin.y = 0
          //  dvc.view.reloadInputViews()
            container.addSubview(dvc.view)
        }
    }
}

