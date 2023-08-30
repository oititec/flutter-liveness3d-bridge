package br.com.example.flutter.liveness3d.bridge.utils

import android.content.Context
import android.graphics.Color
import android.graphics.Typeface
import androidx.annotation.DrawableRes
//import androidx.core.content.res.ResourcesCompat
import br.com.oiti.liveness3d.theme.Liveness3DButtonLocation
import br.com.oiti.liveness3d.theme.Liveness3DExitAnimationStyle
import br.com.oiti.liveness3d.theme.Liveness3DTheme
import com.example.alt_liveness3d.R


class Liveness3dTheme(val context: Context?) {

    private val backgroundColor: Int = Color.parseColor("#FFFFFF")
    private val textColor: Int = Color.parseColor("#222222")
    private val backgroundInstructionsColor: Int = Color.parseColor("#404040")
    private val brandColor: Int = Color.parseColor("#EEFF00")
    private val grayColor: Int = Color.parseColor("#EDEDED")


    //Guidance customization
    private val guidanceCustomizationBackgroundColors: Int = backgroundColor
    private val guidanceCustomizationForegroundColor: Int = backgroundColor
    private var guidanceCustomizationHeaderFont: Typeface? = null //ResourcesCompat.getFont(context!!, R.font.nunito_regular)
    private var guidanceCustomizationSubtextFont: Typeface? = null //ResourcesCompat.getFont(context!!, R.font.nunito_regular)

    //Ready Screen
    private var guidanceCustomizationReadyScreenHeaderFont: Typeface? = null //ResourcesCompat.getFont(context!!, R.font.nunito_regular)
    private val guidanceCustomizationReadyScreenHeaderTextColor: Int = textColor
    private val guidanceCustomizationReadyScreenHeaderAttributedString: String? = ""
    private var guidanceCustomizationReadyScreenSubtextFont: Typeface? = null
    private val guidanceCustomizationReadyScreenSubtextTextColor: Int = textColor
    private val guidanceCustomizationReadyScreenSubtextAttributedString: String? = ""

    //Retry Screen
    var guidanceCustomizationRetryScreenHeaderFont: Typeface? = null
    private val guidanceCustomizationRetryScreenHeaderTextColor: Int = textColor
    private val guidanceCustomizationRetryScreenHeaderAttributedString: String = ""
    private val guidanceCustomizationRetryScreenSubtextFont: Typeface? = null
    private val guidanceCustomizationRetryScreenSubtextTextColor: Int = textColor
    private val guidanceCustomizationRetryScreenSubtextAttributedString: String? = ""
    private val guidanceCustomizationButtonFont: Typeface? = null
    private val guidanceCustomizationButtonTextNormalColor: Int = textColor
    private val guidanceCustomizationButtonBackgroundNormalColor: Int = brandColor
    private val guidanceCustomizationButtonTextHighlightColor: Int = textColor
    private val guidanceCustomizationButtonBackgroundHighlightColor: Int = grayColor
    private val guidanceCustomizationButtonTextDisabledColor: Int = textColor
    private val guidanceCustomizationButtonBackgroundDisabledColor: Int = grayColor
    private val guidanceCustomizationButtonBorderColor: Int? = 0
    private val guidanceCustomizationButtonBorderWidth: Int? = 0
    private val guidanceCustomizationButtonCornerRadius: Int? = 30
    private val guidanceCustomizationReadyScreenOvalFillColor: Int? = -1//brandColor
    private val guidanceCustomizationReadyScreenTextBackgroundColor: Int = textColor
    private val guidanceCustomizationReadyScreenTextBackgroundCornerRadius: Int? = 1
    private val guidanceCustomizationRetryScreenImageBorderColor: Int? = 0//Color.parseColor("#404040)
    private val guidanceCustomizationRetryScreenImageBorderWidth: Int? = 0
    private val guidanceCustomizationRetryScreenImageCornerRadius: Int? = 1
    private val guidanceCustomizationRetryScreenOvalStrokeColor: Int = brandColor

