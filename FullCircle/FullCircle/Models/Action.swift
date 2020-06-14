//
//  Action.swift
//  FullCircle
//
//  Created by Sunni Tang on 6/12/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import Foundation

struct Action: Codable {
    let name: String
    let description: String
    let organization: Organization
    let type: ActionType
    let location: String
    let actionURL: String
    let iconString: String//Stored in Assets folder
    var isSaved: Bool
}

enum ActionType: String, Codable {
    case easy
    case medium
    case hard
}

var allActions = [
    Action(name: "BLM March", description: "March from Grand Army Plaza to City Hall to Protest Police Violence", organization: Organization.allOrganizations[0], type: .hard, location: "New York City", actionURL: "NA", iconString: "TK", isSaved: false),
    Action(name: "Email your rep about police reform bill", description: "Send a pre-filled email to your local representative asking them to support the recent police reform bill", organization: Organization.allOrganizations[1], type: .easy, location: "N/A", actionURL: "yourrep@government.org", iconString: "TK", isSaved: false),
    Action(name: "Donate to BAJI", description: "Please click to button below to make a donation to our cause.", organization: Organization.allOrganizations[2], type: .easy, location: "N/A", actionURL: Organization.allOrganizations[2].donateURL, iconString: "TK", isSaved: false),
    Action(name: "Call Governor Cuomo", description: "Call Governor Cuomo's office and demand that he release a full education-reform plan. 1-518-474-8390.", organization: Organization.allOrganizations[3], type: .medium, location: "N/A", actionURL: "N/A", iconString: "TK", isSaved: false),
    Action(name: "Sign our petition", description: "We have a petition on change.org, please take the time to sign it and voice your support", organization: Organization.allOrganizations[4], type: .easy, location: "N/A", actionURL: "change.org", iconString: "TK", isSaved: false)
]
