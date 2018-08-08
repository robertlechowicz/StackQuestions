//
//  QuestionView.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 06.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import UIKit

class QuestionView: UIView {

    private let scrollView = UIScrollView()
    private let containerView = UIView()

    private let titleLabel = UILabel()
    private let linkLabel = UILabel()
    private let tagsLabel = UILabel()
    private let viewCountLabel = UILabel()
    private let answerCountLabel = UILabel()
    private let scoreLabel = UILabel()
    private let creationDateLabel = UILabel()
    private let lastActivityDateLabel = UILabel()
    private let ownerNameLabel = UILabel()
    private let questionLabel = UILabel()
    private let bodyLabel = UILabel()

    private let answerLabel = UILabel()
    private let answerContainer = UIView()

    var viewModel = QuestionViewModel() {
        didSet {
            titleLabel.text = viewModel.title
            linkLabel.text = viewModel.link
            tagsLabel.text = viewModel.tags
            viewCountLabel.text = viewModel.viewCount
            answerCountLabel.text = viewModel.answerCount
            scoreLabel.text = viewModel.score
            creationDateLabel.text = viewModel.creationDate
            lastActivityDateLabel.text = viewModel.lastActivityDate
            ownerNameLabel.text = viewModel.ownerName
            bodyLabel.attributedText = viewModel.body.htmlToAttributedString
        }
    }

    func setup() {
        backgroundColor = .white
        setupLabels()
        setupLayout()
    }

    func addAnswer(view: UIView) {
        answerLabel.isHidden = false
        answerContainer.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupLabels() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.numberOfLines = 0

        linkLabel.font = UIFont.systemFont(ofSize: 13)
        linkLabel.textColor = .blue

        tagsLabel.font = UIFont.systemFont(ofSize: 10)
        tagsLabel.numberOfLines = 0

        viewCountLabel.font = UIFont.systemFont(ofSize: 10)
        answerCountLabel.font = UIFont.systemFont(ofSize: 10)
        scoreLabel.font = UIFont.systemFont(ofSize: 10)
        creationDateLabel.font = UIFont.systemFont(ofSize: 10)
        lastActivityDateLabel.font = UIFont.systemFont(ofSize: 10)

        ownerNameLabel.font = UIFont.systemFont(ofSize: 10)
        ownerNameLabel.textColor = .gray

        questionLabel.text = ">> Question:"
        questionLabel.font = UIFont.boldSystemFont(ofSize: 14)

        bodyLabel.numberOfLines = 0

        answerLabel.text = ">> Answer:"
        answerLabel.font = UIFont.boldSystemFont(ofSize: 14)
        answerLabel.isHidden = true
    }

    private func setupLayout() {

        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
            make.width.equalTo(self.snp.width)
        }

        containerView.addSubview(titleLabel)
        containerView.addSubview(linkLabel)
        containerView.addSubview(tagsLabel)
        containerView.addSubview(viewCountLabel)
        containerView.addSubview(answerCountLabel)
        containerView.addSubview(scoreLabel)
        containerView.addSubview(creationDateLabel)
        containerView.addSubview(lastActivityDateLabel)
        containerView.addSubview(ownerNameLabel)
        containerView.addSubview(questionLabel)
        containerView.addSubview(bodyLabel)

        containerView.addSubview(answerLabel)
        containerView.addSubview(answerContainer)

        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }

        linkLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }

        tagsLabel.snp.makeConstraints { make in
            make.top.equalTo(linkLabel.snp.bottom).offset(8)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }

        viewCountLabel.snp.makeConstraints { make in
            make.top.equalTo(tagsLabel.snp.bottom)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }

        answerCountLabel.snp.makeConstraints { make in
            make.top.equalTo(viewCountLabel.snp.bottom)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }

        scoreLabel.snp.makeConstraints { make in
            make.top.equalTo(answerCountLabel.snp.bottom)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }

        creationDateLabel.snp.makeConstraints { make in
            make.top.equalTo(scoreLabel.snp.bottom)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }

        lastActivityDateLabel.snp.makeConstraints { make in
            make.top.equalTo(creationDateLabel.snp.bottom)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }

        ownerNameLabel.snp.makeConstraints { make in
            make.top.equalTo(lastActivityDateLabel.snp.bottom).offset(8)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }

        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(ownerNameLabel.snp.bottom).offset(8)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }

        bodyLabel.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(8)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }

        answerLabel.snp.makeConstraints { make in
            make.top.equalTo(bodyLabel.snp.bottom).offset(16)
            make.leading.equalTo(16)
        }

        answerContainer.snp.makeConstraints { make in
            make.top.equalTo(answerLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview()
        }

    }
}
