//
//  ViewController.swift
//  crud-coredata-cleancode
//
//  Created by Sarath P on 31/12/22.
//

import UIKit

class CreateEmployeeVC: UIViewController {

    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var lblName: UITextField!
    @IBOutlet weak var lblEmail: UITextField!
    
    private let employeeManager = EmployeeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViewDidLoad()
    }

    func configureViewDidLoad() {
        self.title = "New Employee"
        self.avatarImg.contentMode = .scaleAspectFill
        self.avatarImg.layer.cornerRadius = self.avatarImg.frame.width/2
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    @IBAction func btnImagePickerTapped(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = false //If you want edit option set "true"
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func btnCreateTapped(_ sender: Any) {
        employeeManager.create(employee: Employee(
            id: UUID(),
            name: lblName.text ?? "",
            email: lblEmail.text ?? "",
            avatarImg: avatarImg.image?.pngData() ?? Data()
        ))
        
        let empListVC = self.storyboard?.instantiateViewController(withIdentifier: "EmployeeListVC") as! EmployeeListVC
        self.navigationController?.pushViewController(empListVC, animated: true)
        
    }
}

extension CreateEmployeeVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
        self.avatarImg.image = image
        self.dismiss(animated: true)
    }
}
