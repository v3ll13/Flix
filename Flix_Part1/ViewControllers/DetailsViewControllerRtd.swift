//
//  DetailsViewControllerRtd.swift
//  Flix_Part1
//
//  Created by MacBookPro9 on 9/23/18.
//  Copyright © 2018 MacBookPro9. All rights reserved.
//

import UIKit

class DetailsViewControllerRtd: UIViewController {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var backDropImage: UIImageView!
    
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