    //Result Screen Customization
    private val resultScreenCustomizationAnimationRelativeScale: Float = 1F
    private val resultScreenCustomizationForegroundColor: Int = backgroundColor
    private val resultScreenCustomizationBackgroundColors: Int = backgroundColor
    private val resultScreenCustomizationActivityIndicatorColor: Int = textColor
    @DrawableRes
    private val resultScreenCustomizationCustomActivityIndicatorImage: Int = R.drawable.novu_circular_loading
    private val resultScreenCustomizationCustomActivityIndicatorRotationInterval: Int = 100
    private val resultScreenCustomizationCustomActivityIndicatorAnimation: Int = R.drawable.novu_circular_loading
    private val resultScreenCustomizationShowUploadProgressBar: Boolean = false
    private val resultScreenCustomizationUploadProgressFillColor: Int = textColor
    private val resultScreenCustomizationUploadProgressTrackColor: Int = brandColor
    private val resultScreenCustomizationResultAnimationBackgroundColor: Int = backgroundColor
    private val resultScreenCustomizationResultAnimationForegroundColor: Int = backgroundColor
//    @DrawableRes
//    private val resultScreenCustomizationResultAnimationSuccessBackgroundImage: Int = null
//    @DrawableRes
//    private val resultScreenCustomizationResultAnimationUnSuccessBackgroundImage: Int = R.drawable.attention
    @DrawableRes
    private val resultScreenCustomizationCustomResultAnimationSuccess: Int = R.drawable.successful_check
    @DrawableRes
    private val resultScreenCustomizationCustomResultAnimationUnSuccess: Int = R.drawable.attention
//    @DrawableRes
//    private val resultScreenCustomizationCustomStaticResultAnimationSuccess: Int = null
//    @DrawableRes
//    private val resultScreenCustomizationCustomStaticResultAnimationUnSuccess: Int = null
    private val resultScreenCustomizationMessageFont: Typeface? = null

    //Oval Customization
    private val ovalCustomizationStrokeWidth: Int = 5
    private val ovalCustomizationStrokeColor: Int = brandColor
    private val ovalCustomizationProgressStrokeWidth: Int = 1
    private val ovalCustomizationProgressColor1: Int = grayColor
    private val ovalCustomizationProgressColor2: Int = grayColor
    private val ovalCustomizationProgressRadialOffset: Int = 10

    //Frame Customization
    private val frameCustomizationBorderWidth: Int = 0
    private val frameCustomizationCornerRadius: Int = 0
    private val frameCustomizationBorderColor: Int = backgroundColor
    private val frameCustomizationBackgroundColor: Int = backgroundColor
    private val frameCustomizationElevation: Int = 0

    //Overlay Customization
    private val overlayCustomizationBackgroundColor: Int = backgroundColor
    @DrawableRes
    private val overlayCustomizationBrandingImage: Int = R.drawable.novu_card_logo_horizontal
    private val overlayCustomizationShowBrandingImage: Boolean = false

    //Feedback Customization
    private val feedbackCustomizationCornerRadius: Int = 30
    private val feedbackCustomizationBackgroundColors: Int = backgroundInstructionsColor
    private val feedbackCustomizationTextColor: Int = grayColor
    private val feedbackCustomizationTextFont: Typeface? = null
    private val feedbackCustomizationEnablePulsatingText: Boolean = true
    private val feedbackCustomizationElevation: Int = 7

    //Cancel Button Customization
    @DrawableRes
    private val cancelButtonCustomizationCustomImage: Int = R.drawable.close_button_black
    private val cancelButtonCustomizationLocation: Liveness3DButtonLocation = Liveness3DButtonLocation.TOP_LEFT

    //Exit Animation Style
    private val exitAnimationStyle: Liveness3DExitAnimationStyle = Liveness3DExitAnimationStyle.RIPPLE_IN


