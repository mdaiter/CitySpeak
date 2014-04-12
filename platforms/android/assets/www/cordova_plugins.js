cordova.define('cordova/plugin_list', function(require, exports, module) {
module.exports = [
    {
        "file": "plugins/com.phonegap.plugins.speech/SpeechRecognizer.js",
        "id": "com.phonegap.plugins.speech.SpeechRecognizer",
        "clobbers": [
            "plugins.speechrecognizer"
        ]
    },
    {
        "file": "plugins/in.girish.datagram/www/datagram.js",
        "id": "in.girish.datagram.datagram"
    },
    {
        "file": "plugins/edu.uic.udptransmit/www/udptransmit.js",
        "id": "edu.uic.udptransmit.udptransmit",
        "merges": [
            "udptransmit"
        ]
    }
];
module.exports.metadata = 
// TOP OF METADATA
{
    "com.phonegap.plugins.speech": "1.0.0",
    "in.girish.datagram": "0.1.0",
    "edu.uic.udptransmit": "0.0.1"
}
// BOTTOM OF METADATA
});