//
//  Network.swift
//  MovieList
//
//  Created by Sara Batista dos Santos Felix on 1/29/23.
//

import UIKit

class Network : UIImageView {
    static let shared = Network()
    
    func fetchPopularMovies(_ completion: @escaping ([Movie]) -> ()) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=d8b5cf6c67f7e8e12cd083267f095929&language=pt-BR&page=1") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let result = try JSONDecoder().decode(MovieResults.self, from: data)
                completion(result.results)
            } catch {
                print("Não foi possível decodificar o JSON")
            }
        }
        task.resume()
    }
}
