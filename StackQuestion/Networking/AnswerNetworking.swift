//
//  AnswerNetworking.swift
//  StackQuestion
//
//  Created by Robert Lechowicz on 07.08.2018.
//  Copyright © 2018 128pixels. All rights reserved.
//

import UIKit

class AnswerNetworking: BaseNetworking {

    func getQuestion(id: Int64, completion: @escaping (QueryResult<Data>) -> Void) {

        let params = [
            "order": "desc",
            "sort": "activity",
            "filter": "withbody"
        ]

        guard let url = makeUrl(with: Endpoints.answers + String(id), params: params) else {
            return
        }

        performRequest(url: url, completion: completion)
    }
}
