//
//  ComplicationController.swift
//  temp Extension
//
//  Created by Juan Pablo on 12/3/17.
//  Copyright © 2017 Juan Pablo. All rights reserved.
//

import ClockKit
import WatchKit


class ComplicationController: NSObject, CLKComplicationDataSource{
    

    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward, .backward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        let date = Date()
        handler(date)
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        var date = Date()
        date.addingTimeInterval(24*60*60)
        handler(date)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        
        if complication.family == .utilitarianLarge{
            
            let delegate =  WKExtension.shared().delegate as! ExtensionDelegate
            let large = CLKComplicationTemplateUtilitarianLargeFlat()
            let date = DateFormatter()
            date.dateFormat = "hh:mm"
            if let status = Status.shared.status{
                
                large.textProvider = CLKSimpleTextProvider(text: status)
                let timelineEntry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: large)
                handler(timelineEntry)
            }
            
        }else{
            handler(nil)
        }
        
    }
    
    func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after to the given date
        handler(nil)
    }
    
    // MARK: - Placeholder Templates
    

    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
    
       if complication.family == .utilitarianLarge{
            let large = CLKComplicationTemplateUtilitarianLargeFlat()
            if let status = Status.shared.status{
                
                large.textProvider = CLKSimpleTextProvider(text: status)
            }else{
                large.textProvider = CLKSimpleTextProvider(text: "status")
            }
            handler(large)
        }
        handler(nil)
        
        }
        
        
    
}
