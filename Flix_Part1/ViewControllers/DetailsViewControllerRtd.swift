//
//  DetailsViewControllerRtd.swift
//  Flix_Part1
//
//  Created by MacBookPro9 on 9/23/18.
//  Copyright © 2018 MacBookPro9. All rights reserved.
//

import UIKit

enum MovieKey{
    static let title = "title"
    static let backdropPath = "backdrop_path"
    static let posterPath = "poster_path"
}

class DetailsViewControllerRtd: UIViewController {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var backDropImage: UIImageView!
    
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    var movie: [String: Any]?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        if let movie = movie{
            TitleLabel.text = movie[MovieKeys.title] as? String
            releaseLabel.text = movie["release_date"] as? String
            overviewLabel.text = movie["overview"] as? String
            
            let backdropPathString = movie[MovieKeys.backdropPath] as! String
            let postePathString = movie [MovieKeys.posterPath] as! String
            
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            
            let backdropURL = URL(string: baseURLString + backdropPathString)!
            backDropImage.af_setImage(withURL: backdropURL)
            
            let posterPathURL = URL(string: baseURLString + postePathString)!
            posterImage.af_setImage(withURL: posterPathURL)
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
