//
//  SecondViewController.swift
//  Flix_Part1
//
//  Created by MacBookPro9 on 9/16/18.
//  Copyright © 2018 MacBookPro9. All rights reserved.
//

import UIKit
import AlamofireImage

class RatedMoviesController: UIViewController , UITableViewDataSource{
    
    //-------------------METHODS--------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RatedCell", for: indexPath) as! RatedCell
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let overview =  movie["overview"] as! String
        let ratedMov = movie["vote_average"] as! Double
        cell.rtdOverview.text = overview
        cell.rateGiven = ratedMov
        cell.rtdTitle.text = title
        
        //request the images
        let posterPathString = movie["poster_path"] as! String
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        let posterURL = URL(string: baseURLString + posterPathString)!
        cell.postImageView.af_setImage(withURL: posterURL)
        
        
        return cell
    }
    
    func fetchRatedMovies(){
        //---Creating url---
        let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        //---creating a request---
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        //---coordonate task of network request---
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        //---creating a task to get the data---
        let task = session.dataTask(with: request) { (data, response, error) in
            
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                let movies = dataDictionary["results"] as! [[String: Any]]
                // TODO: Get the array of movies
                self.movies = movies
                
                // TODO: Store the movies in a property to use elsewhere
                
                // TODO: Reload your table view data
                self.rtdTableView.reloadData()
                
                //Stop refreshing
                self.refreshControl.endRefreshing()
                
            }
        }
        task.resume()
    }
    @objc func didPullToRefresh(_ refreshControl:  UIRefreshControl){
                    fetchRatedMovies()
    }
    //-------------------------------------ENDofMETHODS----------------------------

    @IBOutlet weak var rtdTableView: UITableView!
    var movies: [[String: Any]] = []
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //----------refresh control instanciation----------
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(RatedMoviesController.didPullToRefresh(_:)), for: .valueChanged)
        
        // Do any additional setup after loading the view, typically from a nib.
        rtdTableView.dataSource = self
        rtdTableView.rowHeight = 210
        rtdTableView.estimatedRowHeight = 250
        
        //inserting subviews
        rtdTableView.insertSubview(refreshControl, at: 0)
        
        fetchRatedMovies()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

