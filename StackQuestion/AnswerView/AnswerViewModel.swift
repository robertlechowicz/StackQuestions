//
//  AnswerViewModel.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 07.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

struct AnswerViewModel {
    let ownerName: String
    let score: String
    let body: String

    init(answer: Answer) {
        ownerName = answer.owner?.displayName ?? ""
        score = "Score: \(answer.score ?? 0)"
        body = answer.body ?? ""
    }

    init() {
        ownerName = ""
        score = ""
        body = ""
    }
}
