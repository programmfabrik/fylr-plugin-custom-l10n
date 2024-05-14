class CustomL10
  constructor: ->
    baseConfig = ez5.session.getBaseConfig("plugin", "custom-l10n")
    
    # debug activated?
    if baseConfig.CustomL10n?.enabledebug
        console.warn "ez5.loca.strings", ez5.loca.strings
    
    customStrings = baseConfig.CustomL10n?.templates
    
    if customStrings.length > 0
        for customString in customStrings 
            for l10nKey, l10nValue of customString?.translation
                if ! ez5.loca.strings?[l10nKey]
                    ez5.loca.strings[l10nKey] = []
                if ! ez5.loca.strings?[l10nKey]?[customString.original]
                    ez5.loca.strings[l10nKey][customString.original] = {}
                ez5.loca.strings[l10nKey][customString.original] = l10nValue

CUI.ready ->
  new CustomL10()
