//
//  CreateMovie.swift
//  My-Favorite-Movies
//
//  Created by Shawn on 1/10/16.
//  Copyright © 2016 Shawn. All rights reserved.
//

import UIKit
import CoreData

class CreateMovie: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UITextField!
    @IBOutlet weak var plotLbl: UITextField!
    @IBOutlet weak var descLbl: UITextField!
    @IBOutlet weak var urlLbl: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        saveBtn.layer.cornerRadius = 10
        saveBtn.clipsToBounds = true
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String: AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImg.image = image
    }
    
    @IBAction func addImage(sender:AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
        
    @IBAction func SaveMovie(sender: AnyObject!) {
        if let title = titleLbl.text where title != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext //pulls managed object context property from application delegate
            let entity = NSEntityDescription.entityForName("Movies", inManagedObjectContext: context)!
            let movie = Movies(entity: entity, insertIntoManagedObjectContext: context) //created movie with entity Movies
            
            movie.title = title
            movie.plot = plotLbl.text
            movie.desc = descLbl.text
            movie.link = urlLbl.text
            movie.setMovieImage(postImg.image!)
            
            context.insertObject(movie)
            
            do {
                try context.save() //anything in context save it
            } catch{
                print("Could not save Recipe")
                
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
        
     
        

   

}
