//
//  PlaylistCell.swift
//  youtubeClon
//
//  Created by Duver on 27/2/23.
//

import UIKit
import Kingfisher
class PlaylistCell: UITableViewCell {

  @IBOutlet weak var videoCountOverlay: UILabel!
  @IBOutlet weak var startPlaylist: UIView!
  @IBOutlet weak var videoImage: UIImageView!
  
  @IBOutlet weak var videoTitle: UILabel!
  
  @IBOutlet weak var dotsImage: UIImageView!
  @IBOutlet weak var videoCount: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    dots()
    
    }

  func configCell(model: PlaylistModel.Item){
    
    videoTitle.text = model.snippet.title
    videoCount.text = String(model.contentDetails.itemCount)+" videos"
    videoCountOverlay.text = String(model.contentDetails.itemCount)
    
    
    let imageUrl = model.snippet.thumbnails.medium.url
    if let url = URL(string: imageUrl) {
      videoImage.kf.setImage(with: url)
    }
  
    
  }
  func dots(){
    selectionStyle = .none
    dotsImage.image = UIImage(named: "dots")?.withRenderingMode(.alwaysTemplate)
    dotsImage.tintColor = UIColor(named: "whiteColor")
  }
    
    
}
