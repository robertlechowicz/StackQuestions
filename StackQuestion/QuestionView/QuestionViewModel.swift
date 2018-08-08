//
//  QuestionViewModel.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 07.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

struct QuestionViewModel {
    let title: String
    let link: String
    let tags: String
    let viewCount: String
    let answerCount: String
    let score: String
    let creationDate: String
    let lastActivityDate: String
    let ownerName: String
    let body: String

    init(question: Question) {
        title = question.title ?? ""
        link = question.link ?? ""
        tags = "Tags: \((question.tags ?? []).joined(separator: ", "))"
        viewCount = "View count: \(question.viewCount ?? 0)"
        answerCount = "Answer count: \(question.answerCount ?? 0)"
        score = "Score: \(question.score ?? 0)"
        creationDate = "Created: \(question.creationDate?.formatted ?? "")"
        lastActivityDate = "Last activity date: \(question.lastActivityDate?.formatted ?? "")"
        ownerName = question.owner?.displayName ?? ""
        body = question.body ?? ""
    }

    init() {
        title = ""
        link = ""
        tags = ""
        viewCount = ""
        answerCount = ""
        score = ""
        creationDate = ""
        lastActivityDate = ""
        ownerName = ""
        body = ""
    }
}
