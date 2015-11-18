//
//  MoviesViewController.swift
//  Rotten Tomatoes
//
//  Created by HV Fenrir on 11/17/15.
//  Copyright © 2015 HV Fenrir. All rights reserved.
//

import UIKit
import AFNetworking

class MoviesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var movieTableView: UITableView!
    var photos = [NSDictionary]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        // Do any additional setup after loading the view.
        let url = NSURL(string: "https://coderschool-movies.herokuapp.com/movies?api_key=xja087zcvxljadsflh214")!
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url) { (data, response, error) -> Void in
            guard error == nil else {
                print("error loading from URL", error!)
                return
            }
            let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
            self.photos = json["movies"] as! [NSDictionary]
            print("photos",self.photos)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.movieTableView.reloadData()
            })
        }
        
        task.resume()
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCellWithIdentifier("moviePhotoView") as! MovieTableViewCell
        let photo = photos[indexPath.row]
        let imgUrl = photo.valueForKeyPath("posters.thumbnail") as! String
        let nameMovie = photo.valueForKeyPath("title") as! String
        let detailMovie = photo.valueForKeyPath("synopsis") as! String
        cell.movieNameView.text = nameMovie
        cell.movieSmallDetailView.text = detailMovie
        cell.moviePhotoView.setImageWithURL(NSURL(string: imgUrl)!)
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! MovieDetailViewController
        let indexPath = movieTableView.indexPathForCell(sender as! UITableViewCell)!
        
        
        let photo = photos[indexPath.row]
        vc.photo = photo
        
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
