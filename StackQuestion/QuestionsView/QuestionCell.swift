//
//  QuestionCell.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 06.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import UIKit

class QuestionCell: UITableViewCell {

    private let titleLabel = UILabel()
    private let acceptedAnswerLabel = UILabel()

    var viewModel = ViewModel() {
        didSet {
            titleLabel.text = viewModel.title
            acceptedAnswerLabel.text = viewModel.acceptedAnswer
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)

        acceptedAnswerLabel.font = UIFont.systemFont(ofSize: 10)
    }

    private func setupLayout() {
        addSubview(titleLabel)
        addSubview(acceptedAnswerLabel)

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(8)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }

        acceptedAnswerLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(16)
            make.bottom.equalTo(-8)
        }
    }
}

extension QuestionCell {
    struct ViewModel {
        let title: String
        let acceptedAnswer: String

        init(question: Question) {
            title = question.title ?? ""
            acceptedAnswer = question.acceptedAnswerId != nil ? "Has accepted answer" : ""
        }

        init() {
            title = ""
            acceptedAnswer = ""
        }
    }
}
