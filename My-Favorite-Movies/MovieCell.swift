//
//  MovieCell.swift
//  My-Favorite-Movies
//
//  Created by Shawn on 1/10/16.
//  Copyright © 2016 Shawn. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDesc:UILabel!
    @IBOutlet weak var movieLink: UILabel!
    @IBOutlet weak var movieInfo: UIButton!
    @IBOutlet weak var movieImg: UIImageView!
 
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    

    func configureCell(movie: Movies) {
        movieTitle.text = movie.title
        movieDesc.text = movie.desc
        movieLink.text = movie.link
        movieImg.image = movie.getMovieImg()
        
    }
    

    

}
