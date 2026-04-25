//
//  ExploreViewDataSource.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 21/04/2026.
//

import Foundation
import UIKit

let viewModel = ExploreViewModel()

extension ExploreView: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 1  // ExploreHeaderCell (title + search bar)
        case 1: return 1  // BookingCardCell
        case 2: return 1  // AISuggestionsCell
        default: return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ExploreHeaderCell.reuseID,
                for: indexPath
            ) as! ExploreHeaderCell
            cell.onSearchTextChanged = { [weak self] text in
                self?.onSearchTextChanged?(text)
            }
            cell.onSearchSubmitted = { [weak self] text in
                self?.onSearchSubmitted?(text)
            }
            return cell

        case 1:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BookingCardCell.reuseID,
                for: indexPath
            ) as! BookingCardCell
            cell.configure(
                flight: viewModel.flightInfo,
                hotel: viewModel.hotelInfo
            )
            return cell

        case 2:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ExploreAISuggestionsCell.reuseID,
                for: indexPath
            ) as! ExploreAISuggestionsCell
            return cell

        default:
            return UICollectionViewCell()
        }
    }
}
