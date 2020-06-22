import time
import catalog

def sendText(FIREFOX, text):
    script = "document.getElementById('container').dispatchEvent(new KeyboardEvent('"
    keydownprefix = "{}keydown',".format(script)
    openbracket = "{"
    closebracket = "}))"
    keyupprefix = "{}keyup',".format(script)

    sdownscript = "{}{}".format(
        script, "keydown',{'keyCode': 16, 'which': 16, 'code': 'ShiftLeft'}))")
    supscript = "{}{}".format(
        script, "keyup',  {'keyCode': 16, 'which': 16, 'code': 'ShiftLeft'}))")

    FIREFOX.execute_script("{}{}".format(
        script, "keydown',{'keyCode': 9, 'which': 9, 'code': 'Tab'}))"))
    for char in text:
        if char == ":":
            kdownscript = "{}{}".format(
                script, "keydown',{'keyCode': 186, 'which': 186, 'code': 'Semicolon'}))")
            kupscript = "{}{}".format(
                script, "keyup',{'keyCode': 186, 'which': 186, 'code': 'Semicolon'}))")
            FIREFOX.execute_script(sdownscript)
            FIREFOX.execute_script(kdownscript)
            FIREFOX.execute_script(kupscript)
            FIREFOX.execute_script(supscript)
        elif char == "_":
            kdownscript = "{}{}".format(
                script, "keydown',{'keyCode': 189, 'which': 189, 'code': 'Minus'}))")
            kupscript = "{}{}".format(
                script, "keyup',{'keyCode': 189, 'which': 189, 'code': 'Minus'}))")
            FIREFOX.execute_script(sdownscript)
            FIREFOX.execute_script(kdownscript)
            FIREFOX.execute_script(kupscript)
            FIREFOX.execute_script(supscript)
        else:
            downscript = "{}{}'keyCode':{}, 'which':{}, 'code': '{}'{}".format(
                keydownprefix, openbracket, catalog.getKeyInfo(char)["keyCode"], catalog.getKeyInfo(char)["keyCode"], catalog.getKeyInfo(char)["code"], closebracket
            )
            upscript = "{}{}'keyCode':{}, 'which':{}, 'code': '{}'{}".format(
                keyupprefix, openbracket, catalog.getKeyInfo(char)["keyCode"], catalog.getKeyInfo(char)["keyCode"], catalog.getKeyInfo(char)["code"], closebracket
            )
            FIREFOX.execute_script(downscript)
            FIREFOX.execute_script(upscript)
    time.sleep(10)
    FIREFOX.execute_script("{}{}".format(
        script, "keydown',{'keyCode': 13, 'which': 13, 'code': 'Enter'}))"))
    FIREFOX.execute_script("{}{}".format(
        script, "keyup',{'keyCode': 13, 'which': 13, 'code': 'Enter'}))"))