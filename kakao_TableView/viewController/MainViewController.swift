//
//  MainViewController.swift
//  kakao_TableView
//
//  Created by 이지석 on 2021/07/12.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var kakaoTableView: UITableView!
    
    var myData : [myDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFriendsList()
        kakaoTableView.delegate = self
        kakaoTableView.dataSource = self
        kakaoTableView.separatorStyle = .none
        
        let nibName = UINib(nibName: "FriendsTableViewCell", bundle: nil)
        kakaoTableView.register(nibName, forCellReuseIdentifier: "FriendsCell")
    }
    
    func setFriendsList()
    {
        myData.append(contentsOf: [
            myDataModel(imageName: "personImg", name: "아요쓰", msg: "배고프다"),
            myDataModel(imageName: "personImg", name: "지노", msg: "나도 배고파"),
            myDataModel(imageName: "personImg", name: "모니", msg: "나도 배고파22"),
            myDataModel(imageName: "personImg", name: "아일린", msg: "나도 배고프다33"),
            myDataModel(imageName: "personImg", name: "우주", msg: "나도 배고프다44"),
            myDataModel(imageName: "personImg", name: "앤디", msg: "나도 배고프다55"),
            myDataModel(imageName: "personImg", name: "조디", msg: "나도 배고프다66")
        ])
    }
}

extension MainViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 0)
        {
            return 106
        }
        else
        {
            return 90
        }
    }
}
extension MainViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    // 어떤 내용을 담을지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath)
                as? FriendsTableViewCell else { return UITableViewCell() }
        
        cell.setDate(imageName: myData[indexPath.row].imageName,
                     name: myData[indexPath.row].name,
                     msg: myData[indexPath.row].msg)
        
        return cell
    }
    
    
}
