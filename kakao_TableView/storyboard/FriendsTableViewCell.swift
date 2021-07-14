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
    
    // 실험
    @IBOutlet weak var reuseBtn: UISwitch!
    
    
    override func awakeFromNib() {
        
        // 
        super.awakeFromNib()
        // Initialization code
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reuseBtn.isOn = true
//        self.nameLbl.text = nil     요런식으로
        
        // cell 악세사리 타입 없음!
        self.accessoryType = .none
    }
    
    func setDate(imageName: String, name: String, msg: String, clicked: Bool)
    {
        if let image = UIImage(named: imageName)
        {
            imgView.image = image
            imgView.layer.cornerRadius = 20
        }
        nameLbl.text = name
        msgLbl.text = msg
        reuseBtn.isOn = clicked
    }
    
}
