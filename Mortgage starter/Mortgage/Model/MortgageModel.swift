//
//  MortgageModel.swift
//  Mortgage
//
//  Created by Philip Trwoga on 16/10/2024.
//

import Foundation
import SwiftData

@Model
class MortgageModel : Identifiable{
    //hint - map to Published vars on view for easy saving
    //you vars here
    var id = UUID()
    var lender:String
    var amount: Double
    var interest: Double
    var period: Int

    init(lender: String, amount: Double, interest: Double, period: Int) {
        self.lender = lender
        self.amount = amount
        self.interest = interest
        self.period = period
    }
}


