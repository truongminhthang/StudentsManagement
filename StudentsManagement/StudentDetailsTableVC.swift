//
//  StudentDetailsTableVC.swift
//  StudentsManagement
//
//  Created by Trương Thắng on 3/27/17.
//  Copyright © 2017 Trương Thắng. All rights reserved.
//

import UIKit

class StudentDetailsTableVC: UITableViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var chosenImageView: ImageView! {
        didSet {
            chosenImageView.contentMode = .scaleAspectFill
            chosenImageView.borderColor = .gray
        }
    }
    
    var chosenImage: UIImage? {
        didSet {
            chosenImageView.image = chosenImage
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveStudent() {
        if let newStudent =  Student(name: nameTextField.text ?? "", phoneNumber: phoneNumberTextField.text ?? "", image: chosenImage) {
            DataServices.shared.appendStudent(student: newStudent)
            cancel(UIBarButtonItem())
        } else {
            showWrongDataAlert()
        }
        
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The MealViewController is not inside a navigation controller.")
        }
    }
    
    func showWrongDataAlert() {
        let title = "Wrong input!"
        let message = "Please insert name's characters > 0, and phonenumber's characters> 9 "
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addImage(_ sender: Any) {
    
        let title = "Action sheet"
        let message = "What would you like to do? "
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Pick Photo", style: .default, handler: pickPhoto))
        
        alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: takePhoto))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func takePhoto(action: UIAlertAction) -> Void {
        unowned let weakself = self
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = weakself as UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = true
            weakself.present(imagePicker, animated: true, completion: nil)
        } else {
            
        }
    }
    
    func pickPhoto(action: UIAlertAction) -> Void {
        unowned let weakself = self
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = weakself as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
        imagePicker.allowsEditing = true
        weakself.present(imagePicker, animated: true, completion: nil)
    }
    
    
}

// MARK: - UIImagePickerControllerDelegate

extension StudentDetailsTableVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        chosenImage = info[UIImagePickerControllerEditedImage] as? UIImage //2
        dismiss(animated:true, completion: nil) //5
    }
    
}