    fun toLiveness3DTheme(): Liveness3DTheme{

        return Liveness3DTheme.Builder(
            guidanceCustomizationBackgroundColors = guidanceCustomizationBackgroundColors,
            guidanceCustomizationForegroundColor = guidanceCustomizationForegroundColor,
            guidanceCustomizationHeaderFont = guidanceCustomizationHeaderFont,
            guidanceCustomizationSubtextFont = guidanceCustomizationSubtextFont,
            guidanceCustomizationReadyScreenHeaderFont = guidanceCustomizationReadyScreenHeaderFont,
            guidanceCustomizationReadyScreenHeaderTextColor = guidanceCustomizationReadyScreenHeaderTextColor,
            guidanceCustomizationReadyScreenHeaderAttributedString = guidanceCustomizationReadyScreenHeaderAttributedString,
            guidanceCustomizationReadyScreenSubtextFont = guidanceCustomizationReadyScreenSubtextFont,
            guidanceCustomizationReadyScreenSubtextTextColor = guidanceCustomizationReadyScreenSubtextTextColor,
            guidanceCustomizationReadyScreenSubtextAttributedString = guidanceCustomizationReadyScreenSubtextAttributedString,
            guidanceCustomizationRetryScreenHeaderFont = guidanceCustomizationRetryScreenHeaderFont,
            guidanceCustomizationRetryScreenHeaderTextColor = guidanceCustomizationRetryScreenHeaderTextColor,
            guidanceCustomizationRetryScreenHeaderAttributedString = guidanceCustomizationRetryScreenHeaderAttributedString,
            guidanceCustomizationRetryScreenSubtextFont = guidanceCustomizationRetryScreenSubtextFont,
            guidanceCustomizationRetryScreenSubtextTextColor = guidanceCustomizationRetryScreenSubtextTextColor,
            guidanceCustomizationRetryScreenSubtextAttributedString = guidanceCustomizationRetryScreenSubtextAttributedString,
            guidanceCustomizationButtonFont = guidanceCustomizationButtonFont,
            guidanceCustomizationButtonTextNormalColor = guidanceCustomizationButtonTextNormalColor,
            guidanceCustomizationButtonBackgroundNormalColor = guidanceCustomizationButtonBackgroundNormalColor,
            guidanceCustomizationButtonTextHighlightColor = guidanceCustomizationButtonTextHighlightColor,
            guidanceCustomizationButtonBackgroundHighlightColor = guidanceCustomizationButtonBackgroundHighlightColor,
            guidanceCustomizationButtonTextDisabledColor = guidanceCustomizationButtonTextDisabledColor,
            guidanceCustomizationButtonBackgroundDisabledColor = guidanceCustomizationButtonBackgroundDisabledColor,
            guidanceCustomizationButtonBorderColor = guidanceCustomizationButtonBorderColor,
            guidanceCustomizationButtonBorderWidth = guidanceCustomizationButtonBorderWidth,
            guidanceCustomizationButtonCornerRadius = guidanceCustomizationButtonCornerRadius,
            guidanceCustomizationReadyScreenOvalFillColor = guidanceCustomizationReadyScreenOvalFillColor,
            guidanceCustomizationReadyScreenTextBackgroundColor = guidanceCustomizationReadyScreenTextBackgroundColor,
            guidanceCustomizationReadyScreenTextBackgroundCornerRadius = guidanceCustomizationReadyScreenTextBackgroundCornerRadius,
            guidanceCustomizationRetryScreenImageBorderColor = guidanceCustomizationRetryScreenImageBorderColor,
            guidanceCustomizationRetryScreenImageBorderWidth = guidanceCustomizationRetryScreenImageBorderWidth,
            guidanceCustomizationRetryScreenImageCornerRadius = guidanceCustomizationRetryScreenImageCornerRadius,
            guidanceCustomizationRetryScreenOvalStrokeColor = guidanceCustomizationRetryScreenOvalStrokeColor,
            resultScreenCustomizationAnimationRelativeScale = resultScreenCustomizationAnimationRelativeScale,
            resultScreenCustomizationForegroundColor = resultScreenCustomizationForegroundColor,
            resultScreenCustomizationBackgroundColors = resultScreenCustomizationBackgroundColors,
            resultScreenCustomizationActivityIndicatorColor = resultScreenCustomizationActivityIndicatorColor,
            resultScreenCustomizationCustomActivityIndicatorImage = resultScreenCustomizationCustomActivityIndicatorImage,
            resultScreenCustomizationCustomActivityIndicatorRotationInterval = resultScreenCustomizationCustomActivityIndicatorRotationInterval,
            resultScreenCustomizationCustomActivityIndicatorAnimation = resultScreenCustomizationCustomActivityIndicatorAnimation,
            resultScreenCustomizationShowUploadProgressBar = resultScreenCustomizationShowUploadProgressBar,
            resultScreenCustomizationUploadProgressFillColor = resultScreenCustomizationUploadProgressFillColor,
            resultScreenCustomizationUploadProgressTrackColor = resultScreenCustomizationUploadProgressTrackColor,
            resultScreenCustomizationResultAnimationBackgroundColor = resultScreenCustomizationResultAnimationBackgroundColor,
            resultScreenCustomizationResultAnimationForegroundColor = resultScreenCustomizationResultAnimationForegroundColor,
//            resultScreenCustomizationResultAnimationSuccessBackgroundImage = resultScreenCustomizationResultAnimationSuccessBackgroundImage,
//            resultScreenCustomizationResultAnimationUnSuccessBackgroundImage = resultScreenCustomizationResultAnimationUnSuccessBackgroundImage,
            resultScreenCustomizationCustomResultAnimationSuccess = resultScreenCustomizationCustomResultAnimationSuccess,
            resultScreenCustomizationCustomResultAnimationUnSuccess = resultScreenCustomizationCustomResultAnimationUnSuccess,
//            resultScreenCustomizationCustomStaticResultAnimationSuccess = resultScreenCustomizationCustomStaticResultAnimationSuccess,
//            resultScreenCustomizationCustomStaticResultAnimationUnSuccess = resultScreenCustomizationCustomStaticResultAnimationUnSuccess,
            resultScreenCustomizationMessageFont = resultScreenCustomizationMessageFont,
            ovalCustomizationStrokeWidth = ovalCustomizationStrokeWidth,
            ovalCustomizationStrokeColor = ovalCustomizationStrokeColor,
            ovalCustomizationProgressStrokeWidth = ovalCustomizationProgressStrokeWidth,
            ovalCustomizationProgressColor1 = ovalCustomizationProgressColor1,
            ovalCustomizationProgressColor2 = ovalCustomizationProgressColor2,
            ovalCustomizationProgressRadialOffset = ovalCustomizationProgressRadialOffset,
            frameCustomizationBorderWidth = frameCustomizationBorderWidth,
            frameCustomizationCornerRadius = frameCustomizationCornerRadius,
            frameCustomizationBorderColor = frameCustomizationBorderColor,
            frameCustomizationBackgroundColor = frameCustomizationBackgroundColor,
            frameCustomizationElevation = frameCustomizationElevation,
            overlayCustomizationBackgroundColor = overlayCustomizationBackgroundColor,
            overlayCustomizationBrandingImage = overlayCustomizationBrandingImage,
            overlayCustomizationShowBrandingImage = overlayCustomizationShowBrandingImage,
            feedbackCustomizationCornerRadius = feedbackCustomizationCornerRadius,
            feedbackCustomizationBackgroundColors = feedbackCustomizationBackgroundColors,
            feedbackCustomizationTextColor = feedbackCustomizationTextColor,
            feedbackCustomizationTextFont = feedbackCustomizationTextFont,
            feedbackCustomizationEnablePulsatingText = feedbackCustomizationEnablePulsatingText,
            feedbackCustomizationElevation = feedbackCustomizationElevation,
            exitAnimationStyle = exitAnimationStyle,
            cancelButtonCustomImage = cancelButtonCustomizationCustomImage,
            cancelButtonLocation = cancelButtonCustomizationLocation,
//            resultScreenOverrideSuccessMessage = resultScreenOverrideSuccessMessage,
        ).build()

    }
}