//
//  MovieListingViewModel.swift
//  MoviePlayer
//
//  Created by arvind Rajpurohit on 28/08/23.
//
import Foundation

class MovieListingViewModel {
    
    
    
    
    private let arrMovie = [MovieModel(title: "Movie1", subtitle: "Bollywoood Movie rocks", url: [MovieUrl(url: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
                                                                                                  MovieUrl(url: "http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3") ,
                                                                                                MovieUrl(url: "http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Sevish_-__nbsp_.mp3") ]), MovieModel(title: "Movie2", subtitle: "Hollywoood Movie rocks", url: []), MovieModel(title: "Movie3", subtitle: "Tollywoood Movie rocks", url: []), MovieModel(title: "Movie4", subtitle: "Unkown", url: [])]
    
    
    func getMovies() -> [MovieModel] {
        return arrMovie
    }
    
    func getMovie(index: Int) -> MovieModel {
        return arrMovie[index]
    }
    
}
