//
//  SavedViewDataSource.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 30/04/2026.
//

import Foundation
import UIKit

extension SavedView: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 0  // SavedFilterTabsCell
        case 1: return 0  // DreamStaysCell
        case 2: return 0  // TrackedFlightsCell
        case 3: return 0  // CuratedListsCell
        default: return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
