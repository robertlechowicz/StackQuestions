//
//  AnswerView.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 07.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import UIKit

class AnswerView: UIView {

    private let bodyLabel = UILabel()
    private let scoreLabel = UILabel()
    private let ownerNameLabel = UILabel()

    var viewModel = AnswerViewModel() {
        didSet {
            insertAttributtedText(viewModel.body, to: bodyLabel)
            scoreLabel.text = viewModel.score
            ownerNameLabel.text = viewModel.ownerName
        }
    }

    func setup() {
        backgroundColor = .white

        setupLabels()
        setupLayout()
    }

    private func setupLabels() {
        bodyLabel.numberOfLines = 0

        ownerNameLabel.font = UIFont.systemFont(ofSize: 10)
        ownerNameLabel.textColor = .gray
        scoreLabel.font = UIFont.systemFont(ofSize: 10)
        scoreLabel.textColor = .gray
    }

    private func setupLayout() {
        addSubview(bodyLabel)
        addSubview(ownerNameLabel)
        addSubview(scoreLabel)

        bodyLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }

        ownerNameLabel.snp.makeConstraints { make in
            make.top.equalTo(bodyLabel.snp.bottom).offset(8)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }

        scoreLabel.snp.makeConstraints { make in
            make.top.equalTo(ownerNameLabel.snp.bottom).offset(0)
            make.leading.equalTo(16)
            make.bottom.equalToSuperview()
        }
    }
}
