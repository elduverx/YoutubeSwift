//
//  VideoCell.swift
//  youtubeClon
//
//  Created by Duver on 27/2/23.
//

import UIKit

class VideoCell: UITableViewCell {

  @IBOutlet weak var dotsImage: UIImageView!
  @IBOutlet weak var viewCountLabel: UILabel!
  @IBOutlet weak var channelName: UILabel!
  @IBOutlet weak var titleName: UILabel!
  @IBOutlet weak var videoImage: UIImageView!
  override func awakeFromNib() {
        super.awakeFromNib()
      
    }
  
  private func configView(){
    selectionStyle = .none
  }
  
  func configCell(model: Any){
    if let video = model as? VideoModel.Item{
      if let imageUrl = video.snippet?.thumbnails.medium?.url, let url = URL(string: imageUrl){
        videoImage.kf.setImage(with: url)
      }
      titleName.text = video.snippet?.title ?? ""
      channelName.text = video.snippet?.channelTitle ?? ""
      viewCountLabel.text = "\(video.statistics?.viewCount ?? "0") views · 3 months ago"
     dots()
      
    }else if let playlistItems = model as? PlaylistItemsModel.Item{
      if let imageUrl = playlistItems.snippet.thumbnails.medium?.url, let url = URL(string: imageUrl){
        videoImage.kf.setImage(with: url)
      }
      titleName.text = playlistItems.snippet.title
      channelName.text = playlistItems.snippet.channelTitle
      viewCountLabel.text = "332 views · 3 months ago"
     dots()
      }
    
  }
  func dots(){
    dotsImage.image = UIImage(named: "dots")?.withRenderingMode(.alwaysTemplate)
    dotsImage.tintColor = UIColor(named: "whiteColor")
  }
    
}
