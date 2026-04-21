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
        return 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        default: return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BookingCardCell.reuseID,
                for: indexPath
            ) as! BookingCardCell

            cell.configure(
                flight: viewModel.flightInfo,
                hotel: viewModel.hotelInfo
            )
            return cell
        }

        return UICollectionViewCell()
    }
}
