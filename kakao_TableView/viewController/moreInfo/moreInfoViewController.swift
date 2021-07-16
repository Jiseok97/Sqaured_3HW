//
//  moreInfoViewController.swift
//  kakao_TableView
//
//  Created by 이지석 on 2021/07/14.
//

import UIKit

class moreInfoViewController: UIViewController {
    
    @IBOutlet weak var moreTableView: UITableView!
    
    var moreList : [moreListDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func setMoreList()
    {
        moreList.append(contentsOf: [
            moreListDataModel(iamgeName: "moreIcon", name: "메일"),
            moreListDataModel(iamgeName: "moreIcon", name: "캘린더"),
            moreListDataModel(iamgeName: "moreIcon", name: "서랍"),
            moreListDataModel(iamgeName: "moreIcon", name: "카카오콘"),
            moreListDataModel(iamgeName: "moreIcon", name: "메이커스"),
            moreListDataModel(iamgeName: "moreIcon", name: "선물하기"),
            moreListDataModel(iamgeName: "moreIcon", name: "이모티콘"),
            moreListDataModel(iamgeName: "moreIcon", name: "프렌즈"),
            moreListDataModel(iamgeName: "moreIcon", name: "쇼핑하기"),
            moreListDataModel(iamgeName: "moreIcon", name: "패션"),
            moreListDataModel(iamgeName: "moreIcon", name: "주문하기"),
            moreListDataModel(iamgeName: "moreIcon", name: "멜론티켓"),
            moreListDataModel(iamgeName: "moreIcon", name: "게임"),
            moreListDataModel(iamgeName: "moreIcon", name: "구독ON"),
            moreListDataModel(iamgeName: "moreIcon", name: "음"),
            moreListDataModel(iamgeName: "moreIcon", name: "전체서비스")
        ])
    }

}


extension moreInfoViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension moreInfoViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = moreTableView.dequeueReusableCell(withIdentifier: "moreInfoTableViewCell") as? moreInfoTableViewCell else {  return UITableViewCell() }
        
        
        return cell
    }
    
    
}
