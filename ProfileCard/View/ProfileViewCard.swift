//
//  ProfileViewCard.swift
//  ProfileCard
//
//  Created by admin on 01/07/22.
//

import UIKit

@IBDesignable
open class ProfileViewCard: UIView, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet public weak var personIcon    : UIImageView!
    @IBOutlet public weak var personName    : UILabel!
    @IBOutlet public weak var personDetails : UITableView!
    
    public var localTableData: PersonDetailsModel!
    let nibName: String = "ProfileViewCard"
    var view: UIView!
    let cellIdentifier: String = "ProfileViewCard"
    
    func setup()
    {
        self.view = UINib(nibName: self.nibName, bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil)[0] as? UIView
        self.view.frame = bounds
        self.addSubview(self.view)
    }
    
    //UITableViewDataSource Delegate Method Implementation
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = localTableData?.entryCount
        {
            return count - 2
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if nil == cell
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        switch indexPath.row
        {
        case 0:
            let formatter           = DateFormatter()
            formatter.dateStyle     = .medium
            cell?.textLabel?.text   = "Birthday\t: " + formatter.string(from: (localTableData?.personDob)!)
        case 1:
            cell?.textLabel?.text   = "Email\t: "  + localTableData.personEmail
        case 2:
            cell?.textLabel?.text   = "Phone\t: " + localTableData.personPhone
        case 3:
            cell?.textLabel?.text   = "Address\t: " + localTableData.personAddress
        case 4:
            cell?.textLabel?.text   = "Company\t: " + localTableData.personCompany
        case 5:
            cell?.textLabel?.text   = "Gender\t: "  + (localTableData.personGender?.toString())!
        case 6:
            cell?.textLabel?.text   = "Height\t: \((localTableData.personHeight)!)"
        case 7:
            cell?.textLabel?.text   = "Weight\t: \((localTableData.personWeight)!)"
        default:
            print("error")
        }
        
        cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 12.0)
        cell?.textLabel?.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return cell!
    }
    
    //Inits --------------------------------------------------
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
    }

}


extension ProfileViewCard
{
    /**
     This function loads the data for the view
     - important: This function does not do validation
     - parameter newPerson: This is the object representing the person whose information will be displayed on the screen.
     - requires: iOS 11 or later
     - Since: iOS 11
     - author: Arun Patwardhan
     - copyright: Copyright (c) Amaranthine 2015
     - version: 1.0
     */
    @available(iOS, introduced: 11.0, message: "load data")
    public func load(data newPerson : PersonDetailsModel)
    {
        if self.personIcon == nil
        {
            print("Error")
        }
        if self.personName == nil
        {
            print("Error1")
        }
        if self.personDetails == nil
        {
            print("Error2")
        }
        self.localTableData     = newPerson
        self.personIcon.image   = localTableData.personIcon
        self.personName.text    = localTableData.personName
        self.personDetails.reloadData()
    }
}
