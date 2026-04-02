//
//  ExploreViewModel.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 02/04/2026.
//

import Foundation

class ExploreViewModel {
    
    var onSearchResultsUpdated: (([String]) -> Void)?
    
    private(set) var currentQuery: String = ""
    
    func Search(for query: String) {
        currentQuery = query
        print("ViewModel search: \(query)")
    }
    
    func ClearSearch() {
        currentQuery = ""
        onSearchResultsUpdated?([])
        print("ViewModel clear search")
    }
    
    
    
}
