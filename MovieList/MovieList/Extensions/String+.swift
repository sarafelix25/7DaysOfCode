//
//  String+.swift
//  MovieList
//
//  Created by Sara Batista dos Santos Felix on 1/29/23.
//

import UIKit

extension String {
    func formatDate() -> Self {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        let showDate = inputFormatter.date(from: self)
        guard let showDate = showDate else {
            return "Não foi possível obter a data"
        }
        inputFormatter.dateFormat = "dd/MM/yy"
        return inputFormatter.string(from: showDate)
    }
}
