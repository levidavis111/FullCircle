//
//  Organization.swift
//  FullCircle
//
//  Created by Sunni Tang on 6/12/20.
//  Copyright © 2020 FullCircle. All rights reserved.
//

import Foundation

struct Organization {
    let name: String
    let description: String
    let address: String
    let borough: Borough?
    let phone: String
    let email: String
    let donateURL: String
    let logoString: String//Stored in assets folder
    let type: OrganizationType
    var actions: [Action]
}

enum OrganizationType {
    case nonprofit
    case forProfit
    case lobby
    case academic
    case individual
}

enum Borough: String {
    case manhattan = "Manhattan"
    case brooklyn = "Brooklyn"
    case queens = "Queens"
    case bronx = "The Bronx"
    case statenIsland = "Staten Island"
}
