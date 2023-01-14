local files = {
    ["home"]=utils.get_appdata_path("PopstarDevs", "2Take1Menu"),
}

files.protons_stuff = "Protons Files."
files.features = files.protons_stuff.."features."

local oldreq = require
local require = function(name, feature) 
    if not feature then 
        return oldreq(files.protons_stuff..name) 
    else 
        return oldreq(files.features..name) 
    end 
end


local function run(...)
    local args = {...}
    local essentials = args[1]

    local sizeSlider
    local phoneType
    local function phoneSize(feat)
        while feat.on and system.wait() do 
            native.call(0xCBDD322A73D6D932, sizeSlider.value)
        end 
        native.call(0xCBDD322A73D6D932, 500.0)
    end 
    
    local function phoneType(feat)
        while feat.on and system.wait() do 
            --menu.notify(tostring(native.call(0xC4E2813898C97A4B):__tointeger()))
            native.call(0x3BC861DF703E5097)
            native.call(0xF511F759238A5122, true)
            native.call(0xA4E8E696C532FBC7, phoneType.value)
        end 
        native.call(0xA4E8E696C532FBC7, 0)
    end

    menu.add_feature("Change Phone Size", "toggle", "miscParent", phoneSize)
    sizeSlider = essentials.createSlider("miscParent", "Phone Size", "action_value_f", -9999, 9999, 4, "Phone Size", 500, essentials) 
    menu.add_feature("Change Phone Type", "toggle", "miscParent", phoneType)
    phoneType = essentials.createSlider("miscParent", "Phone Type", "action_value_i", 0, 4, 1, "Phone Type", essentials) 
    return essentials
end 

return run