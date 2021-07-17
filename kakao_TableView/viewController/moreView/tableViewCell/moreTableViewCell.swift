//
//  moreTableViewCell.swift
//  kakao_TableView
//
//  Created by 이지석 on 2021/07/17.
//

import UIKit

class moreTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let identifier = "moreTableViewCell"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "moreTableViewCell", bundle: nil)
    }
    
    func configure(with models: [Model])
    {
        self.models = models
        collectionView.reloadData()
    }
    
    @IBOutlet var collectionView : UICollectionView!
    
    var models = [Model]()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(moreCollectionViewCell.nib(), forCellWithReuseIdentifier: moreCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    // MARK: CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: moreCollectionViewCell.identifier, for: indexPath) as! moreCollectionViewCell
        cell.configure(with: models[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
    
}
