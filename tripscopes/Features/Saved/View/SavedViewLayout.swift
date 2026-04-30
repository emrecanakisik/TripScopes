//
//  SavedViewLayout.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 30/04/2026.
//

import Foundation
import UIKit

extension SavedView {

    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            switch sectionIndex {
            case 0: return self.makeFilterTabsSection()
            case 1: return self.makeDreamStaysSection()
            case 2: return self.makeTrackedFlightsSection()
            case 3: return self.makeCuratedListsSection()
            default: return self.makeFilterTabsSection()
            }
        }
    }

    // MARK: - Filter Tabs Section
    func makeFilterTabsSection() -> NSCollectionLayoutSection {
        return makePlaceholderSection(estimatedHeight: 56)
    }

    // MARK: - Dream Stays Section
    func makeDreamStaysSection() -> NSCollectionLayoutSection {
        return makePlaceholderSection(estimatedHeight: 280)
    }

    // MARK: - Tracked Flights Section
    func makeTrackedFlightsSection() -> NSCollectionLayoutSection {
        return makePlaceholderSection(estimatedHeight: 220)
    }

    // MARK: - Curated Lists Section
    func makeCuratedListsSection() -> NSCollectionLayoutSection {
        return makePlaceholderSection(estimatedHeight: 320)
    }

    // MARK: - Helpers
    private func makePlaceholderSection(estimatedHeight: CGFloat) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(estimatedHeight)
            )
        )

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(estimatedHeight)
            ),
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 0, leading: 24, bottom: 16, trailing: 24)
        return section
    }
}
