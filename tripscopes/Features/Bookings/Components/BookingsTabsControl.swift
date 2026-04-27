//
//  BookingsTabsControl.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 27/04/2026.
//

import Foundation
import UIKit
import SnapKit

class BookingsTabsControl: UIView {

    private let tabTitles: [String] = ["Upcoming", "Past", "Cancelled"]
    private var selectedIndex: Int = 0
    private var pills: [UIView] = []
    private var labels: [UILabel] = []

//ELEMENTS
    private lazy var trackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.neutral200)
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()

    private lazy var selectionIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.white)
        view.layer.cornerRadius = 12
        return view
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 4
        return stack
    }()

    private func createTabPill(title: String) -> UIView {
        let pill = UIView()
        pill.backgroundColor = .clear
        pill.isUserInteractionEnabled = true

        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        label.text = title
        label.textColor = UIColor(hex: Colors.neutral600)

        pill.addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        let tap = UITapGestureRecognizer(target: self, action: #selector(pillTapped(_:)))
        pill.addGestureRecognizer(tap)

        labels.append(label)
        return pill
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
        addSubview(trackView)
        trackView.addSubview(selectionIndicator)
        trackView.addSubview(stackView)

        for title in tabTitles {
            let pill = createTabPill(title: title)
            pills.append(pill)
            stackView.addArrangedSubview(pill)
        }

        trackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(48)
        }

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(4)
        }

        selectionIndicator.snp.makeConstraints { make in
            make.edges.equalTo(pills[selectedIndex])
        }

        labels[selectedIndex].textColor = UIColor(hex: Colors.primary)
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

        selectionIndicator.snp.remakeConstraints { make in
            make.edges.equalTo(pills[index])
        }

        labels[previousIndex].textColor = UIColor(hex: Colors.neutral600)
        labels[index].textColor = UIColor(hex: Colors.primary)

        UIView.animate(withDuration: 0.22,
                       delay: 0,
                       options: [.curveEaseInOut],
                       animations: {
            self.layoutIfNeeded()
        })
    }
}
