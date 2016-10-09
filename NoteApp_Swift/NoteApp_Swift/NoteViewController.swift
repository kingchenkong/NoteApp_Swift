//
//  NoteViewController.swift
//  NoteApp_Swift
//
//  Created by 陳維漢 on 2016/10/6.
//  Copyright © 2016年 陳維漢. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    // MARK: - Var
    var note : Note?
    
    // MARK: - IBOutlet
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!

    // MARK: - IBAction
    @IBAction func done(_ sender: AnyObject) {
        self.note?.text = self.textView.text
        self.note?.image = self.imageView.image
        
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func camera(_ sender: AnyObject) {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .savedPhotosAlbum
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
        
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textView.text = self.note?.text
        self.imageView.image = self.note?.image
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UIImagePickerController
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
        self.imageView.image = image
        }
        dismiss(animated: true, completion: nil)
    
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
