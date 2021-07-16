//
//  moreInfoTableViewCell.swift
//  kakao_TableView
//
//  Created by 이지석 on 2021/07/16.
//

import UIKit

class moreInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionViewCell: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension moreInfoTableViewCell : UICollectionViewDelegate
{
    
}

extension moreInfoTableViewCell : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
