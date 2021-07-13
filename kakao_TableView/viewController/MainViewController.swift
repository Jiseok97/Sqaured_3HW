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
        
        
        
        // MARK: nib 파일 사용시 추가
//        let nibName = UINib(nibName: "FriendsTableViewCell", bundle: nil)
//        kakaoTableView.register(nibName, forCellReuseIdentifier: "FriendsCell")
    }
    
    // MARK: reloadData()
    override func viewDidAppear(_ animated: Bool) {
        kakaoTableView.reloadData()
    }
    override func viewDidDisappear(_ animated: Bool) {
        kakaoTableView.reloadData()
    }
    
    
    // MARK: myData
    func setFriendsList()
    {
        myData.append(contentsOf: [
            myDataModel(imageName: "person", name: "아요쓰", msg: "배고프다"),
            myDataModel(imageName: "person", name: "지노", msg: "나도 배고파"),
            myDataModel(imageName: "person", name: "모니", msg: "나도 배고파22"),
            myDataModel(imageName: "person", name: "아일린", msg: "나도 배고프다33"),
            myDataModel(imageName: "person", name: "우주", msg: "나도 배고프다44"),
            myDataModel(imageName: "person", name: "앤디", msg: "나도 배고프다55"),
            myDataModel(imageName: "person", name: "조디", msg: "나도 배고프다66")
        ])
    }
    
    
    // MARK: cell 클릭 시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "clickFriendViewController") as? clickFriendViewController else { return }
        
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .coverVertical
        
        nextVC.receiveName = myData[indexPath.row].name
        nextVC.receiveImage = myData[indexPath.row].imageName
        
        self.present(nextVC, animated: true, completion: nil)
    }
    
    
    
    // MARK: ActionSheet
    @IBAction func optionBtn(_ sender: Any) {
        let opBtn = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // style: default, destructive(글씨 빨갛게), cancel
        let editAct = UIAlertAction(title: "편집", style: .default, handler: {_ in })
        let manageAct = UIAlertAction(title: "친구 관리", style: .default, handler: {_ in })
        let settingAct = UIAlertAction(title: "전체 설정", style: .default, handler: {_ in })
        let cancelAct = UIAlertAction(title: "취소", style: .cancel, handler: {_ in })
        
        opBtn.addAction(editAct)
        opBtn.addAction(manageAct)
        opBtn.addAction(settingAct)
        opBtn.addAction(cancelAct)
        
        self.present(opBtn, animated: true, completion: nil)
    }
    
}


// MARK: Delegate
extension MainViewController : UITableViewDelegate
{
    // MARK: height for row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // heightForHeaderInSection -> Header만 크기 다르게 하기도 가능
        if (indexPath.row == 0) { return 73 }
        else { return 60 }
    }
    
    
    // MARK: hide & ban function
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let hideAct = UIContextualAction(style: .normal, title: "숨김", handler: {( action, view, success) in })
        
        let banAct = UIContextualAction(style: .normal, title: "차단", handler: {( action, view, seccess) in })
        
        hideAct.backgroundColor = .gray
        banAct.backgroundColor = .red
        
        let swipeAct = UISwipeActionsConfiguration(actions: [banAct, hideAct])
        
        // 스와이프 자동으로 끝까지 되는 거 방지하기 위함
        swipeAct.performsFirstActionWithFullSwipe = false
        
        return swipeAct
    }
    
    
    // MARK: Context Menu
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {

        let chat = UIAction(title:"채팅하기") {_ in }
        let voiceChat = UIAction(title: "보이스톡") {_ in }
        let faceChat = UIAction(title: "페이스톡") {_ in }
        let present = UIAction(title: "선물하기") {_ in }

//        self.imageName = myData[indexPath.row].imageName
//        self.name = myData[indexPath.row].name
//
        return UIContextMenuConfiguration(identifier: nil,
                                          previewProvider: nil)
        {
            _ in UIMenu(title:"", children: [chat, voiceChat, faceChat, present])
        }
    }
}



// MARK: DataSource
extension MainViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    // 어떤 내용을 담을지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier, for: indexPath)
                as? FriendsTableViewCell else { return UITableViewCell() }
        
        cell.setDate(imageName: myData[indexPath.row].imageName,
                     name: myData[indexPath.row].name,
                     msg: myData[indexPath.row].msg)
        
        return cell
    }
    
}
