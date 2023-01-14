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
    local function colourSubMenu(parent, set, get, name)
        local colours = {}
        --menu.add_feature(name, type, parent, function()
        menu.add_feature(name, "parent", parent, name)
        --menu.add_feature("Automatic Crasher", "parent", parent, "xd")
        local function createColourChangeSliders(parent, names)
            for _,name in pairs(names) do
                colours[name] = essentials.createSlider(parent, name, "action_value_i", 0, 255, 3, "Colour Settings", 0, name, essentials)
            end
        end
    
        local oldColour = nil
        local oldVehicle
        local function previewColour(feat)
            while feat.on and system.wait() do
                local veh = player.get_player_vehicle(player.player_id())
                if entity.is_entity_a_vehicle(veh) then 
                    if oldVehicle ~= veh then 
                        oldColour = get(veh)
                        oldVehicle = veh 
                    end
                    set(veh, essentials.RGBAToInt(colours['Red'].value,colours['Green'].value,colours['Blue'].value))
                else 
                    menu.notify("You must be in a vehicle to use this feature.", "Colour Preview", 4, 0xff0000ff)
                    oldColour = nil 
                    oldVehicle = nil
                end
            end 
            if oldVehicle and entity.is_entity_a_vehicle(oldVehicle) then
                set(oldVehicle, oldColour)
            end
            return feat
        end
    
        function applyColour(feat)
            set(oldVehicle, essentials.RGBAToInt(colours['Red'].value,colours['Green'].value,colours['Blue'].value))
            oldColour = nil 
            oldVehicle = nil
        end
    
        local function rainbowCar(feat)
            while feat.on and system.wait() do 
                local veh = player.get_player_vehicle(player.player_id())
                if entity.is_entity_a_vehicle(veh) then 
                    if oldVehicle ~= veh then 
                        oldColour = get(veh)
                        oldVehicle = veh 
                    end
                    set(veh, nextRainbowColour(get(veh)))
                else 
                    menu.notify("You must be in a vehicle to use this feature.", "Rainbow Colour", 4, 0xff0000ff)
                    oldColour = nil 
                    oldVehicle = nil
                end
                
            end
        end
    
        createColourChangeSliders(name, {"Red","Green","Blue"})
        previewToggle = menu.add_feature("Preview Colour", "toggle", name, previewColour)
        menu.add_feature("Apply Colour", "action", name, applyColour)
        --menu.add_feature("Rainbow", "toggle", parent.id, rainbowCar)
    end
    
    colourSubMenu("colourParent", vehicle.set_vehicle_custom_primary_colour, vehicle.get_vehicle_custom_primary_colour, "Primary Colour")
    colourSubMenu("colourParent", vehicle.set_vehicle_custom_secondary_colour, vehicle.get_vehicle_custom_secondary_colour, "Secondary Colour")
    colourSubMenu("colourParent", vehicle.set_vehicle_custom_pearlescent_colour, vehicle.get_vehicle_custom_pearlescent_colour, "Pearlescent Colour")
    colourSubMenu("colourParent", vehicle.set_vehicle_headlight_color, vehicle.get_vehicle_headlight_color, "Headlight Colour")
    colourSubMenu("colourParent", vehicle.set_vehicle_neon_lights_color, vehicle.get_vehicle_neon_lights_color, "Underglow Colour")  
    return essentials
end

return run