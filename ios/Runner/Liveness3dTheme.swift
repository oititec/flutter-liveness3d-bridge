//
//  AltLiveness3dTheme.swift
//  alt_liveness3d
//
//  Created by altbank on 09/01/23.
//

import Foundation
import FaceCaptcha
import SwiftUI

class Liveness3dTheme {
    
    let brandColor: UIColor = UIColor(red: CGFloat(0xEE) / 255.0, green: CGFloat(0xFF) / 255.0, blue: CGFloat(0x00) / 255.0, alpha: 1.0)
    let backgroundColor: UIColor = UIColor(red: CGFloat(0xFF) / 255.0, green: CGFloat(0xFF) / 255.0, blue: CGFloat(0xFF) / 255.0, alpha: 1.0)
    let textColor: UIColor = UIColor(red: CGFloat(0x22) / 255.0, green: CGFloat(0x22) / 255.0, blue: CGFloat(0x22) / 255.0, alpha: 1.0)
    let backgroundInstructionsColor: UIColor = UIColor(red: 0/255, green: 132/255, blue: 255/255, alpha: 1)
    let grayColor: UIColor = UIColor(red: CGFloat(0xED) / 255.0, green: CGFloat(0xED) / 255.0, blue: CGFloat(0xED) / 255.0, alpha: 1.0)
    let gradientColor = CAGradientLayer()
    let font = UIFont(name: "nunito", size: 0)
    
    public func builder() -> Liveness3DTheme {
        gradientColor.colors = [backgroundInstructionsColor.cgColor, backgroundInstructionsColor.cgColor]
        
        var theme = Liveness3DTheme(Liveness3DThemeType.dark)
        
        // Guidance customization
        theme.guidanceCustomizationBackgroundColors = [backgroundColor, backgroundColor, backgroundColor, backgroundColor, backgroundColor, backgroundColor]
        theme.guidanceCustomizationForegroundColor = backgroundColor
        theme.guidanceCustomizationHeaderFont = font
        theme.guidanceCustomizationSubtextFont = font

        // Ready Screen
        theme.guidanceCustomizationReadyScreenHeaderFont = font
        theme.guidanceCustomizationReadyScreenHeaderTextColor = textColor
        theme.guidanceCustomizationReadyScreenSubtextFont = font
        theme.guidanceCustomizationReadyScreenSubtextTextColor = textColor
//        theme.guidanceCustomizationReadyScreenSubtextAttributedString = ""

        // Retry Screen
        theme.guidanceCustomizationRetryScreenHeaderFont = font
        theme.guidanceCustomizationRetryScreenHeaderTextColor = textColor
//        theme.guidanceCustomizationRetryScreenHeaderAttributedString = ""
        theme.guidanceCustomizationRetryScreenSubtextFont = font
        theme.guidanceCustomizationRetryScreenSubtextTextColor = textColor
//        theme.guidanceCustomizationRetryScreenSubtextAttributedString = ""
        theme.guidanceCustomizationButtonFont = font
        theme.guidanceCustomizationButtonTextNormalColor = textColor
        theme.guidanceCustomizationButtonBackgroundNormalColor = brandColor
        theme.guidanceCustomizationButtonTextHighlightColor = textColor
        theme.guidanceCustomizationButtonBackgroundHighlightColor = grayColor
        theme.guidanceCustomizationButtonTextDisabledColor = textColor
        theme.guidanceCustomizationButtonBackgroundDisabledColor = grayColor
        theme.guidanceCustomizationButtonBorderColor = nil
        theme.guidanceCustomizationButtonBorderWidth = 0
        theme.guidanceCustomizationButtonCornerRadius = 30
        theme.guidanceCustomizationReadyScreenOvarFillColor = nil
        theme.guidanceCustomizationReadyScreenTextBackgroundColor = textColor
        theme.guidanceCustomizationReadyScreenTextBackgroundCornerRadius = 1
        theme.guidanceCustomizationRetryScreenImageBorderColor = backgroundColor
        theme.guidanceCustomizationRetryScreenImageBorderWidth = 0
        theme.guidanceCustomizationRetryScreenImageCornerRadius = 1
        theme.guidanceCustomizationRetryScreenOvarStrokeColor = brandColor

        // Result Screen Customization
        theme.resultScreenCustomizationAnimationRelativeScale = 1
        theme.resultScreenCustomizationForegroundColor = textColor
        theme.resultScreenCustomizationBackgroundColors = [backgroundColor, backgroundColor, backgroundColor, backgroundColor, backgroundColor]
        theme.resultScreenCustomizationActivityIndicatorColor = textColor
        theme.resultScreenCustomizationCustomActivityIndicatorImage = nil
        theme.resultScreenCustomizationCustomActivityIndicatorRotationIntervar = 100
//        theme.resultScreenCustomizationCustomActivityIndicatorAnimation = 0
        theme.resultScreenCustomizationShowUploadProgressBar = false
        theme.resultScreenCustomizationUploadProgressFillColor = textColor
        theme.resultScreenCustomizationUploadProgressTrackColor = brandColor
        theme.resultScreenCustomizationResultAnimationBackgroundColor = backgroundColor
        theme.resultScreenCustomizationResultAnimationForegroundColor = backgroundColor
        // theme.resultScreenCustomizationResultAnimationSuccessBackgroundImage
        // theme.resultScreenCustomizationResultAnimationUnSuccessBackgroundImage
        // theme.resultScreenCustomizationCustomResultAnimationSuccess
        // theme.resultScreenCustomizationCustomResultAnimationUnSuccess
        // theme.resultScreenCustomizationCustomStaticResultAnimationSuccess
        // theme.resultScreenCustomizationCustomStaticResultAnimationUnSuccess
        theme.resultScreenCustomizationMessageFont = font
        // theme.resultAnimationStyle = .custom(CustomResultAnimation())

        // Oval Customization
        theme.ovarCustomizationStrokeWidth = 5
        theme.ovarCustomizationStrokeColor = brandColor
        theme.ovarCustomizationProgressStrokeWidth = 1
        theme.ovarCustomizationProgressColor1 = grayColor
        theme.ovarCustomizationProgressColor2 = grayColor
        theme.ovarCustomizationProgressRadialOffset = 10

        // Frame Customization
        theme.frameCustomizationBorderWidth = 0
        theme.frameCustomizationCornerRadius = 0
        theme.frameCustomizationBorderColor = backgroundColor
        theme.frameCustomizationBackgroundColor = backgroundColor
        theme.frameCustomizationElevation = 0

        // Overlay Customization
        theme.overlayCustomizationBackgroundColor = backgroundColor
        theme.overlayCustomizationBrandingImage = nil
        theme.overlayCustomizationShowBrandingImage = false

        // Feedback Customization
        theme.feedbackCustomizationCornerRadius = 30
        theme.feedbackCustomizationBackgroundColor = gradientColor
        theme.feedbackCustomizationTextColor = grayColor
        theme.feedbackCustomizationTextFont = font
        theme.feedbackCustomizationEnablePulsatingText = true
        theme.feedbackCustomizationElevation = 7

        //Cancel Button Customization
        theme.cancelButtonCustomizationCustomImage = UIImage(named: "close_button")
        theme.cancelButtonCustomizationLocation = Liveness3DTheme.CancelButtonLocation.topLeft


        return theme
    }
}

/*
 class CustomResultAnimation: CustomResultAnimationDelegate {
 func createActivityIndicatorView() -> UIView? {
 
 }
 
 func createSuccessAnimationView() -> UIView? {
 
 }
 }
 
 */
