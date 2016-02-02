//
//  DetailVCViewController.swift
//  My-Favorite-Movies
//
//  Created by Shawn on 1/11/16.
//  Copyright © 2016 Shawn. All rights reserved.
//

import UIKit
import CoreData

class DetailVCViewController: UIViewController{
    
    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var detailtitleLbl: UILabel!
    @IBOutlet weak var detailplotLbl:  UILabel!
    @IBOutlet weak var detaildescLbl:  UILabel!
    @IBOutlet weak var detailurlLbl:  UILabel!
    
    var transferTitle = ""
    var transferDesc = ""
    var transferPlot = ""
    var transferURL = ""
    var transferImg = UIImage!()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        detaildescLbl.text = transferDesc
        detailplotLbl.text = transferPlot
        detailtitleLbl.text = transferTitle
        detailurlLbl.text = transferURL
        detailImg.image = transferImg
    }
}


    
    
    
    

    
    
   
    


    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


