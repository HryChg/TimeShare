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
    
    var studyingListIsShowing = false
    let db = Firestore.firestore()
    
    let messages: [Message] = [
        
        Message(sender: "Harry", body: "Hey, what's up?"),
        Message(sender: "Sean", body: "Not much, how's it going?"),
        Message(sender: "Harry", body: "Good, just going to school and coding"),
        Message(sender: "Brian", body: "You got this."),
        Message(sender: "Harry", body: "When are you going to be done?"),
        Message(sender: "Sean", body: "The semester ends in June"),
        Message(sender: "Harry", body: "What's the weather going to be in June?"),
        Message(sender: "Brian", body: "In California, it will probably be in the 90's. Not sure what that is in Celcius. Harry, what is room temperature in Celcius?"),
        Message(sender: "Harry", body: "According to Google, 20 degrees Celcius is room temperature"),
        Message(sender: "Sean", body: "You learn something new every day!"),
        Message(sender: "Harry", body: "I gotta go"),
        Message(sender: "Brian", body: "Bye"),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupCollectionView()
        setupObservers()
        setupUI()
        scrollToLastMessage()
        
        chatTextField.addTarget(self, action: #selector(textFieldTapped), for: .touchDown)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        scrollToLastMessage()
    }
    
    
    @objc func textFieldTapped(textField: UITextField) {
        scrollToLastMessage()
    }
    
    private func setupUI() {
        
        view.backgroundColor = UIColor(named: "Brand Color 2 Mystic")
        
        chatTextField.placeholder = "Chat"
        
        chatTextField.font = UIFont.systemFont(ofSize: 20)
        
        hideKeyboardButton.isHidden = true
        
        tableViewTopAnchor.constant = 40
        collectionView.isHidden = true
        
        studyingButton.semanticContentAttribute = UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        
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
                    collectionView.isHidden = true
                    studyingButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
                    view.layoutIfNeeded()
                } else {
                    tableViewTopAnchor.constant = 140
                    collectionView.isHidden = false
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
        
        collectionView.backgroundColor = UIColor(named: "Brand Color 2 Mystic")
        
        
    }
    
    private func showHideKeyboardButton() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.animate(withDuration: 0.5) {
                self.hideKeyboardButton.isHidden = false
            }
        }
    }
    
    private func hideHideKeyboardButton() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.animate(withDuration: 0.5) {
                self.hideKeyboardButton.isHidden = true
            }
        }
        
    }
    
    private func setupObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func scrollToLastMessage() {
        DispatchQueue.main.async { [self] in
            let indexPath = IndexPath(row: messages.count - 1, section: 0)
            tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    @objc func keyboardWillHide() {
        
        view.frame.origin.y = 0
        chatTextField.resignFirstResponder()
        hideHideKeyboardButton()
        
    }
    
    @objc func keyboardWillChange(notification: NSNotification) {
    
        if let tabBarHeight = tabBarController?.tabBar.frame.size.height,
           let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            if chatTextField.isFirstResponder {
                view.frame.origin.y = -(keyboardSize.height - tabBarHeight)
                showHideKeyboardButton()
            }
        }
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        
        if let messageBody = chatTextField.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: messageSender,
                                                                K.FStore.bodyField: messageBody]) { (error) in
                if let e = error {
                    print("Error saving data to firestore: \(e)")
                } else {
                    print("Successfully saved data")
                }
            }
        }
        //tableView.reloadData()
        
    }
    
    @IBAction func hideKeyboardButtonTapped(_ sender: UIButton) {
        
        keyboardWillHide()
        
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
        
        cell.leftImageView.image = UIImage(named: "Headshot2")
        cell.rightImageView.image = UIImage(named: "Headshot")
        
        cell.bodyLabel.text = messages[indexPath.row].body
        
        if sender == "Brian" {
            cell.rightImageView.isHidden = true
            cell.leftImageView.isHidden = false
            cell.bodyLabel.textColor = .black
            cell.messageBubble.backgroundColor = UIColor(named: "Brand Color 1 CatskillWhite")
            
            
        } else {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.bodyLabel.textColor = .white
            cell.messageBubble.backgroundColor = UIColor(named: "Brand Color 6 Blue Zodiac")
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
        
        cell.imageView.image = UIImage(named: "Headshot")
        cell.imageView.makeRounded()
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
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if textField == chatTextField {
//            chatTextField.becomeFirstResponder()
//        }
//    }
}
