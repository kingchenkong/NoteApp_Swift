//
//  NoteViewController.swift
//  NoteApp_Swift
//
//  Created by 陳維漢 on 2016/10/6.
//  Copyright © 2016年 陳維漢. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBOutlet
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!

    // MARK: - IBAction
    @IBAction func done(_ sender: AnyObject) {
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func camera(_ sender: AnyObject) {
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
