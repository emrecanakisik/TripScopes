//
//  BookingsViewDataSource.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 27/04/2026.
//

import Foundation
import UIKit

extension BookingsView: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 1  // BookingsTabsCell
        case 1: return 0  // UpcomingFlightsCell
        case 2: return 0  // AccommodationCell
        case 3: return 0  // ConciergeBannerCell
        case 4: return 0  // UpgradeBannerCell
        default: return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BookingsTabsCell.reuseID,
                for: indexPath
            )
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
