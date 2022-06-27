//
//  Constants.swift
//  iRentals
//
//  Created by sahebroy on 22/06/22.
//

import Foundation
import CoreGraphics
import UIKit

struct Constants {
    
    struct LocalizationFile {
        static let fileName = "language"
    }
    
    private enum ColorNames: String {
        case global = "globalTint"
        case text = "mainText"
        case subtitle = "subtitle"
        case view = "viewBackground"
    }
    
    struct Colors {
        static let text = UIColor.init(named: ColorNames.text.rawValue)
        static let subTitle = UIColor.init(named: ColorNames.subtitle.rawValue)
        static let view = UIColor.init(named: ColorNames.view.rawValue)
        static let global = UIColor.init(named: ColorNames.global.rawValue)
    }
    
    struct FontSizes {
        static let titleFontSize: CGFloat = 16.0
        static let itemTitles: CGFloat = 13.0
        static let itemSubtitle: CGFloat = 11.0
        static let itemHeader: CGFloat = 15.0
    }
    
    struct Sizes {
        static let headerHeight: CGFloat = 44.0
        static let detailImageHeight: CGFloat = 200.0
        static let margin: CGFloat = 16.0
        static let labelHeight: CGFloat = 24.0
        static let subtitleHeight: CGFloat = 16.0
        static let contentWidth: CGFloat = UIScreen.main.bounds.width - (margin * 2)
    }
    
    struct AnimationFiles {
        static let splashAnimation = "splashAnimation"
    }
    
    struct URLs {
        static let baseURL = "https://cdn.sixt.io/"
    }
    
    struct Strings {
        static let annotationReuse = "annotationView"
        static let placeholderImage = "placeholder"
    }
}
