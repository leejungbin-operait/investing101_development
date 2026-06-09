//
//  Investing101HomeWidgetLiveActivity.swift
//  Investing101HomeWidget
//
//  Created by LEE JUNG BIN on 6/9/26.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct Investing101HomeWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct Investing101HomeWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Investing101HomeWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension Investing101HomeWidgetAttributes {
    fileprivate static var preview: Investing101HomeWidgetAttributes {
        Investing101HomeWidgetAttributes(name: "World")
    }
}

extension Investing101HomeWidgetAttributes.ContentState {
    fileprivate static var smiley: Investing101HomeWidgetAttributes.ContentState {
        Investing101HomeWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: Investing101HomeWidgetAttributes.ContentState {
         Investing101HomeWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: Investing101HomeWidgetAttributes.preview) {
   Investing101HomeWidgetLiveActivity()
} contentStates: {
    Investing101HomeWidgetAttributes.ContentState.smiley
    Investing101HomeWidgetAttributes.ContentState.starEyes
}
