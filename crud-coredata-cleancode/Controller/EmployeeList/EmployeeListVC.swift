//
//  EmployeeListVC.swift
//  crud-coredata-cleancode
//
//  Created by Sarath P on 01/01/23.
//

import UIKit

class EmployeeListVC: UIViewController {
 
    @IBOutlet weak var tableView: UITableView!
    
    private var employeeManager = EmployeeManager()
    var employeeList: [Employee]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Employee List"
        employeeList = employeeManager.getAllEmployee()
        self.tableView.reloadData()
    }
    
    func configureTableView() {
        let cellxib = UINib(nibName: "EmployeeTableViewCell", bundle: nil)
        self.tableView.register(cellxib, forCellReuseIdentifier: "employeeCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}

