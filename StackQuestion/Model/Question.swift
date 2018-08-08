//
//  Question.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 06.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import Foundation

struct Question {
    let id: Int64?
    let acceptedAnswerId: Int64?
    let title: String?
    let link: String?
    let tags: [String]?
    let isAnswered: Bool?
    let viewCount: Int?
    let answerCount: Int?
    let score: Int?
    let creationDate: Date?
    let lastActivityDate: Date?
    let owner: Owner?
    let body: String?
}
