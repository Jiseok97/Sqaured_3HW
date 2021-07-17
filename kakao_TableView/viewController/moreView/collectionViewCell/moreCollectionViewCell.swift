//
//  moreCollectionViewCell.swift
//  kakao_TableView
//
//  Created by 이지석 on 2021/07/17.
//

import UIKit

class moreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var myLbl : UILabel!
    @IBOutlet var myImageView: UIImageView!
    
    static let identifier = "moreCollectionViewCell"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "moreCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(with model: Model)
    {
        self.myLbl.text = model.name
        self.myImageView.image = UIImage(named: model.imageName)
    }
    
    
}
