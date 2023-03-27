//
//  VideosPresenter.swift
//  youtubeClon
//
//  Created by Duver on 21/3/23.
//

import Foundation

protocol VideosViewProtocol : AnyObject{
  func getVideos(videolist : [VideoModel.Item])
}


class VideosPresenter{
 private weak var delegate : VideosViewProtocol?
  private var provider : VideoProviderProtocol!
  init(delegate : VideosViewProtocol, provider: VideoProviderProtocol = VideosProvider()){
    self.provider = provider
    self.delegate = delegate
    #if DEBUG
    if MockManager.shared.runAppWithMock{
      self.provider = VideosProviderMock()
    }
    #endif
  }
  
  @MainActor
  func getVideos() async{
    do {
      let videos = try await  provider.getVideos(channelId: Constants.channelId).items
      delegate?.getVideos(videolist: videos)
    } catch  {
      debugPrint(error.localizedDescription)
    }
    
  }
}
