//
//  SuperheroViewController.swift
//  Flix_Part1
//
//  Created by MacBookPro9 on 9/24/18.
//  Copyright © 2018 MacBookPro9. All rights reserved.
//

import UIKit

class SuperheroViewController: UIViewController, UICollectionViewDataSource{
    
    // ----------------Methods---------------
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let movie = movies[indexPath.item]
    if let PosterPathString = movie["poster_path"] as? String{
        let baseURLString =  "https://image.tmdb.org/t/p/w500"
        let posterURL = URL(string: baseURLString + PosterPathString)!
            cell.posterImageView.af_setImage(withURL: posterURL)
        }
        
        return cell
    }
    
    
    func fetchMovies(){
        
        //---Creating url---
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        //---creating a request---
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        //---coordonate task of network request
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        //---creating a task to get the data---
        let task = session.dataTask(with: request) { (data, response, error) in
            
            // This will run when the network request returns
            if let error = error {
                
                print(error.localizedDescription)
            } else if let data = data {
                
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                
                // TODO: Get the array of movies
                let movies = dataDictionary["results"] as! [[String: Any]]
                self.movies = movies
                
                
                
                // TODO: Store the movies in a property to use elsewhere
                
                // TODO: Reload your table view data
                self.CollectionView.reloadData()
                
                //-------------stop the refresh----------
                
                
                //stop animating
                
                
            }
        }
        task.resume()
    }
    
    //--------End of Methods---------
    @IBOutlet weak var CollectionView: UICollectionView!
    var movies: [[String: Any]] = [];
    var filteredMovies: [[String: Any]] = [];
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let layout = CollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        let cellsPerline: CGFloat = 2
        let interItemSpacingTotal = layout.minimumInteritemSpacing * (cellsPerline - 1) 
        let width = CollectionView.frame.size.width / cellsPerline - interItemSpacingTotal / cellsPerline
        layout.itemSize = CGSize(width: width, height: width * 3 / 2)
        
        CollectionView.dataSource = self
        
        //call movies
        fetchMovies()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        
        let cell = sender as! UICollectionViewCell
        if let indexPath = CollectionView.indexPath(for: cell){
            let movie = movies[indexPath.row]
            let detailsViewController = segue.destination as! DetailsViewController
            detailsViewController.movie = movie
        // Pass the selected object to the new view controller.
    }
    

  }
}

