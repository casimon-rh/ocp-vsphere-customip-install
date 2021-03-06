KEYS = {
    "a": { "keyCode": "65", "code": "KeyA" },
    "b": { "keyCode": "66", "code": "KeyB" },
    "c": { "keyCode": "67", "code": "KeyC" },
    "d": { "keyCode": "68", "code": "KeyD" },
    "e": { "keyCode": "69", "code": "KeyE" },
    "f": { "keyCode": "70", "code": "KeyF" },
    "g": { "keyCode": "71", "code": "KeyG" },
    "h": { "keyCode": "72", "code": "KeyH" },
    "i": { "keyCode": "73", "code": "KeyI" },
    "j": { "keyCode": "74", "code": "KeyJ" },
    "k": { "keyCode": "75", "code": "KeyK" },
    "l": { "keyCode": "76", "code": "KeyL" },
    "m": { "keyCode": "77", "code": "KeyM" },
    "n": { "keyCode": "78", "code": "KeyN" },
    "o": { "keyCode": "79", "code": "KeyO" },
    "p": { "keyCode": "80", "code": "KeyP" },
    "q": { "keyCode": "81", "code": "KeyQ" },
    "r": { "keyCode": "82", "code": "KeyR" },
    "s": { "keyCode": "83", "code": "KeyS" },
    "t": { "keyCode": "84", "code": "KeyT" },
    "u": { "keyCode": "85", "code": "KeyU" },
    "v": { "keyCode": "86", "code": "KeyV" },
    "w": { "keyCode": "87", "code": "KeyW" },
    "x": { "keyCode": "88", "code": "KeyX" },
    "y": { "keyCode": "89", "code": "KeyY" },
    "z": { "keyCode": "90", "code": "KeyZ" },
    "0": { "keyCode": "48", "code": "Digit0" },
    "9": { "keyCode": "57", "code": "Digit9" },
    "8": { "keyCode": "56", "code": "Digit8" },
    "7": { "keyCode": "55", "code": "Digit7" },
    "6": { "keyCode": "54", "code": "Digit6" },
    "5": { "keyCode": "53", "code": "Digit5" },
    "4": { "keyCode": "52", "code": "Digit4" },
    "3": { "keyCode": "51", "code": "Digit3" },
    "2": { "keyCode": "50", "code": "Digit2" },
    "1": { "keyCode": "49", "code": "Digit1" },
    "=": { "keyCode": "187", "code": "Equal" },
    "-": { "keyCode": "189", "code": "Minus" },
    "/": { "keyCode": "191", "code": "Slash" },
    "[": { "keyCode": "219", "code": "BracketLeft" },
    "]": { "keyCode": "221", "code": "BracketRight" },
    "\\": { "keyCode": "220", "code": "Backslash" },
    ";": { "keyCode": "186", "code": "Semicolon" },
    "'": { "keyCode": "222", "code": "Quote" },
    ",": { "keyCode": "188", "code": "Comma" },
    ".": { "keyCode": "190", "code": "Period" },
    " ": { "keyCode": "32", "code": "Space"
    }
}

def getKeyInfo(char) :
  return KEYS[char]