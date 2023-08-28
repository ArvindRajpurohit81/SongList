//
//  MoviewListingViewController.swift
//  MoviePlayer
//
//  Created by arvind Rajpurohit on 28/08/23.
//

import UIKit

class MoviewListingViewController: UIViewController {

    @IBOutlet weak var tblvwMovie: UITableView!
    private let viewModel = MovieListingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Movies"
        tblvwMovie.delegate = self
        tblvwMovie.dataSource = self
        tblvwMovie.rowHeight = UITableView.automaticDimension
        tblvwMovie.estimatedRowHeight = UITableView.automaticDimension
    }
}

extension MoviewListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getMovies().count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell")
        let obj = viewModel.getMovie(index: indexPath.row)
        cell?.textLabel?.text = obj.title
        cell?.detailTextLabel?.text = obj.subtitle
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = MovieDetailViewController()
        viewController.dataSource = viewModel.getMovie(index: indexPath.row)
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
}
