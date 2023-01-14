local files = {
    ["home"]=utils.get_appdata_path("PopstarDevs", "2Take1Menu"),
}

files.protons_stuff = "Protons Files."
files.features = files.protons_stuff.."features."

local oldreq = require
local require = function(name, yes, feature)
    if not yes then return oldreq(name) end 
    if not feature then 
        return oldreq(files.protons_stuff..name) 
    else 
        return oldreq(files.features..name) 
    end 
end

local essentials = require("essentials", true)

menu.add_feature("Protons Menu", "parent", 0, "mainParent")
menu.add_feature("Self", "parent", "mainParent", "selfMenu")
menu.add_feature("Vehicle Options", "parent", "selfMenu", "vehicleMenu")
menu.add_feature("Local Colour Settings", "parent", "vehicleMenu", "colourParent")

menu.add_feature("Lobby Options", "parent", "mainParent", "lobbyOptions")
menu.add_feature("Vehicle Options", "parent", "lobbyOptions", "playerParent")
menu.add_feature("Griefing Players", "parent", "lobbyOptions", "griefingParent")
menu.add_feature("Automatic Crasher", "parent", "griefingParent", "autoCrashingMenu")


menu.add_feature("Script Logger", "parent", "mainParent", "loggerParent")

menu.add_feature("Recovery Options", "parent", "mainParent", "recoveryOptions")

menu.add_feature("Air Cargo", "parent", "recoveryOptions", "airCargo")

menu.add_feature("Instant Access", "parent", "recoveryOptions", "instantAccess")

menu.add_feature("Miscellaneous Options", "parent", "mainParent", "miscParent")
menu.add_feature("Overlay", "parent", "miscParent", "overlayParent")

for _,filename in next, utils.get_all_files_in_directory(files.home.."\\Scripts\\Protons Files\\Features", "lua") do 
    local succ, err = pcall(function()
        essentials = require(essentials.split(filename, ".")[1], true, true)(essentials)
    end)
    if not succ then 
        menu.notify("Error in "..filename.." output in console.")
        print(err)
    end
end 


menu.notify("Welcome "..essentials.username(), "Protons Menu")

