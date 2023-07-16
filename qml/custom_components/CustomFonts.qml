pragma Singleton
import QtQuick 2.9

Item {
    // Style names
    readonly property string rajdhaniBold: "Bold"
    readonly property string rajdhaniLight: "Light"
    readonly property string rajdhaniMedium: "Medium"
    readonly property string rajdhaniRegular: "Regular"
    readonly property string rajdhaniSemiBold: "SemiBold"

    // Font loaders
    readonly property var rajdhani: FontLoader {
        source: "../../styles/Rajdhani-Regular.ttf"
    }

    FontLoader {
        source: "../../styles/Rajdhani-Bold.ttf"
    }

    FontLoader {
        source: "../../styles/Rajdhani-Light.ttf"
    }

    FontLoader {
        source: "../../styles/Rajdhani-Medium.ttf"
    }


    FontLoader {
        source: "../../styles/Rajdhani-SemiBold.ttf"
    }
}
