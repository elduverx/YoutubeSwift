//
//  VideosViewController.swift
//  youtubeClon
//
//  Created by Duver on 19/1/23.
//

import UIKit

class VideosViewController: UIViewController {

  
  @IBOutlet weak var tableViewVideos: UITableView!
  
  lazy var presenter = VideosPresenter(delegate: self)
  var videoList: [VideoModel.Item] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
      configTableView()
      Task{
        await presenter.getVideos()
      }
    }

  func configTableView(){
    tableViewVideos.register(cell: VideoCell.self)
    tableViewVideos.separatorColor = .clear
    tableViewVideos.delegate = self
    tableViewVideos.dataSource = self 
  }


}
extension VideosViewController: UITableViewDelegate, UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.videoList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let video = videoList[indexPath.row]
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(VideoCell.self)", for: indexPath) as? VideoCell else{
      return UITableViewCell()
    }
    cell.configCell(model: video)
    return cell
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 95.0
  }
  
  
}

extension VideosViewController : VideosViewProtocol{
  func getVideos(videolist: [VideoModel.Item]) {
    self.videoList = videolist
    tableViewVideos.reloadData()
  }
}
