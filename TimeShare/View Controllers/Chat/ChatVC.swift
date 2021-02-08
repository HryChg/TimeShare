//
//  ChatViewController.swift
//  TimeShare
//
//  Created by Bo LeGrand on 1/11/21.
//  Copyright © 2021 harrychuang. All rights reserved.
//

import UIKit
import Firebase

class ChatVC: UIViewController {
    
    static let identifier = "ChatVC"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var chatTextField: UITextField!
    @IBOutlet weak var hideKeyboardButton: UIButton!
    @IBOutlet weak var studyingButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableViewTopAnchor: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerViewBottomAnchor: NSLayoutConstraint!
    @IBOutlet weak var chatTextFieldLeadingAnchor: NSLayoutConstraint!
    
    var studyingListIsShowing = false
    let db = Firestore.firestore()
    let profileImageURL = Auth.auth().currentUser?.photoURL
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupCollectionView()
        setupTextField()
        setupUI()
        loadMessages()
        setupKeyboardObservers()
                
    }
    
    @objc private func handleKeyboardNotification(notification: NSNotification) {
        
        if let userInfo = notification.userInfo {
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            if let tabBarHeight = tabBarController?.tabBar.frame.size.height {
                let keyboardIsShowing = notification.name == UIResponder.keyboardWillShowNotification
                containerViewBottomAnchor.constant = keyboardIsShowing ? -keyboardFrame.height + tabBarHeight : 0
                
                UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut) { [self] in
                    view.layoutIfNeeded()
                } completion: { (completed) in
                    UIView.animate(withDuration: 0.5) { [self] in
                        hideKeyboardButton.isHidden = keyboardIsShowing ? false : true
                        chatTextFieldLeadingAnchor.constant = keyboardIsShowing ? 10 : -40
                        UIView.animate(withDuration: 0) {
                            view.layoutIfNeeded()
                        }
                    }
                }
                
            }
        }
    }
    
    private func setupUI() {
        
        view.backgroundColor = UIColor(named: K.BrandColors.color2)
        
        hideKeyboardButton.isHidden = true
        
        chatTextFieldLeadingAnchor.constant = -40
        
        tableViewTopAnchor.constant = 40
        
        containerView.backgroundColor = UIColor(named: K.BrandColors.color2)
        
        studyingButton.semanticContentAttribute = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        
    }
    
    private func loadMessages() {
        
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField, descending: false)
            .addSnapshotListener { [self] (querySnapshot, error) in
                
                messages = []
                
                if let e = error {
                    print("Error loading messages: \(e.localizedDescription)")
                } else {
                    
                    if let snapShotDocs = querySnapshot?.documents {
                        for doc in snapShotDocs {
                            let data = doc.data()
                            if let messageSender = data[K.FStore.senderField] as? String,
                               let messageBody = data[K.FStore.bodyField] as? String {
                                let newMessage = Message(sender: messageSender, body: messageBody)
                                messages.append(newMessage)
                                
                                DispatchQueue.main.async {
                                    tableView.reloadData()
                                    scrollToLastMessage()
                                }
                            }
                        }
                    }
                }
            }
    }
    
    private func toggleStudyingList() {
        
        UIView.animate(
            withDuration: 0.7,
            delay: 0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 1,
            options: .curveEaseOut,
            animations: { [self] in
                if studyingListIsShowing {
                    tableViewTopAnchor.constant = 40
                    studyingButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
                    view.layoutIfNeeded()
                } else {
                    tableViewTopAnchor.constant = 140
                    studyingButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
                    
                    view.layoutIfNeeded()
                }
            },
            completion: nil)
        
        studyingListIsShowing = !studyingListIsShowing
        
    }
    
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: MessageCell.identifier, bundle: nil), forCellReuseIdentifier: MessageCell.identifier)
        
        tableView.keyboardDismissMode = .onDrag
        
    }
    
    private func setupCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor(named: K.BrandColors.color2)
        
    }
    
    private func setupTextField() {
        chatTextField.delegate = self
                
        chatTextField.placeholder = "Chat"
        chatTextField.font = UIFont.systemFont(ofSize: 20)
        chatTextField.autocapitalizationType = .sentences
        chatTextField.returnKeyType = .send
    }
    
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    private func sendMessage() {
        guard chatTextField.text != "" else { return }
        if let messageBody = chatTextField.text,
           let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: messageSender,
                K.FStore.bodyField: messageBody,
                K.FStore.dateField: Date().timeIntervalSince1970
            ]) { (error) in
                if let e = error {
                    print("Error saving data to firestore: \(e)")
                } else {
                    print("Successfully saved data")
                }
            }
        }
        chatTextField.text = ""
    }
    
    private func scrollToLastMessage() {
        tableView.scrollToBottomRow()
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        sendMessage()
    }
    
    @IBAction func hideKeyboardButtonTapped(_ sender: UIButton) {
        dismissKeyboard()
    }
    
    @IBAction func studyingButtonTapped(_ sender: UIButton) {
        toggleStudyingList()
    }
    
}

extension ChatVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sender = messages[indexPath.row].sender
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.identifier) as! MessageCell
        
        if let currentUser = Auth.auth().currentUser {
            cell.leftImageView.downloaded(from: currentUser.photoURL!)
            cell.rightImageView.downloaded(from: currentUser.photoURL!)
        }
        
        
        
        cell.bodyLabel.text = messages[indexPath.row].body
        
        if sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.bodyLabel.textColor = .white
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.color6)
            
            
        } else {
            
            cell.rightImageView.isHidden = true
            cell.leftImageView.isHidden = false
            cell.bodyLabel.textColor = .black
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.color1)
        }
        
        return cell
    }
}

extension ChatVC: UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StudyingCell.identifier, for: indexPath) as! StudyingCell
        
        cell.imageView.makeRound()
        cell.imageView.image = UIImage(named: "Headshot")
        cell.nameLabel.text = "Name"
        
        return cell
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView == tableView {
            if studyingListIsShowing {
                print("Scrolling")
                toggleStudyingList()
            }
        }
    }
}

extension ChatVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 65, height: 65)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension ChatVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollToLastMessage()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == chatTextField {
            sendMessage()
        }
        return true
    }
    
}

extension UITableView {
    func scrollToBottomRow() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            guard numberOfSections > 0 else { return }
            
            var section = max(numberOfSections - 1, 0)
            var row = max(numberOfRows(inSection: section) - 1, 0)
            var indexPath = IndexPath(row: row, section: section)

            
            while !indexPathIsValid(indexPath) {
                section = max(section - 1, 0)
                row = max(numberOfRows(inSection: section) - 1, 0)
                indexPath = IndexPath(row: row, section: section)
                
                if indexPath.section == 0 {
                    indexPath = IndexPath(row: 0, section: 0)
                    break
                }
            }

            guard indexPathIsValid(indexPath) else { return }
            
            scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    func indexPathIsValid(_ indexPath: IndexPath) -> Bool {
        let section = indexPath.section
        let row = indexPath.row
        return section < numberOfSections && row < numberOfRows(inSection: section)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
