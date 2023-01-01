//
//  EmployeeListVC + Extensions.swift
//  crud-coredata-cleancode
//
//  Created by Sarath P on 02/01/23.
//

import Foundation
import UIKit


extension EmployeeListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let empCell = tableView.dequeueReusableCell(withIdentifier: "employeeCell") as? EmployeeTableViewCell else {return UITableViewCell()}
        empCell.configureCell(with: employeeList?[indexPath.row])
        return empCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let manageEmployeeVC = self.storyboard?.instantiateViewController(withIdentifier: "ManageEmployeeVC") as? ManageEmployeeVC else {return}
        manageEmployeeVC.employee = self.employeeList![indexPath.row]
        self.navigationController?.pushViewController(manageEmployeeVC, animated: true)
    }
    
}


