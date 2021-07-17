//
//  moreViewController.swift
//  kakao_TableView
//
//  Created by 이지석 on 2021/07/16.
//

import UIKit

class moreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        models.append(Model(imageName: "cImage01", name: "이미지1"))
        models.append(Model(imageName: "cImage02", name: "이미지2"))
        models.append(Model(imageName: "cImage03", name: "이미지3"))
        models.append(Model(imageName: "cImage04", name: "이미지4"))
        models.append(Model(imageName: "cImage05", name: "이미지5"))
        models.append(Model(imageName: "cImage06", name: "이미지6"))
        models.append(Model(imageName: "cImage07", name: "이미지7"))
        
        
        tableView.register(moreTableViewCell.nib(), forCellReuseIdentifier: moreTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: moreTableViewCell.identifier, for: indexPath) as! moreTableViewCell
        cell.configure(with: models)
        
        return cell
    }
}


struct Model
{
    var imageName: String
    var name: String
    
    init(imageName: String, name: String)
    {
        self.imageName = imageName
        self.name = name
    }
}
