//
//  NotesController.swift
//  SwiftNotes
//
//  Created by Tri Vuong on 3/15/19.
//  Copyright © 2019 Tri Vuong. All rights reserved.
//

import Foundation
import UIKit
import FontAwesome_swift

class NotesController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var itemsToLoad : [String] = [];
    var notesTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsToLoad.append(contentsOf: ["One", "Two", "Three", "Four", "Five"])
        self.title = "Notes"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: String.fontAwesomeIcon(name: .edit),
            style: .done,
            target: self,
            action: #selector(compose)
        )
        self.navigationItem.rightBarButtonItem?.setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont.fontAwesome(ofSize: 16, style: .solid),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ], for: UIControl.State.normal)
    }
    
    @objc public func compose() {
        let composeController = ComposeController()
        self.navigationController?.pushViewController(composeController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        notesTableView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        notesTableView.dataSource = self
        notesTableView.delegate = self
        
        notesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "notesCell")
        
        self.view.addSubview(notesTableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsToLoad.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath)
        
        cell.textLabel?.text = itemsToLoad[indexPath.row]
        
        return cell
    }
}
