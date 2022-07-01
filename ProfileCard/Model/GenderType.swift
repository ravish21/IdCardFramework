
//
//  Created by Ravish Kumar on 30/06/22.
//  Copyright © 2022 Admin. All rights reserved.
//

import Foundation
import UIKit

public enum GenderType
{
    case Male
    case Female
    case NotSpecified
}

extension GenderType
{

    @available(iOS, introduced: 11.0, message: "convert to String")
    func toString() -> String
    {
        switch self
        {
        case .Male:
            return "Male"
        case .Female:
            return "Female"
        case .NotSpecified:
            return "Not Specified"
        }
    }
}
