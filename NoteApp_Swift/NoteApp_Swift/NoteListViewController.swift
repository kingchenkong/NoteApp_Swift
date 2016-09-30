//
//  NoteListViewController.swift
//  NoteApp_Swift
//
//  Created by 陳維漢 on 2016/9/30.
//  Copyright © 2016年 陳維漢. All rights reserved.
//

import UIKit

class NoteListViewController: UIViewController,UITableViewDataSource {
    // MARK: - Var
    var notes : [Note] = []
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - IBAction
    @IBAction func addNote(_ sender: AnyObject) {
        let note = Note()
        note.text = "New Note"
        
        // insertRows at the Top
        self.notes.insert(note, at: 0)
        self.tableView.insertRows(at: [NSIndexPath(row:0, section: 0) as IndexPath], with: .automatic)
        
        // insertRows at the Bottom
        //        self.notes.append(note)
        //        let indexPath = NSIndexPath(row: self.notes.count-1, section: 0)
        //        self.tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
    }
    
    
    // MARK: - initCoder
    required init?(coder aDecoder: NSCoder) {
        
        //  Demo Data
        for index in 0..<10 {
            let note = Note()
            note.text = "Note \(index)"
            self.notes.append(note)
        }
        
        
        super.init(coder: aDecoder)
    }
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.navigationItem.leftBarButtonItem = self.editButtonItem // editButton
        
    }
    
    // MARK: - reorder & Delete
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: true)
    }
    
    
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notes.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        let note = self.notes[indexPath.row]
        cell.textLabel?.text = note.text
        
        // for setEditing
        cell.showsReorderControl = true

        return cell
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let note = self.notes[sourceIndexPath.row]
        // remove -> insert
        self.notes.remove(at: sourceIndexPath.row)
        self.notes.insert(note, at: destinationIndexPath.row)
    
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            self.notes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // MARK: - didReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
