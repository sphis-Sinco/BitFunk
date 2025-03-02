introTextVariableName = 'introText'

introTextFileName = 'intro'

boxVarName = 'blackbox'
boxColor = '7F000000'

function onCountdownStarted()
        debug = getDataFromSave('bit_funk_savedata', 'debug', false)

        introTextFile = 'data/' .. songPath .. '/' .. introTextFileName .. '.txt'
        displayIntro = checkFileExists(introTextFile) == true and getDataFromSave('bit_funk_savedata', 'song_intro_text', true) == true

        if displayIntro then
                introText = getTextFromFile(introTextFile)

                makeLuaSprite(boxVarName, nil, 0, -160)
                makeGraphic(boxVarName, screenWidth, screenHeight, boxColor)
                addLuaSprite(boxVarName, true)

                makeLuaText(introTextVariableName, introText, 0, 0.0, 0.0)
                setTextSize(introTextVariableName, 32)
                screenCenter(introTextVariableName)
                addLuaText(introTextVariableName)

                runTimer("pre-erase")
        end
        if debug then
                debugPrint(introTextFile)
                if displayIntro then
                        debugPrint(getTextFromFile(introTextFile))
                end
        end
end

function onTimerCompleted(tag, loops, loopsLeft)
        if tag == 'pre-erase' then
                doTweenAlpha('box-tween',boxVarName, 0.0, 1.0, "linear")
                doTweenAlpha('intro-tween',introTextVariableName, 0.0, 1.0, "linear")
        end
end

function onTweenCompleted(tag, vars)
        if tag == 'box-tween' then
                removeLuaSprite(boxVarName)
        end
        if tag == 'intro-tween' then
                removeLuaText(boxVarName)
        end
end