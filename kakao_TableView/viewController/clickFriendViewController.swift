//
//  clickFriendViewController.swift
//  kakao_TableView
//
//  Created by 이지석 on 2021/07/13.
//

import UIKit

class clickFriendViewController: UIViewController {
    
    var receiveImage = ""
    var receiveName = ""
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImage()
        nameLbl.text = receiveName
    }
    
    // MARK: dismiss
    @IBAction func exitBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: get & set Image
    func setImage()
    {
        imgView.image = UIImage(named: receiveImage)
        imgView.layer.cornerRadius = 30
    }
}
