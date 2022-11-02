//
//  ChatModel.swift
//  DeliveryApp
//
//  Created by Александр Калашников on 2/11/22.
//

import Foundation
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase
import Firebase
import RxCocoa
import RxRelay
import RxSwift

class ChatModel {
    let massageText = BehaviorRelay<String>(value: "")
    
    var ref: DatabaseReference!
    fileprivate var _redHandle: DatabaseHandle!
    var messages: [DataSnapshot] = []
    var massages = BehaviorRelay<[DataSnapshot]>(value: [])
    
    var storageRef: StorageReference!
                                            
    init() {
//        configureDatabase()
    }
    
    deinit {
        if let refHandle = _redHandle {
            self.ref.child("messages").removeObserver(withHandle: _redHandle)
        }
    }
    
    func sendMassage() {
        let data = [Constants.MessageFields.text: massageText.value]
        makeMassage(withData: data)
    }
    
    func configureDatabase(tableview: UITableView) {
        ref = Database.database().reference()
        _redHandle = self.ref.child("messages").observe(.childAdded, with: { [weak self] (snapshot) -> Void in
             guard let strongSelf = self else { return }
            strongSelf.messages.append(snapshot)
            strongSelf.massages.accept(strongSelf.messages)
            tableview.insertRows(at: [IndexPath(row: strongSelf.massages.value.count-1, section: 0)], with: .automatic)
           })
    }
    
    func makeMassage(withData data: [String: String]) {
        var mData = data
        let name = Auth.auth().currentUser?.email
        mData[Constants.MessageFields.name] = name
        self.ref.child("messages").childByAutoId().setValue(mData)
    }
}
