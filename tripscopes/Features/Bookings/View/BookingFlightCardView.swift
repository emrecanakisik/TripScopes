//
//  BookingFlightCardView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 27/04/2026.
//

import Foundation
import UIKit
import SnapKit

class BookingFlightCardView: UIView {

    private let cardPadding: CGFloat = 20

//ELEMENTS
    //TOP
    private lazy var airlineIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "airplane")
        imageView.tintColor = UIColor(hex: Colors.primary)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var airlineIconContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.primary100)
        view.layer.cornerRadius = 20
        return view
    }()

    private lazy var routeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: Colors.tertiary)
        return label
    }()

    private lazy var airlineLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(hex: Colors.tertiary600)
        return label
    }()

    private lazy var routeStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [routeLabel, airlineLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 2
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

    //MID
    private func makeCodeLabel(alignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = UIColor(hex: Colors.tertiary800)
        label.textAlignment = alignment
        return label
    }

    private func makeTimeLabel(alignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textColor = UIColor(hex: Colors.tertiary600)
        label.textAlignment = alignment
        return label
    }

    private func makeAirportSideStack(_ subviews: [UIView],
                                      alignment: UIStackView.Alignment) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: subviews)
        stack.axis = .vertical
        stack.alignment = alignment
        stack.spacing = 4
        return stack
    }

    private lazy var depCodeLabel: UILabel = makeCodeLabel(alignment: .left)
    private lazy var depTimeLabel: UILabel = makeTimeLabel(alignment: .left)
    private lazy var depStack: UIStackView = makeAirportSideStack(
        [depCodeLabel, depTimeLabel],
        alignment: .leading
    )

    private lazy var arrCodeLabel: UILabel = makeCodeLabel(alignment: .right)
    private lazy var arrTimeLabel: UILabel = makeTimeLabel(alignment: .right)
    private lazy var arrStack: UIStackView = makeAirportSideStack(
        [arrCodeLabel, arrTimeLabel],
        alignment: .trailing
    )

    private lazy var routeLineLeft: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.neutral200)
        return view
    }()

    private lazy var routeLineRight: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.neutral200)
        return view
    }()

    private lazy var routeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "airplane")
        imageView.tintColor = UIColor(hex: Colors.primary)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .semibold)
        label.textColor = UIColor(hex: Colors.tertiary600)
        label.textAlignment = .center
        return label
    }()

    //BOTTOM
    private lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.neutral200)
        return view
    }()

    private lazy var dateIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "calendar")
        imageView.tintColor = UIColor(hex: Colors.tertiary600)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textColor = UIColor(hex: Colors.tertiary700)
        return label
    }()

    private lazy var viewTicketButton: UIButton = {
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

        routeLabel.text = "London to Paris"
        airlineLabel.text = "EuroAir · EA-442"
        statusLabel.text = "ON TIME"

        depCodeLabel.text = "LHR"
        depTimeLabel.text = "10:45 AM"
        arrCodeLabel.text = "CDG"
        arrTimeLabel.text = "1:00 PM"
        durationLabel.text = "1H 15M"

        dateLabel.text = "Oct 24, 2023"
        viewTicketButton.setTitle("View Ticket", for: .normal)
        viewTicketButton.addAction(UIAction(handler: { _ in
            print("View Ticket tapped")
        }), for: .touchUpInside)

        statusBadgeView.addSubview(statusLabel)
        airlineIconContainer.addSubview(airlineIcon)

        addSubview(airlineIconContainer)
        addSubview(routeStack)
        addSubview(statusBadgeView)

        addSubview(depStack)
        addSubview(arrStack)
        addSubview(routeLineLeft)
        addSubview(routeIcon)
        addSubview(routeLineRight)
        addSubview(durationLabel)

        addSubview(divider)
        addSubview(dateIcon)
        addSubview(dateLabel)
        addSubview(viewTicketButton)

        airlineIconContainer.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(cardPadding)
            make.width.height.equalTo(40)
        }

        airlineIcon.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(20)
        }

        statusLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(4)
            make.leading.trailing.equalToSuperview().inset(10)
        }

        statusBadgeView.snp.makeConstraints { make in
            make.centerY.equalTo(airlineIconContainer)
            make.trailing.equalToSuperview().inset(cardPadding)
        }

        routeStack.snp.makeConstraints { make in
            make.centerY.equalTo(airlineIconContainer)
            make.leading.equalTo(airlineIconContainer.snp.trailing).offset(12)
            make.trailing.lessThanOrEqualTo(statusBadgeView.snp.leading).offset(-8)
        }

        depStack.snp.makeConstraints { make in
            make.top.equalTo(airlineIconContainer.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(cardPadding)
        }

        arrStack.snp.makeConstraints { make in
            make.top.equalTo(depStack)
            make.trailing.equalToSuperview().inset(cardPadding)
        }

        routeIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(depCodeLabel)
            make.width.height.equalTo(16)
        }

        durationLabel.snp.makeConstraints { make in
            make.top.equalTo(routeIcon.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
        }

        routeLineLeft.snp.makeConstraints { make in
            make.centerY.equalTo(routeIcon)
            make.leading.equalTo(depCodeLabel.snp.trailing).offset(12)
            make.trailing.equalTo(routeIcon.snp.leading).offset(-6)
            make.height.equalTo(1)
        }

        routeLineRight.snp.makeConstraints { make in
            make.centerY.equalTo(routeIcon)
            make.leading.equalTo(routeIcon.snp.trailing).offset(6)
            make.trailing.equalTo(arrCodeLabel.snp.leading).offset(-12)
            make.height.equalTo(1)
        }

        divider.snp.makeConstraints { make in
            make.top.equalTo(depStack.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(cardPadding)
            make.height.equalTo(1)
        }

        dateIcon.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(cardPadding)
            make.width.height.equalTo(16)
            make.bottom.equalToSuperview().inset(cardPadding)
        }

        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(dateIcon)
            make.leading.equalTo(dateIcon.snp.trailing).offset(8)
        }

        viewTicketButton.snp.makeConstraints { make in
            make.centerY.equalTo(dateIcon)
            make.trailing.equalToSuperview().inset(cardPadding)
            make.leading.greaterThanOrEqualTo(dateLabel.snp.trailing).offset(8)
        }
    }
}
