//
//  MovieModel.swift
//  MoviePlayer
//
//  Created by arvind Rajpurohit on 28/08/23.
//

import Foundation
struct MovieModel {
    var title, subtitle: String
    var url: [MovieUrl]
}


struct MovieUrl {
    var url: String
}
