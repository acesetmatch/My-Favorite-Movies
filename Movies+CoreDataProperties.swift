//
//  Movies+CoreDataProperties.swift
//  My-Favorite-Movies
//
//  Created by Shawn on 1/10/16.
//  Copyright © 2016 Shawn. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movies {

    @NSManaged var image: NSData?
    @NSManaged var link: String?
    @NSManaged var plot: String?
    @NSManaged var title: String?
    @NSManaged var desc: String?

}
