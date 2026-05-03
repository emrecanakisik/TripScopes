//
//  ProfileViewDataSource.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 02/05/2026.
//

import Foundation
import UIKit

extension ProfileView: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        6
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 2, 3, 4, 5: return 1
        default: return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: ProfileHeaderCell.reuseID,
                for: indexPath
            )
        case 1:
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: ProfileStatsCell.reuseID,
                for: indexPath
            )
        case 2:
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: ProfileMembershipCell.reuseID,
                for: indexPath
            )
        case 3:
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: ProfileQuickAccessCell.reuseID,
                for: indexPath
            )
        case 4:
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: ProfileGetHelpCell.reuseID,
                for: indexPath
            )
        case 5:
            return collectionView.dequeueReusableCell(
                withReuseIdentifier: ProfileSignOutCell.reuseID,
                for: indexPath
            )
        default:
            return UICollectionViewCell()
        }
    }
}
