//
//  SavedFilterTabsControl.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 30/04/2026.
//

import Foundation
import UIKit
import SnapKit

class SavedFilterTabsControl: UIView {

    private let tabTitles: [String] = ["All Items", "Stays", "Flights", "Lists", "Itinerary"]
    private var selectedIndex: Int = 0
    private var pills: [UIView] = []
    private var labels: [UILabel] = []

    var onTabSelected: ((Int) -> Void)?

//ELEMENTS
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.contentInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        return scroll
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        return stack
    }()

    private func createTabPill(title: String) -> UIView {
        let pill = UIView()
        pill.layer.cornerRadius = 20
        pill.clipsToBounds = true
        pill.isUserInteractionEnabled = true

        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        label.text = title

        pill.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(18)
        }

        pill.snp.makeConstraints { make in
            make.height.equalTo(40)
        }

        let tap = UITapGestureRecognizer(target: self, action: #selector(pillTapped(_:)))
        pill.addGestureRecognizer(tap)

        labels.append(label)
        return pill
    }

    private func applySelectionStyle(to index: Int, selected: Bool) {
        let pill = pills[index]
        let label = labels[index]
        pill.backgroundColor = selected
            ? UIColor(hex: Colors.primary)
            : UIColor(hex: Colors.neutral200)
        label.textColor = selected
            ? UIColor(hex: Colors.white)
            : UIColor(hex: Colors.neutral700)
    }

//INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//UI SETUP
    private func setupUI() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)

        for title in tabTitles {
            let pill = createTabPill(title: title)
            pills.append(pill)
            stackView.addArrangedSubview(pill)
        }

        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(40)
        }

        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }

        for index in pills.indices {
            applySelectionStyle(to: index, selected: index == selectedIndex)
        }
    }

//ACTIONS
    @objc private func pillTapped(_ gesture: UITapGestureRecognizer) {
        guard let pill = gesture.view,
              let index = pills.firstIndex(of: pill),
              index != selectedIndex else { return }
        select(index: index)
    }

    private func select(index: Int) {
        let previousIndex = selectedIndex
        selectedIndex = index

        UIView.animate(withDuration: 0.22,
                       delay: 0,
                       options: [.curveEaseInOut],
                       animations: {
            self.applySelectionStyle(to: previousIndex, selected: false)
            self.applySelectionStyle(to: index, selected: true)
        })

        onTabSelected?(index)
    }
}
