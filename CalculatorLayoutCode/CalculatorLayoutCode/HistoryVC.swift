//
//  HistoryVC.swift
//  CalculatorLayoutCode
//
//  Created by beqa on 16.10.24.
//

import UIKit

class HistoryVC: UIViewController {

    
       private let textView = UITextView()
       var historyEntries: [(String, String)] = []
       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .white
           setupTextView()
       }
       
       
       private func setupTextView() {
           view.addSubview(textView)
           textView.translatesAutoresizingMaskIntoConstraints = false
           textView.isEditable = false
           textView.font = UIFont.systemFont(ofSize: 18)
           textView.backgroundColor = .white
           textView.layer.cornerRadius = 10
           textView.textAlignment = .right
           var displayText = ""
                   for (historyofnum, result) in historyEntries {
                       displayText += "\(historyofnum) = \(result)\n"
                   }
            textView.text = displayText
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
            textView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
            textView.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
       }

}
