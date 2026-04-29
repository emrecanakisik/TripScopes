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
        case 1: return 1  // FlightsCell
        case 2: return 1  // AccommodationCell
        case 3: return 1  // BookingBannerCell (.concierge)
        case 4: return 1  // BookingBannerCell (.upgrade)
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
        case 1:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BookingsFlightsCell.reuseID,
                for: indexPath
            )
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AccommodationCell.reuseID,
                for: indexPath
            )
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BookingBannerCell.reuseID,
                for: indexPath
            ) as! BookingBannerCell
            cell.configure(with: .concierge)
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BookingBannerCell.reuseID,
                for: indexPath
            ) as! BookingBannerCell
            cell.configure(with: .upgrade)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}
