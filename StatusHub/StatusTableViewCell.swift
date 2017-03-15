//
//  StatusTableViewCell.swift
//  StatusHub
//
//  Created by Subodh Jena on 15/03/17.
//  Copyright © 2017 Cuckoo Labs. All rights reserved.
//

import UIKit

class StatusTableViewCell: UITableViewCell {
    
    // The reuse identifier for this cell
    static let reuseIdentifier : String = "StatusTableViewCell"
    
    // The cell height
    static let cellHeight : CGFloat = 90
    
    // MARK: - Public Declarations
    
    var post : Post!{
        
        didSet{
            setUpForPost()
        }
    }
    
    // MARK :- IBOutlets
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setUpForPost() {
        
        lblName.text = post.user?.name
        lblDate.text = post.createdAt
        lblMessage.text = post.message
    }

}
