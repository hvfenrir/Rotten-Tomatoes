//
//  MovieTableViewCell.swift
//  Rotten Tomatoes
//
//  Created by HV Fenrir on 11/18/15.
//  Copyright © 2015 HV Fenrir. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieNameView: UILabel!
    @IBOutlet weak var movieSmallDetailView: UITextView!
    @IBOutlet weak var moviePhotoView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
