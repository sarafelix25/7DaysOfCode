//
//  MovieDetailViewController.swift
//  MovieList
//
//  Created by Sara Felix on 03/09/23.
//

import UIKit

class MovieDetailViewController: UIViewController {
    private var movie: Movie
    
    private lazy var titleDetail: UILabel = {
        let titleDetail = UILabel()
        titleDetail.translatesAutoresizingMaskIntoConstraints = false
        titleDetail.text = movie.title
        titleDetail.textAlignment = .center
        titleDetail.numberOfLines = 0
        titleDetail.textColor = .white
        titleDetail.font = .systemFont(ofSize: 28, weight: .bold)
        return titleDetail
    }()
    
    private lazy var titleAverage: UILabel = {
        let titleAverage = UILabel()
        titleAverage.translatesAutoresizingMaskIntoConstraints = false
        titleAverage.font = .systemFont(ofSize: 16, weight: .medium)
        titleAverage.text = "Classificação dos usuários: \(movie.vote_average)"
        titleAverage.textAlignment = .center
        titleAverage.textColor = .white
        titleAverage.numberOfLines = 0
        return titleAverage
    }()
    
    private lazy var overview: UILabel = {
        let overview = UILabel()
        overview.translatesAutoresizingMaskIntoConstraints = false
        overview.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        overview.text = movie.overview
        overview.numberOfLines = 0
        overview.textAlignment = .justified
        overview.textColor = .white.withAlphaComponent(0.75)
        var paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 0.8
        return overview
    }()
    
    private lazy var imagePoster: UIImageView = {
        let imagePoster = UIImageView()
        imagePoster.translatesAutoresizingMaskIntoConstraints = false
        imagePoster.layer.cornerRadius = 32
        imagePoster.layer.masksToBounds = true
        return imagePoster
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBackground()
        setLayout()
        setImage(from: movie.poster_path, imageView: imagePoster)
    }
    
    private func setLayout() {
        navigationController?.navigationBar.tintColor = UIColor.white
        view.addSubview(titleDetail)
        view.addSubview(imagePoster)
        view.addSubview(titleAverage)
        view.addSubview(overview)
        
        NSLayoutConstraint.activate([
            
            titleDetail.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32.0),
            titleDetail.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            titleDetail.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            imagePoster.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagePoster.widthAnchor.constraint(equalToConstant: 192.0),
            imagePoster.heightAnchor.constraint(equalToConstant: 264.0),
            imagePoster.topAnchor.constraint(equalTo: titleDetail.bottomAnchor, constant: 32.0),
            
            titleAverage.topAnchor.constraint(equalTo: imagePoster.bottomAnchor, constant: 32.0),
            titleAverage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            titleAverage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            
            overview.topAnchor.constraint(equalTo: titleAverage.bottomAnchor, constant: 32.0),
            overview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -27),
            overview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 27),
        ])
    }
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MovieDetailViewController {
    func setImage(from url: String, imageView: UIImageView) {
        guard let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(url)") else {return}
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else {return}
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                imageView.image = image
            }
        }
    }
}
