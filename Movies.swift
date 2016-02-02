//
//  Movies.swift
//  My-Favorite-Movies
//
//  Created by Shawn on 1/10/16.
//  Copyright © 2016 Shawn. All rights reserved.
//

import Foundation
import CoreData
import UIKit



class Movies: NSManagedObject {

    func setMovieImage(img: UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    func getMovieImg() -> UIImage {
        let img = UIImage(data: self.image!)!
        return img
    }
}
