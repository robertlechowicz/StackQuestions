//
//  QuestionsNetworking.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 06.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import Foundation

class QuestionsNetworking: BaseNetworking {

    func getQuestions(question: String, completion: @escaping (QueryResult<Data>) -> Void) {

        let params = [
            "order": "desc",
            "sort": "votes",
            "filter": "withbody",
            "intitle": question
        ]

        guard let url = makeUrl(with: Endpoints.search, params: params) else {
            return
        }

        performRequest(url: url, completion: completion)
    }
}
