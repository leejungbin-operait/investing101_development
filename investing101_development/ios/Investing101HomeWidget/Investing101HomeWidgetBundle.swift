//
//  Investing101HomeWidgetBundle.swift
//  Investing101HomeWidget
//
//  Created by LEE JUNG BIN on 6/9/26.
//

import WidgetKit
import SwiftUI

@main
struct Investing101HomeWidgetBundle: WidgetBundle {
    var body: some Widget {
        Investing101HomeWidget()
        Investing101HomeWidgetControl()
        Investing101HomeWidgetLiveActivity()
    }
}
