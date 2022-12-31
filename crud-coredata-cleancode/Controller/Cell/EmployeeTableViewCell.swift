//
//  EmployeeTableViewCell.swift
//  crud-coredata-cleancode
//
//  Created by Sarath P on 01/01/23.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.width / 2
        self.avatarImageView.contentMode = .scaleAspectFill
    }
    
    func configureCell(with employee: Employee?) {
        if let imgData = employee?.avatarImg {
            if let avatarImg = UIImage(data: imgData) {
                avatarImageView.image = avatarImg
            }
        }
        lblName.text = employee?.name
    }
    
}
