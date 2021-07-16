//
//  moreInfoCollectionViewCell.swift
//  kakao_TableView
//
//  Created by 이지석 on 2021/07/15.
//

import UIKit

class moreInfoCollectionViewCell: UICollectionViewCell {
    static let identifier : String = "moreInfoCollectionViewCell"
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    
    func setData(imageName: String, name: String)
    {
        if let image = UIImage(named: imageName)
        {
            imageV.image = image
        }
        nameLbl.text = name
    }
    
    
}
