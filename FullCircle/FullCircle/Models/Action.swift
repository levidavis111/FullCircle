//
//  Action.swift
//  FullCircle
//
//  Created by Sunni Tang on 6/12/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import Foundation

struct Action {
    let name: String
    let description: String
    let organization: Organization
    let type: ActionType
    let location: String?
    let actionURL: String?
    let iconString: String//Stored in Assets folder
}

enum ActionType: String {
    case easy
    case medium
    case hard
}
