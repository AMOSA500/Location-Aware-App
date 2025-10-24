//
//  MortgageModel.swift
//  Mortgage
//
//  Created by Philip Trwoga on 16/10/2024.
//

import Foundation
import SwiftData

@Model class MortgageModel : Identifiable{
    //hint - map to Published vars on view for easy saving
    //you vars here
    var lender:String
    var amount: Int
    var interest: Int
    var period: Int

    init(lender: String, amount: Int, interest: Int, period: Int) {
        self.lender = lender
        self.amount = amount
        self.interest = interest
        self.period = period
    }
}
