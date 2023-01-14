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
    local cargoAmount

    function access(type) 
        for i = 0 , 2 ,1 do
            if type == "AirCargo" then 
                native.call(0x3ec562d93709c894,"appsmuggler")
                native.call(0x6caf14be58b4bff8,"appsmuggler")
                native.call(0xe81651ad79516e48,"appsmuggler",54000)
            elseif type == "Bunker" then 
                native.call(0x3ec562d93709c894,"appbunkerbusiness")
                native.call(0x6caf14be58b4bff8,"appbunkerbusiness")
                native.call(0xe81651ad79516e48,"appbunkerbusiness",54000)
            elseif type == "Agency" then 
                native.call(0x3ec562d93709c894,"appfixersecurity")
                native.call(0x6caf14be58b4bff8,"appfixersecurity")
                native.call(0xe81651ad79516e48,"appfixersecurity",54000)
            elseif type == "MasterControl" then 
                native.call(0x3ec562d93709c894,"apparcadebusinesshub")
                native.call(0x6caf14be58b4bff8,"apparcadebusinesshub")
                native.call(0xe81651ad79516e48,"apparcadebusinesshub",54000)
            elseif type == "Nightclub" then 
                native.call(0x3ec562d93709c894,"appbusinesshub")
                native.call(0x6caf14be58b4bff8,"appbusinesshub")
                native.call(0xe81651ad79516e48,"appbusinesshub",54000)
            elseif type == "Terrobyte" then 
                native.call(0x3ec562d93709c894,"apphackertruck")
                native.call(0x6caf14be58b4bff8,"apphackertruck")
                native.call(0xe81651ad79516e48,"apphackertruck",54000)
            end
        end
    end

    function maxAirCargoSell()
        local value = math.floor(2000000000/cargoAmount.value)
        script.set_global_i(284955, value)
        script.set_global_i(284956, value)
        script.set_global_i(284957, value)
        script.set_global_i(284958, value)
        script.set_global_i(284959, value)
        script.set_global_i(284960, value)
        script.set_global_i(284961, value)
        script.set_global_i(284962, value)
        script.set_global_i(284962, value)
        script.set_global_i(284963, value)
    end

    function removeAirCargoCooldown(feat)
        while feat.on and system.wait() do 
            script.set_global_i(2766148,0)
            script.set_global_i(284896,0)
            script.set_global_i(284897,0)
            script.set_global_i(284898,0)
            script.set_global_i(284899,0)
            script.set_global_i(284900,0)
        end

    end

    menu.add_feature("AirCargo", "action", "instantAccess", function()
        access("AirCargo")
    end)
    menu.add_feature("Bunker", "action", "instantAccess", function()
        access("Bunker")
    end)
    menu.add_feature("Agency", "action", "instantAccess", function()
        access("Agency")
    end)
    menu.add_feature("MasterControl", "action", "instantAccess", function()
        access("MasterControl")
    end)
    menu.add_feature("Nightclub", "action", "instantAccess", function()
        access("Nightclub")
    end)
    menu.add_feature("Terrobyte", "action", "instantAccess", function()
        access("Terrobyte")
    end)
    
    
    menu.add_feature("Remove Air Cargo Cooldown", "toggle", "airCargo", removeAirCargoCooldown)
    
    cargoAmount = essentials.createSlider("airCargo", "Cargo Amount", "action_value_i", 1, 50, 1, "Cargo Amount", 0, essentials)

    menu.add_feature("Set Cargo Sell Price to 2B (set your cargo amount first)", "action", "airCargo", function()
        maxAirCargoSell()
    end)

    return essentials
end

return run