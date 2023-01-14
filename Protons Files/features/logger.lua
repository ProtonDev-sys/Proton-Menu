local files = {
    ['home'] = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
}


local function run(...)
    local args = {...}
    local essentials = args[1] 
    
    local loggerSettings = {
        ['Script'] = "",
    }

    menu.add_feature("Scripts", "parent", "loggerParent", "scriptsToLog")
    menu.add_feature("Refresh Scripts", "action", "scriptsToLog", function()
        for _,v in next, menu.get_feature_by_hierarchy_key("local.script_features.protons_menu.script_logger.scripts").children do 
            if v.name ~= "Refresh Scripts" then
                menu.delete_feature(v.id)
            end
        end
        for _,filename in next, utils.get_all_files_in_directory(files.home.."\\Scripts", "lua") do 
            local name =  essentials.split(filename, ".")[1]
            menu.add_feature(filename, "action", "scriptsToLog", function()
                menu.notify("Script set to "..filename, "Script Logger", 4, 0xff00ff00)
                loggerSettings['Script'] = files.home.."\\Scripts\\"..name
            end, name)
        end
    end)

    local function log(logType,...)
    
        text = ""
        local args = {...}
        for i,v in next, args do 
            if i == 1 and logType == "native.call" then 
                local hex = string.format("%x", tonumber(v))
                local newstring = "0x"..string.rep("0", 16 - #hex) .. hex
                text = text .. newstring
            else
                if tonumber(v) == nil and type(v) == "string" then 
                    text = text .. '"'..tostring(v)..'"'
                else 
                    text = text .. tostring(v) .. ""
                end
            end
            if i ~= #args then 
                text = text .. ","
            end
        end
        if logged[text] then 
            logged[text] = logged[text] + 1 
            if logged[text] >= 1 then 
                return 
            end 
        else 
            logged[text] = 1
        end
        local file = io.open(utils.get_appdata_path("PopstarDevs", "2Take1Menu").."\\".."scripts\\Protons Files\\logs.txt", "a+")
        file:write(tostring(utils.time()).." "..logType.."("..text..")\n")
        file:close()
    end

    function addToLogMenu(parent, area)
        if not loggerSettings[parent] then 
            loggerSettings[parent] = {}
        end
        for _,v in next, area do 
            if type(v) == "function" then
                menu.add_feature(tostring(_), "toggle", parent, function(feat)
                    loggerSettings[parent][tostring(_)] = area[tostring(_)]
                    while feat.on do 
                        system.wait()
                    end 
                    loggerSettings[parent][tostring(_)] = nil
                end)
            end
        end
    end

    menu.add_feature("Logs", "parent", "loggerParent", "thingsToLog")
    menu.add_feature("Menu", "parent", "thingsToLog", "menu")
    addToLogMenu("menu", menu)
    menu.add_feature("Hooks", "parent", "thingsToLog", "hooks")
    addToLogMenu("hooks", hook)
    menu.add_feature("Player", "parent", "thingsToLog", "player")
    addToLogMenu("player", player)
    menu.add_feature("Ped", "parent", "thingsToLog", "ped")
    addToLogMenu("ped", ped)
    menu.add_feature("Vehicle", "parent", "thingsToLog", "vehicle")
    addToLogMenu("vehicle", vehicle)
    menu.add_feature("Entity", "parent", "thingsToLog", "entity")
    addToLogMenu("entity", entity)
    menu.add_feature("Object", "parent", "thingsToLog", "object")
    addToLogMenu("object", object)
    menu.add_feature("Weapon", "parent", "thingsToLog", "weapon")
    addToLogMenu("weapon", weapon)
    menu.add_feature("Streaming", "parent", "thingsToLog", "streaming")
    addToLogMenu("streaming", streaming)
    menu.add_feature("Ui", "parent", "thingsToLog", "ui")
    addToLogMenu("ui", ui)
    menu.add_feature("ScriptDraw", "parent", "thingsToLog", "scriptdraw")
    addToLogMenu("scriptdraw", scriptdraw)
    menu.add_feature("DSound", "parent", "thingsToLog", "dsound")
    addToLogMenu("dsound", dsound)
    menu.add_feature("Cam", "parent", "thingsToLog", "cam")
    addToLogMenu("cam", cam)
    menu.add_feature("Gameplay", "parent", "thingsToLog", "gameplay")
    addToLogMenu("gameplay", gameplay)
    menu.add_feature("Fire", "parent", "thingsToLog", "fire")
    addToLogMenu("fire", fire)
    menu.add_feature("Network", "parent", "thingsToLog", "network")
    addToLogMenu("network", network)
    menu.add_feature("Cutscene", "parent", "thingsToLog", "cutscene")
    addToLogMenu("cutscene", cutscene)
    menu.add_feature("Controls", "parent", "thingsToLog", "controls")
    addToLogMenu("controls", controls)
    menu.add_feature("Graphics", "parent", "thingsToLog", "graphics")
    addToLogMenu("graphics", graphics)
    menu.add_feature("Time", "parent", "thingsToLog", "time")
    addToLogMenu("time", time)
    menu.add_feature("AI", "parent", "thingsToLog", "ai")
    addToLogMenu("ai", ai)
    menu.add_feature("Decorator", "parent", "thingsToLog", "decorator")
    addToLogMenu("decorator", decorator)
    menu.add_feature("Interior", "parent", "thingsToLog", "interior")
    addToLogMenu("interior", interior)
    menu.add_feature("Water", "parent", "thingsToLog", "water")
    addToLogMenu("water", water)
    menu.add_feature("Stats", "parent", "thingsToLog", "stats")
    addToLogMenu("stats", stats)
    menu.add_feature("Script", "parent", "thingsToLog", "script")
    addToLogMenu("script", script)
    menu.add_feature("Audio", "parent", "thingsToLog", "audio")
    addToLogMenu("audio", audio)
    menu.add_feature("Worldprobe", "parent", "thingsToLog", "worldprobe")
    addToLogMenu("worldprobe", worldprobe)
    menu.add_feature("Rope", "parent", "thingsToLog", "rope")
    addToLogMenu("rope", rope)
    menu.add_feature("Timecycle", "parent", "thingsToLog", "timecycle")
    addToLogMenu("timecycle", timecycle)
    menu.add_feature("System", "parent", "thingsToLog", "system")
    addToLogMenu("system", system)
    menu.add_feature("Native", "parent", "thingsToLog", "native")
    addToLogMenu("native", native)
    menu.add_feature("Utils", "parent", "thingsToLog", "utils")
    addToLogMenu("utils", utils)
    menu.add_feature("Web", "parent", "thingsToLog", "web")
    addToLogMenu("web", web)
    menu.add_feature("IO", "parent", "thingsToLog", "io")
    addToLogMenu("io", io)
    menu.add_feature("Memory", "parent", "thingsToLog", "memory")
    addToLogMenu("memory", memory)
    menu.add_feature("Console", "parent", "thingsToLog", "console")
    addToLogMenu("console", console)
    
    menu.add_feature("Log Script", "action", "loggerParent", function()
        for i,v in next, loggerSettings do 
            if i ~= "Script" then 
                for i2,v2 in next, v do 
                    if type(v) == "function" then 
                        local old = v2
                        v = function(...)
                            log(i.."."..i2, ...)
                            return old(...)
                        end
                    end 
                end 
            end 
        end 
        require(loggerSettings['Script'])
    end)
    return essentials
end

return run