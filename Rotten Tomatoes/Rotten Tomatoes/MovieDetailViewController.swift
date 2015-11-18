//
//  MovieDetailViewController.swift
//  Rotten Tomatoes
//
//  Created by HV Fenrir on 11/18/15.
//  Copyright © 2015 HV Fenrir. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var photo: NSDictionary?
    
    @IBOutlet weak var movieView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieView.delegate = self
        movieView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("photoDetailCell") as! MovieDetailViewCell

        let imgUrl = photo!.valueForKeyPath("posters.thumbnail") as! String
        cell.movieDetailphotoView.setImageWithURL(NSURL(string: imgUrl)!)
        
        return cell

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
