//
//  FriendsTableViewCell.swift
//  kakao_TableView
//
//  Created by 이지석 on 2021/07/12.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    static let identifier : String = "FriendsTableViewCell"

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var msgLbl: UILabel!
    
    override func awakeFromNib() {
        
        // 
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDate(imageName: String, name: String, msg: String)
    {
        if let image = UIImage(named: imageName)
        {
            imgView.image = image
        }
        nameLbl.text = name
        msgLbl.text = msg
    }
    
    
}
