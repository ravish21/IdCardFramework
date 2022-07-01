
//
//  Created by Ravish Kumar on 30/06/22.
//  Copyright © 2022 Admin. All rights reserved.
//

import Foundation
import UIKit

public struct PersonDetailsModel
{
    internal var entryCount: Int = 7

    public var personName: String = ""
    public var personIcon: UIImage
    public var personDob: Date
    public var personAddress: String = ""
    public var personPhone: String = ""
    public var personEmail: String = ""
    public var personCompany: String = ""
    
    //Variables associated with dynamic UI
    public var personHeight: Double? = 0.0
    {
        willSet
        {
            if newValue == nil && personHeight != nil
            {
                entryCount -= 1
            }
            else if newValue != nil && personHeight == nil
            {
                entryCount += 1
            }
        }
    }
    
    public var personWeight : Double? = 0.0
    {
        willSet(newValue)
        {
            if newValue == nil && personWeight != nil
            {
                entryCount -= 1
            }
            else if newValue != nil && personWeight == nil
            {
                entryCount += 1
            }
        }
    }
    
    public var personGender : GenderType?
    {
        willSet
        {
            if newValue == nil && personGender != nil
            {
                entryCount -= 1
            }
            else if newValue != nil && personGender == nil
            {
                entryCount += 1
            }
        }
    }
    
    public var numberOfRows : Int
    {
        return entryCount
    }
    
    public init(withName newName : String, icon newIcon : UIImage, birthday newDob : Date, address newAddress : String, phone newPhone : String, email newEmail : String, Company newCompany : String, height newHeight  : Double?, weight newWeight : Double?, andGender newGender : GenderType?)
    {
        personName      = newName
        personIcon      = newIcon
        personDob       = newDob
        personAddress   = newAddress
        personPhone     = newPhone
        personEmail     = newEmail
        personCompany   = newCompany
        if newGender != nil
        {
            entryCount += 1
        }
        if newWeight != nil
        {
            entryCount += 1
        }
        if newHeight != nil
        {
            entryCount += 1
        }
        personHeight = newHeight
        personWeight = newWeight
        personGender = newGender
    }
}

extension PersonDetailsModel : CustomStringConvertible
{
    public var description: String {
        return """
        NAME:           \(self.personName)
        DATE OF BIRTH:  \(self.personDob)
        ADDRESS:        \(self.personAddress)
        EMAIL:          \(self.personEmail)
        PHONE:          \(self.personPhone)
        """
    }
}
