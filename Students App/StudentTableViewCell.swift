//
//  StudentTableViewCell.swift
//  Students App
//
//  Created by Adi Amoyal on 14/05/2022.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    var id = "" {
        didSet {
            if(idLabel != nil){
                idLabel.text = id
            }
        }
    }
    
    var name = "" {
        didSet {
            if(nameLabel != nil){
                nameLabel.text = name
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        idLabel.text = id
        nameLabel.text = name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
