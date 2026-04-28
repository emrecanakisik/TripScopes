//
//  BookingHotelCardView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 27/04/2026.
//

import Foundation
import UIKit
import SnapKit

class BookingHotelCardView: UIView {

    private let cardPadding: CGFloat = 20

//ELEMENTS
    //IMAGE
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor(hex: Colors.tertiary400)
        imageView.clipsToBounds = true
        return imageView
    }()

    //INFO
    private lazy var hotelNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor(hex: Colors.tertiary)
        return label
    }()

    private lazy var locationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "mappin.and.ellipse")
        imageView.tintColor = UIColor(hex: Colors.tertiary600)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = UIColor(hex: Colors.tertiary600)
        return label
    }()

    private lazy var locationStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [locationIcon, locationLabel])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 4
        return stack
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = UIColor(hex: Colors.primary700)
        label.textAlignment = .center
        return label
    }()

    private lazy var statusBadgeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.primary100)
        view.layer.cornerRadius = 10
        return view
    }()

    //CHECK-IN / CHECK-OUT
    private func makeGridTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        label.textColor = UIColor(hex: Colors.tertiary600)
        return label
    }

    private func makeGridValueLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = UIColor(hex: Colors.tertiary800)
        return label
    }

    private func makeGridStack(_ subviews: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }

    private lazy var checkInTitle: UILabel = makeGridTitleLabel()
    private lazy var checkInValue: UILabel = makeGridValueLabel()
    private lazy var checkInStack: UIStackView = makeGridStack([checkInTitle, checkInValue])

    private lazy var checkOutTitle: UILabel = makeGridTitleLabel()
    private lazy var checkOutValue: UILabel = makeGridValueLabel()
    private lazy var checkOutStack: UIStackView = makeGridStack([checkOutTitle, checkOutValue])

    //BOTTOM
    private lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.neutral200)
        return view
    }()

    private lazy var roomIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "door.left.hand.closed")
        imageView.tintColor = UIColor(hex: Colors.primary)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var roomTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textColor = UIColor(hex: Colors.tertiary700)
        return label
    }()

    private lazy var detailsButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0)
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            return outgoing
        }
        let button = UIButton(configuration: config)
        button.setTitleColor(UIColor(hex: Colors.primary), for: .normal)
        button.contentHorizontalAlignment = .trailing
        return button
    }()

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
        backgroundColor = UIColor(hex: Colors.white)
        layer.cornerRadius = 32
        clipsToBounds = true

        imageView.image = UIImage(systemName: "building.2")

        hotelNameLabel.text = "Hotel Le Bristol"
        locationLabel.text = "Paris, France"
        statusLabel.text = "CONFIRMED"

        checkInTitle.text = "CHECK-IN"
        checkInValue.text = "Oct 24, 2023"
        checkOutTitle.text = "CHECK-OUT"
        checkOutValue.text = "Oct 29, 2023"

        roomTypeLabel.text = "Deluxe King Room"
        detailsButton.setTitle("Details", for: .normal)
        detailsButton.addAction(UIAction(handler: { _ in
            print("Details tapped")
        }), for: .touchUpInside)

        statusBadgeView.addSubview(statusLabel)

        addSubview(imageView)
        addSubview(hotelNameLabel)
        addSubview(locationStack)
        addSubview(statusBadgeView)

        addSubview(checkInStack)
        addSubview(checkOutStack)

        addSubview(divider)
        addSubview(roomIcon)
        addSubview(roomTypeLabel)
        addSubview(detailsButton)

        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(imageView.snp.width).multipliedBy(9.0 / 16.0)
        }

        statusLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(4)
            make.leading.trailing.equalToSuperview().inset(10)
        }

        hotelNameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(cardPadding)
        }

        statusBadgeView.snp.makeConstraints { make in
            make.centerY.equalTo(hotelNameLabel)
            make.trailing.equalToSuperview().inset(cardPadding)
            make.leading.greaterThanOrEqualTo(hotelNameLabel.snp.trailing).offset(8)
        }

        locationIcon.snp.makeConstraints { make in
            make.width.height.equalTo(14)
        }

        locationStack.snp.makeConstraints { make in
            make.top.equalTo(hotelNameLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().inset(cardPadding)
            make.trailing.lessThanOrEqualToSuperview().inset(cardPadding)
        }

        checkInStack.snp.makeConstraints { make in
            make.top.equalTo(locationStack.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(cardPadding)
            make.width.equalTo(checkOutStack)
        }

        checkOutStack.snp.makeConstraints { make in
            make.top.equalTo(checkInStack)
            make.leading.equalTo(checkInStack.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(cardPadding)
        }

        divider.snp.makeConstraints { make in
            make.top.equalTo(checkInStack.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(cardPadding)
            make.height.equalTo(1)
        }

        roomIcon.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(cardPadding)
            make.width.height.equalTo(16)
            make.bottom.equalToSuperview().inset(cardPadding)
        }

        roomTypeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(roomIcon)
            make.leading.equalTo(roomIcon.snp.trailing).offset(8)
        }

        detailsButton.snp.makeConstraints { make in
            make.centerY.equalTo(roomIcon)
            make.trailing.equalToSuperview().inset(cardPadding)
            make.leading.greaterThanOrEqualTo(roomTypeLabel.snp.trailing).offset(8)
        }
    }
}
