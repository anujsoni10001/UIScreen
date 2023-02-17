//
//  L10n.swift
//  UIScreen
//
//  Created by Anuj Soni on 14/02/23.
//

import Foundation


class L10n{
static let doTitle = NSLocalizedString("doTitle", comment:"This is controller Title")
static let doLabelData = NSLocalizedString("doLabelData", comment:"This is controller Title")
static let dontLable = NSLocalizedString("dontLable", comment:"This is controller Title")
static let dontLableData = NSLocalizedString("dontLableData", comment:"This is controller Title")
}

extension String {
    func localizableString(_ name: String) -> String {
        let path = Bundle.main.path(forResource: name, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
