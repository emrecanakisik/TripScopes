//
//  BookingsViewLayout.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 27/04/2026.
//

import Foundation
import UIKit

extension BookingsView {

    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            switch sectionIndex {
            case 0: return self.makeTabsSection()
            case 1: return self.makeBookingsFlightsCell()
            case 2: return self.makeAccommodationSection()
            case 3: return self.makeConciergeBannerSection()
            case 4: return self.makeUpgradeBannerSection()
            default: return self.makeTabsSection()
            }
        }
    }

    // MARK: - Tabs Section (Upcoming / Past / Cancelled)
    func makeTabsSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(56)
            )
        )

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(56)
            ),
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 0, bottom: 16, trailing: 0)
        return section
    }

    // MARK: - Flights Section
    func makeBookingsFlightsCell() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(460)
            )
        )

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(460)
            ),
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 0, bottom: 16, trailing: 0)
        return section
    }

    // MARK: - Accommodation Section
    func makeAccommodationSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(380)
            )
        )

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(380)
            ),
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 0, bottom: 16, trailing: 0)
        return section
    }

    // MARK: - Concierge Banner Section
    func makeConciergeBannerSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(160)
            )
        )

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(160)
            ),
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 0, bottom: 16, trailing: 0)
        return section
    }

    // MARK: - Upgrade Banner Section
    func makeUpgradeBannerSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(160)
            )
        )

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(160)
            ),
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 0, bottom: 16, trailing: 0)
        return section
    }
}
