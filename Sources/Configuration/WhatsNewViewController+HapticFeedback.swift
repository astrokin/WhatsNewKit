//
//  WhatsNewViewController+HapticFeedback.swift
//  WhatsNewKit-iOS
//
//  Created by Sven Tiigi on 28.05.18.
//  Copyright © 2018 WhatsNewKit. All rights reserved.
//

import UIKit

// MARK: - HapticFeedback

public extension WhatsNewViewController {
    
    /// The HapticFeedback Enumeration
    enum HapticFeedback: Equatable {
        /// ImpactFeedback with FeedbackStyle
        @available(iOSApplicationExtension 10.0, *)
        case impact(UIImpactFeedbackGenerator.FeedbackStyle)
        /// SelectionFeedback
        case selection
        /// NotificationFeedback with FeedbackType
        @available(iOSApplicationExtension 10.0, *)
        case notification(UINotificationFeedbackGenerator.FeedbackType)
        
        /// Execute HapticFeedback
        func execute() {
            // Switch on self
            switch self {
            case .impact(let style):
                // UIFeedbackGenerator
                if #available(iOSApplicationExtension 10.0, *) {
                    let feedbackGenerator = UIImpactFeedbackGenerator(style: style)
                    feedbackGenerator.impactOccurred()
                } else {
                    // Fallback on earlier versions
                }
            case .selection:
                // UISelectionFeedbackGenerator
                if #available(iOSApplicationExtension 10.0, *) {
                    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
                    selectionFeedbackGenerator.selectionChanged()
                } else {
                    // Fallback on earlier versions
                }
            case .notification(let type):
                // UINotificationFeedbackGenerator
                if #available(iOSApplicationExtension 10.0, *) {
                    let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
                    notificationFeedbackGenerator.notificationOccurred(type)
                } else {
                    // Fallback on earlier versions
                }
            }
        }
        
    }
    
}
