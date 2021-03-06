//
//  MainViewController.swift
//  kakao_TableView
//
//  Created by 이지석 on 2021/07/12.
//

import UIKit
import Network
import SystemConfiguration

class MainViewController: UIViewController {

    @IBOutlet weak var kakaoTableView: UITableView!
    var myData : [myDataModel] = []
    //    var banLst : [myDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFriendsList()
        kakaoTableView.delegate = self
        kakaoTableView.dataSource = self
        kakaoTableView.separatorStyle = .none
        
        self.kakaoTableView.dragInteractionEnabled = true
        self.kakaoTableView.dragDelegate = self
        self.kakaoTableView.dropDelegate = self
        
        // MARK: nib 파일 사용시 추가
//        let nibName = UINib(nibName: "FriendsTableViewCell", bundle: nil)
//        kakaoTableView.register(nibName, forCellReuseIdentifier: "FriendsCell")
    }
 
    
    // MARK: Checking Internet Connecting
    func isInternetAvailable() -> Bool
        {
            var zeroAddress = sockaddr_in()
            zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
            zeroAddress.sin_family = sa_family_t(AF_INET)
            
            let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
                $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                    SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
                }
            }
            
            var flags = SCNetworkReachabilityFlags()

            if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {

                return false

            }

            let isReachable = flags.contains(.reachable)
            let needsConnection = flags.contains(.connectionRequired)

            return (isReachable && !needsConnection)
        }
    
    
    // MARK: Cheking Test Method
    func checkInternet()
    {
        if(isInternetAvailable)() {
            print("인터넷 연결 성공!!")
        }
        else
        {
            print("인터넷 연결 실패")
        }
    }
    
    
    // MARK: Internet Connection & reloadData()
    override func viewDidAppear(_ animated: Bool) {
        kakaoTableView.reloadData()
        checkInternet()
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        kakaoTableView.reloadData()
        checkInternet()
    }
    
    // MARK: myData
    func setFriendsList()
    {
        myData.append(contentsOf: [
            myDataModel(imageName: "person", name: "아요쓰", msg: "배고프다", click: true),
            myDataModel(imageName: "person", name: "지노", msg: "나도 배고파", click: true),
            myDataModel(imageName: "person", name: "모니", msg: "나도 배고파22", click: true),
            myDataModel(imageName: "person", name: "아일린", msg: "나도 배고프다33", click: true),
            myDataModel(imageName: "person", name: "우주", msg: "나도 배고프다44", click: true),
            myDataModel(imageName: "person", name: "앤디", msg: "나도 배고프다55", click: true),
            myDataModel(imageName: "person", name: "조디", msg: "나도 배고프다66", click: true),
            
            // dequeueReusable
            myDataModel(imageName: "person", name: "사람1", msg: "Hello", click: true),
            myDataModel(imageName: "person", name: "사람2", msg: "Hello", click: true),
            myDataModel(imageName: "person", name: "사람3", msg: "Hello", click: true),
            myDataModel(imageName: "person", name: "사람4", msg: "Hello", click: true),
            myDataModel(imageName: "person", name: "사람5", msg: "Hello", click: true),
            myDataModel(imageName: "person", name: "사람6", msg: "Hello", click: true),
            myDataModel(imageName: "person", name: "사람7", msg: "Hello", click: true),
            myDataModel(imageName: "person", name: "사람8", msg: "Hello", click: true),
            myDataModel(imageName: "person", name: "사람9", msg: "Hello", click: true),
            myDataModel(imageName: "person", name: "사람10", msg: "Hello", click: true),
            myDataModel(imageName: "person", name: "사람11", msg: "Hello", click: true),
            myDataModel(imageName: "person", name: "사람12", msg: "Hello", click: true),
            myDataModel(imageName: "person", name: "사람13", msg: "Hello", click: true),
            myDataModel(imageName: "person", name: "사람14", msg: "Hello", click: true)
        ])
    }
    
    
    // MARK: cell 클릭 시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "clickFriendViewController") as? clickFriendViewController else { return }
        
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .coverVertical

        nextVC.receiveName = myData[indexPath.row].name
        nextVC.receiveImage = myData[indexPath.row].imageName
        myData[indexPath.row].click = false
        
        self.present(nextVC, animated: true, completion: nil)
    }
    
    
    
    // MARK: ActionSheet
    @IBAction func optionBtn(_ sender: Any) {
        let opBtn = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // style: default, destructive(글씨 빨갛게), cancel
        let editAct = UIAlertAction(title: "편집", style: .default, handler: {_ in
            self.kakaoTableView.setEditing(true, animated: true)
        })
        let manageAct = UIAlertAction(title: "친구 관리", style: .default, handler: {_ in
            self.kakaoTableView.setEditing(false, animated: true)
        })
        let settingAct = UIAlertAction(title: "전체 설정", style: .default, handler: {_ in })
        let cancelAct = UIAlertAction(title: "취소", style: .cancel, handler: {_ in })
        
        opBtn.addAction(editAct)
        opBtn.addAction(manageAct)
        opBtn.addAction(settingAct)
        opBtn.addAction(cancelAct)
        
        self.present(opBtn, animated: true, completion: nil)
    }
    
    
    // MARK: Remove Function
    func remove(at indexPath: IndexPath, to tableView: UITableView)
    {
        myData.remove(at: indexPath.row)
        kakaoTableView.deleteRows(at: [indexPath], with: .automatic)
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
   
    // MARK: Star (Left)
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let star = UIContextualAction(style: .normal, title: "☆", handler: {(action, view, success) in
            
        })
        
        star.backgroundColor = .systemBlue
        
        let swipeAct = UISwipeActionsConfiguration(actions: [star])
        
        return swipeAct
    }
    
    
    // MARK: hide & ban function (Right)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let hideAct = UIContextualAction(style: .normal, title: "숨김", handler: {( action, view, success) in
            self.remove(at: indexPath, to: self.kakaoTableView)
        })
        
        let banAct = UIContextualAction(style: .normal, title: "차단", handler: {( action, view, seccess) in
            self.remove(at: indexPath, to: self.kakaoTableView)
        })
        
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
    // MARK: dequeueReusableCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier, for: indexPath)
                as? FriendsTableViewCell else { return UITableViewCell() }
        
        cell.setDate(imageName: myData[indexPath.row].imageName,
                     name: myData[indexPath.row].name,
                     msg: myData[indexPath.row].msg,
                     clicked: myData[indexPath.row].click)
        
        return cell
    }
    
    // 위치 바꿀 수 있게 하기
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
    }
    
    // Move Row Instance Method
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveCell = self.myData[sourceIndexPath.row]
        self.myData.remove(at: sourceIndexPath.row)
        self.myData.insert(moveCell, at: destinationIndexPath.row)
    }
    
}



// MARK: UITableView UITableViewDragDelegate
extension MainViewController: UITableViewDragDelegate {
func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return [UIDragItem(itemProvider: NSItemProvider())]
    }
}
 
// MARK: UITableView UITableViewDropDelegate
extension MainViewController: UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        if session.localDragSession != nil {
            return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UITableViewDropProposal(operation: .cancel, intent: .unspecified)
    }
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) { }
}
