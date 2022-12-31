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
    }
    
    func configureTableView() {
        let cellxib = UINib(nibName: "EmployeeTableViewCell", bundle: nil)
        self.tableView.register(cellxib, forCellReuseIdentifier: "employeeCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}

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
    
}

