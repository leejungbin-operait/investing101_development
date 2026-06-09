//
//  Investing101HomeWidget.swift
//  Investing101HomeWidget
//
//  Created by LEE JUNG BIN on 6/8/26.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    
    // Method to retrieve data from Flutter app
    private func getDataFromFlutter() -> SimpleEntry{
        let userDefaults = UserDefaults(suiteName: "group.homeScreenApp")
        let textFromFlutterApp = userDefaults?.string(forKey: "text_from_flutter_app") ?? "0"
        return SimpleEntry(date: Date(), text: textFromFlutterApp )
    }
    // Preview in widget gallery
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), text: "0")
    }

    
    // Widget gallery/selection preview
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), text: "0")
    }
    
    
    // Actual widget on Home Screen
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
       let entry = getDataFromFlutter()

        return Timeline(entries: [entry], policy: .atEnd)
    }

//    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}


// Data structure for my widget
struct SimpleEntry: TimelineEntry {
    let date: Date
    let text: String
}


// The view that defines how our widget looks
struct Investing101HomeWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("My count:")
                .foregroundColor(.white)
                .fontWeight(.semibold)
            Text(entry.text)
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.bold)
        }
    }
}


// The main widget configuration
struct Investing101HomeWidget: Widget {
    let kind: String = "Investing101HomeWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            Investing101HomeWidgetEntryView(entry: entry)
                .containerBackground(for: .widget) {
                    Image("WidgetBackground")
                        .resizable()
                        .scaledToFill()
                }
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

#Preview(as: .systemSmall) {
    Investing101HomeWidget()
} timeline: {
    SimpleEntry(date: .now, text: "0")
    SimpleEntry(date: .now, text: "0")
}
