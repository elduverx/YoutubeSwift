//
//  HomeProviderMock.swift
//  youtubeClon
//
//  Created by Duver on 9/2/23.
//

import Foundation

class HomeProviderMock: HomeProviderProtocol{
  func getVideos(searchString: String, channelId: String) async throws -> VideoModel {
    guard let model = Utils.parjseJson(jsonName: "SearchVideos", model: VideoModel.self) else{
      throw NetworkError.jsonDecoder
    }
    return model
  }
  
  func getChannel(channelId: String) async throws -> ChannelModel {
      guard let model = Utils.parjseJson(jsonName: "Channel", model: ChannelModel.self) else{
        throw NetworkError.jsonDecoder
      }
      return model
  }
  
  func getPlaylists(channelId: String) async throws -> PlaylistModel {
      guard let model = Utils.parjseJson(jsonName: "Playlists", model: PlaylistModel.self) else{
        throw NetworkError.jsonDecoder
      }
      return model
  }
  
  func getPlaylistItems(playlistId: String) async throws -> PlaylistItemsModel {
    guard let model = Utils.parjseJson(jsonName: "PlaylistsItems", model: PlaylistItemsModel.self) else{
      throw NetworkError.jsonDecoder
    }
    return model
  }
  
  
}
