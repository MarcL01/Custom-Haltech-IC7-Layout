
pragma Singleton
import QtQuick 2.3

Item {
    // General Properties
    readonly property string defaultBGColor: "#000000"
    readonly property string defaultBorderColor: Qt.rgba(0/255, 166/255, 231/255, 1)
    readonly property string defaultTextColor: Qt.rgba(0/255, 166/255, 231/255, 1)
    readonly property string successColor: "green"
    readonly property string defaultSeperationLineColor: "#353632"
    readonly property string defaultErrorHeaderTextColor: "red"
    readonly property font defaultMenuPageHeaderFont: Qt.font({family: 'HelveticaNeueLTW1GRoman', pointSize: 37})
    readonly property font defaultMenuPageInfoTextFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 22})
    readonly property font defaultMenuPageContentFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 20})

    // Top Bar Properties
    readonly property string topBarLineColor: "#ffffff"
    readonly property int topBarLineHeight: 2
    readonly property int topBarLineWidth: 780
    readonly property int topBarHeight: 78

    // Custom Combo Box Properties (Done as per CMC Specs)
    readonly property string comboBoxBorderColor: "#ffffff"
    readonly property string comboBoxPressedColor: "#ffffff"
    readonly property string comboBoxSelectedBGColor: Qt.rgba(122/255, 199/255, 67/255, 1)
    readonly property font comboBoxTextFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 20})
    readonly property font comboBoxItemDelegateFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 20})
    readonly property string comboBoxSelectedObjectFontColor: comboBoxPressedColor
    readonly property string comboBoxNonSelectedObjectFontColor: Qt.lighter(defaultSeperationLineColor, 1.8)

    // Custom Switch Button Properties
    readonly property string customSwitchCheckedColor: Qt.lighter(defaultTextColor, 1.8)
    readonly property string customSwitchUnCheckedColor: "#ffffff"

    // Custom Radio button Properties (Done as per CMC Specs)
    readonly property string radioButtonTextColor: "#ffffff"
    readonly property font radioButtonTextFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 20})
    readonly property font radioButtonSelectedTextFont: Qt.font({family: 'HelveticaNeueLTW1GBd', pointSize: 20})

    // Custom Slider Properties
    readonly property string sliderSetColor: "#00b8f2"
    readonly property string sliderUnSetColor: "#ffffff"
    readonly property string sliderHandleColor: "#ffffff"

    //Custom Text Button Properties (Done as per CMC Specs)
    readonly property font textButtonDefaultFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 20})
    readonly property string textButtonTextColor: "#ffffff"

    //Custom Square Help Button Properties (Done as per CMC Specs)
    readonly property font squareHelpButtonDefaultFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 20})
    readonly property string squareHelpButtonTextColor: "#ffffff"

    //Tumpler object.
    readonly property string tumblerSelectedObjectFontColor: defaultTextColor
    readonly property string tumblerNonSelectedObjectFontColor: Qt.darker(defaultTextColor, 1.5)

    //Top Bar Cancel Button Properties (Done as per CMC Specs)
    readonly property font topBarCancelButtonFont: Qt.font({family: 'HelveticaNeueLTW1GMd', pointSize: 20})

    //Custom Text Field Properties (CMC Specs missing for this element)
    readonly property font customTextFieldFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 20})

    // Error Page Properties (CMC Specs missing for this page)
    readonly property string errorPageContentRectangleColor: "#ffffff"
    readonly property font errorPageHeaderFont: defaultMenuPageHeaderFont
    readonly property font errorPageContentFont: Qt.font({family: 'HelveticaNeueLTW1GBd', pointSize: 20})

    // Time Remaining screen properties
    readonly property string timeRemainingEndPointRectangleColor: "#ffffff"

    // Right Bar Properties
    readonly property string rightBarMenuBGColor: Qt.darker("#777777", 1.95)

    // Common Menu properties
    readonly property string menuInfoTextColor: "#ffffff"
    readonly property string menuButtonBorderColor: "#000000"
    readonly property string menuButtonBGColor: Qt.darker("#333333", 2.0)
    readonly property string menuButtonTextColor: "#ffffff"

    // Menu Set Date properties (Done as per CMC Specs, see notes below, 'Done' buton not added yet.)
    readonly property string menuSetDateTextColor: "#ffffff"
    readonly property font menuSetDateHeaderFont: defaultMenuPageHeaderFont
    readonly property font menuSetDateDateTextWhenYearFieldFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 37})
    readonly property font menuSetDateDateTextWhenNotYearFieldFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 64})// TODO CMC has specified 75 but had to bring it down to 64.

    // Menu Set Time properties (CMC Specs missing for this page)
    readonly property font menuSetTimeHeaderFont: defaultMenuPageHeaderFont
    readonly property font menuSetTimeColonFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 64})
    readonly property font menuSetTimeTextFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 40})

    //Menu Contrast And Alarm Settings. (CMC Specs missing for this page)
    readonly property font menuContrastHeaderFont: defaultMenuPageHeaderFont
    readonly property font menuContrastInfoTextFont: defaultMenuPageInfoTextFont

    //Menu High level procedure. (CMC Specs missing for this page)
    readonly property font menuHighLevelProcedureHeaderFont: defaultMenuPageHeaderFont
    readonly property font menuHighLevelProcedureInfoTextFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 18})

    //Menu Network Settings. (CMC Specs missing for this page)
    readonly property font menuNetworkSettingsHeaderFont: defaultMenuPageHeaderFont
    readonly property font menuNetworkSettingsInfoTextFont: defaultMenuPageInfoTextFont
    readonly property font menuNetworkSettingsContentFont: defaultMenuPageContentFont

    //Menu Page Settings. (Done as per CMC Specs with some exceptions.)
    readonly property font menuPageButtonTextFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 16}) // TODO CMC has specified 22 but had to bring it down to 16.

    //Menu Printer Settings. (CMC Specs missing for this page)
    readonly property font menuPrinterSettingsHeaderFont: defaultMenuPageHeaderFont
    readonly property font menuPrinterSettingsInfoTextFont: defaultMenuPageInfoTextFont

    //Menu Program Operator ID Settings. (CMC Specs missing for this page)
    readonly property font menuProgramOperatorIDHeaderFont: defaultMenuPageHeaderFont
    readonly property font menuProgramOperatorIDInfoTextFont: defaultMenuPageInfoTextFont

    //Menu Program Probe ID Settings. (CMC Specs missing for this page)
    readonly property font menuProgramProbeIDHeaderFont: defaultMenuPageHeaderFont
    readonly property font menuProgramProbeIDInfoTextFont: defaultMenuPageInfoTextFont

    //Menu Device Specifications. (CMC Specs missing for this page)
    readonly property font menuDeviceSpecificationsHeaderFont: defaultMenuPageHeaderFont
    readonly property font menuDeviceSpecificationsInfoTextFont: defaultMenuPageInfoTextFont

    // Splash screen properties
    readonly property string splashScreenLogoRectangleBGColor: "#000000"
    readonly property string splashScreenTaskStoppedColor: "red"
    readonly property string splashScreenTaskStartingColor: "yellow"
    readonly property string splashScreenTaskRunningColor: "green"
    readonly property string splashScreenTaskSeqAnimationToColor: "#ffffff"
    readonly property string splashScreenInfoRectangleBGColor: "#ffffff"

    // TopBar properties (Done as per CMC Specs)
    readonly property string topBarDateTimeTextColor: "#ffffff"
    readonly property string topBarMenuTextColor: Qt.rgba(177/255, 177/255, 177/255, 1)
    readonly property font topBarTimeFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 42})
    readonly property font topBarDateFont: Qt.font({family: 'HelveticaNeueLTW1GRoman', pointSize: 14})
    readonly property font topBarMenuTextFont: Qt.font({family: 'HelveticaNeueLTW1GRoman', pointSize: 18})
    readonly property font topBarProcessStepFont: Qt.font({family: 'HelveticaNeueLTW1GRoman', pointSize: 26})

    // Text and animation screen properties. (CMC Specs missing for this page)
    readonly property font textAndAnimationPrimaryPhraseFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 22})
    readonly property font textAndAnimationSecondaryPhraseFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 18})
    readonly property font textAndAnimationPlainTextStringFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 14})
    readonly property string textAndAnimationSecondaryPhraseFontColor: "#ffffff"
    readonly property string textAndAnimationPlainTextStringFontColor: "#ffffff"

    // Text with buttons screen properties. (CMC Specs missing for this page)
    readonly property font textWithButtonsPrimaryPhraseFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 28})
    readonly property font textWithButtonsSecondaryPhraseFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 18})
    readonly property font textWithButtonsPlainTextStringFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 16})
    readonly property string textWithButtonsSecondaryPhraseFontColor: "#ffffff"
    readonly property string textWithButtonsPlainTextStringFontColor: "#ffffff"

    //Full Screen Time Remaining Properties (CMC Specs missing for this page)
    readonly property font fullScreenTimeRemainingHeaderFont: Qt.font({family: 'HelveticaNeueLTW1GRoman', pointSize: 26})
    readonly property font fullScreenTimeRemainingInCircleMessageFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 22})
    readonly property font fullScreenTimeRemainingTimeRemainingClockFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 44})

    //List Page Properties (Done as per CMC Specs)
    readonly property font listPageHeaderFont: Qt.font({family: 'HelveticaNeueLTW1GRoman', pointSize: 37})
    readonly property font listPageListElementSelectedFont: Qt.font({family: 'HelveticaNeueLTW1GMd', pointSize: 27})
    readonly property font listPageListElementFont: Qt.font({family: 'HelveticaNeueLTW1G45Lt', pointSize: 22})

    readonly property string listPageListElementSeperationLineDefaultColor: Qt.darker("#777777", 1.95)
    readonly property string listPageListElementUnSelectedTextColor: "#ffffff"
}
