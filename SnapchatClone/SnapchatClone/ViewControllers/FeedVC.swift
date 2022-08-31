//
//  FeedVC.swift
//  SnapchatClone
//
//  Created by Mehmet Ali Kılıçlı on 30.08.2022.
//

import UIKit
import Firebase

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let fireStoreDatabase = Firestore.firestore()
    var snapArray = [Snap]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    getSnapsFromFirebase()
    getInfo()
        
        
    }
    
    func getSnapsFromFirebase() {
        fireStoreDatabase.collection("Snaps").order(by: "date",descending: true).addSnapshotListener { snapshot, error in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error!")
            } else {
                if snapshot?.isEmpty == false && snapshot != nil {
                    self.snapArray.removeAll(keepingCapacity: false)
                    for document in snapshot!.documents {
                        
                        let documentId = document.documentID
                        
                        if let username = document.get("snapOwner") as? String {
                            if let imageUrlArray = document.get("imageUrlArray") as? [String] {
                                if let date = document.get("date") as? Timestamp {
                                    
                                    if let difference = Calendar.current.dateComponents([.hour], from: date.dateValue(), to: Date()).hour {
                                        if difference >= 24 {
                                            self.fireStoreDatabase.collection("Snaps").document(documentId).delete { error in
                                                
                                            }
                                        }
                                        
                                        // Timeleft -> SnapVC
                                        
                                    }
                                    
                                    let snap = Snap(username: username, imageUrlArray: imageUrlArray, date: date.dateValue())
                                    
                                    self.snapArray.append(snap)
                                     
                                }
                            }
                        }
                    }
                }
            }
        }
        
        
    }
    
    func getInfo() {
        
        fireStoreDatabase.collection("UserInfo").whereField("email", isEqualTo: Auth.auth().currentUser!.email!).getDocuments { snapshot, error in
            if error != nil {
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            } else {
            if snapshot?.isEmpty == false && snapshot != nil {
                    for document in snapshot!.documents {
                        if let username = document.get("username" as? String) {
                            UserSingleton.sharedUserInfo.email = Auth.auth().currentUser!.email!
                            UserSingleton.sharedUserInfo.username = username as! String
                        }
                    }
                }
            }
        }
    }

    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snapArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.feedUserNameLabel.text = snapArray[indexPath.row].username
        return cell
    }
    
}
