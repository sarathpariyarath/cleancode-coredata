//
//  ManageEmployeeVC.swift
//  crud-coredata-cleancode
//
//  Created by Sarath P on 02/01/23.
//

import UIKit

class ManageEmployeeVC: UIViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var lblName: UITextField!
    @IBOutlet weak var lblEmail: UITextField!
    
    private let empManager = EmployeeManager()
    var employee: Employee?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Manage Employee"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.setupView()
    }
    
    private func setupView() {
        guard let employee = employee else {return}

        self.avatarImageView.image = UIImage(data: employee.avatarImg)
        self.lblName.text = employee.name
        self.lblEmail.text = employee.email
        
    }
    
    @IBAction func btnUpdatePressed(_ sender: Any) {
        guard let employee = employee else {return}

        let updatedEmployee = Employee(id: employee.id, name: lblName.text!, email: lblEmail.text!, avatarImg: avatarImageView.image!.pngData()!)
        let result = empManager.update(employee: updatedEmployee)
        if result {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func avatarTapped(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = false //If you want edit option set "true"
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
   
    @IBAction func btnDeletePressed(_ sender: Any) {
        guard let employee = employee else {return}
        let result = empManager.delete(employee: employee)
        if result {
            self.navigationController?.popViewController(animated: true)
        }
    }

}



extension ManageEmployeeVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
        self.avatarImageView.image = image
        self.dismiss(animated: true)
    }
}
