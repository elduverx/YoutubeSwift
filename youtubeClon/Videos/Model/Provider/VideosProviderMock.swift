//
//  VideosProviderMock.swift
//  youtubeClon
//
//  Created by Duver on 21/3/23.
//

import Foundation




class VideosProviderMock: VideoProviderProtocol{
  func getVideos( channelId: String) async throws -> VideoModel {
    guard let model = Utils.parseJson(jsonName: "videosSearch", model: VideoModel.self) else{
      throw NetworkError.jsonDecoder
    }
    return model
  }
  
 
  
}
