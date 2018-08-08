//
//  JsonParser.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 07.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import Foundation
import SwiftyJSON

class JsonParser {
    static func parseQuestions(data: Data) -> [Question] {
        guard let json = try? JSON(data: data), let list = json["items"].array else {
            return []
        }

        var questions = [Question]()

        for item in list {
            let owner = makeOwner(json: item["owner"])

            let question = Question(id: item["question_id"].int64,
                                    acceptedAnswerId: item["accepted_answer_id"].int64,
                                    title: item["title"].string,
                                    link: item["link"].string,
                                    tags: item["tags"].array?.compactMap { $0.string },
                                    isAnswered: item["is_answered"].bool,
                                    viewCount: item["view_count"].int,
                                    answerCount: item["answer_count"].int,
                                    score: item["score"].int,
                                    creationDate: Date(timeIntervalSince1970: item["creation_date"].double ?? 0),
                                    lastActivityDate: Date(timeIntervalSince1970: item["last_edit_date"].double ?? 0),
                                    owner: owner,
                                    body: item["body"].string)
            questions.append(question)
        }

        return questions
    }

    static func parseAnswer(data: Data) -> Answer? {
        guard let json = try? JSON(data: data), let item = json["items"].array?.first else {
            return nil
        }

        let owner = makeOwner(json: item["owner"])
        return Answer(score: item["score"].int, body: item["body"].string, owner: owner)
    }

    private static func makeOwner(json: JSON) -> Owner {
        return Owner(reputation: json["reputation"].int,
                     acceptRate: json["accept_rate"].int,
                     displayName: json["display_name"].string)
    }
}
