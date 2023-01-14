local essentials = {}
_G._menu = {}

local oldAdd = menu.add_feature
menu.add_feature = function(name, menuType, parent, ...)
    
    local args ={...}
    local callback
    local indexName
    if type(parent) == "number" then 
        if parent == 0 and #args < 1 then
            return oldAdd(name, menuType, parent, ...)
        end
    end
    if menuType ~= "parent" then 
        callback = args[1] 
        if #args > 1 then
            indexName = args[#args]
        end 
    else 
        indexName = args[#args]
    end
    if _G._menu == {} then 
        menu.notify(name)
    end
    local feat
    if type(parent) == "string" then 
        local _parent = parent
        parent = essentials.getMenu(parent)
        if parent == nil then 
            menu.notify(_parent, "Invalid parent")            
        else 
            feat = oldAdd(name, menuType, parent.id, callback)
        end
    else 
        feat = oldAdd(name, menuType, parent, callback)
    end
    if indexName then
        essentials.addMenu(indexName, feat)
    end
    return feat
end


function essentials.getPlayers(ignoreModders)
    local players = {}
    for i = 0 , 31 do 
        if player.is_player_valid(i) then 
            if not ignoreModders or player.get_player_modder_flags(i) == 0 then
                table.insert(players, i)
            end
        end
    end
    return players
end

function essentials.getVehicles() 
    local vehicles = {}
    for _,veh in pairs(vehicle.get_all_vehicles()) do 
        if entity.is_entity_a_vehicle(veh) then 
            table.insert(vehicles, veh)
        end
    end 
    return vehicles 
end

function essentials.getInt(max)
    local code,result = input.get("Input Value", "", max, 3)
    while code ~= 0 do 
        code,result = input.get("Input Value", "", max, 3)
        if code == 2 then return end
        system.wait()   
    end
    return {code,result}
end

function essentials.applyVelocity(feat, vel)
    local playerPed = player.player_ped()
    local vel = v3(500,0,500)
    local veh = player.get_player_vehicle(player.player_id())
    if veh then 
        entity.set_entity_velocity(veh, vel)
    else
        entity.set_entity_velocity(player.player_ped(), vel)
    end
end

function essentials.clamp(x, min, max)
    return math.min(math.max(x, min), max);
end

function essentials.RGBAToInt(R, G, B, A)
    A = A or 255
    return ((R&0x0ff)<<0x00)|((G&0x0ff)<<0x08)|((B&0x0ff)<<0x10)|((A&0x0ff)<<0x18)
end

function essentials.IntToRGBA(int)
	local b = int % 256
	local g = math.floor(int / 256) % 256
	local r = math.floor(int / 65536) % 256
	local a = math.floor(int / 16777216) % 256
	return r, g, b, a
end


function essentials.rainbow(time)
    menu.notify(tostring(time))
    local r = 0.5 + 0.5 * math.sin(0.3 * time + 0)
    local g = 0.5 + 0.5 * math.sin(0.3 * time + (2 * math.pi / 3))
    local b = 0.5 + 0.5 * math.sin(0.3 * time + (4 * math.pi / 3))
    return math.floor(r), math.floor(g), math.floor(b)
end

function essentials.nextRainbowColour(int)
    local r, g, b = IntToRGBA(int)
    r, g, b = rainbow(utils.time_ms())
    return RGBAToInt(r, g, b, 255)  
end

function essentials.createSlider(parent,name,type,min,max,length,title,...)
    if not default then default = 0 end 
    local args = {...}
    if #args > 1 then 
        default = args[1]
    end
    local essentials = args[#args]
    if not essentials then 
        menu.notify("INVALID ARGS") 
    end
    local slider
    slider = menu.add_feature(name, type, parent, function()
        result = essentials.getInt(length)
        if result ~= nil and #result == 2 then
            result = tonumber(result[2])
            if result <= max and result >= min then  
                slider.value = result
                menu.notify("Value changed to "..tostring(result), title, 4, 0xff00ff00)
            else 
                menu.notify("Please input a number between "..tostring(min).. " and "..tostring(max), "Invalid Input", 4, 0xff0000ff)
            end
        else 
            menu.notify("Nothing was input, cancelled?", "Input Cancelled", 4, 0xff0000ff)
        end
    end)
    slider.min = min 
    slider.max = max
    slider.value = essentials.clamp(default, min, max)
    return slider
end

function essentials.addMenu(name, feat)
    _G._menu[name] = feat
    return _G._menu
end

function essentials.getMenu(name)
    if not name then
        return _G._menu
    else 
        return _G._menu[name]
    end
end

function essentials.split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

function essentials.logSCIDs(scid)
    local file = io.open(utils.get_appdata_path("PopstarDevs", "2Take1Menu").."\\".."scripts\\Protons Files\\logs\\scids.txt", "a+")
    local append = ""
    local read = file:read()
    file:close()
    for _,playerID in next, essentials.getPlayers() do 
        local scid = player.get_player_scid(playerID)
        if scid and not string.find(read, tostring(scid)) then 
            append = append .. scid.. "\n"
        end 
    end
    if append ~= "" then 
        local file = io.open(utils.get_appdata_path("PopstarDevs", "2Take1Menu").."\\".."scripts\\Protons Files\\logs\\scids.txt", "a+")
        file:write(append)
        file:close()
        menu.notify("Stored SCIDS")
    end 
    return true
end

function essentials.postWebhook(webhook, content, username)
    return web.request(webhook, {
        headers = {"Proton: Scripts", "Content-Type: application/json"},
        method = 'post',
        data = '{"content":"'..content..'"}, "username":'..username..'"}'
    })
end

function essentials.username() 
    return player.get_player_name(player.player_id())
end

function essentials.constants()
    return {
        ["VERSION"] = "1.0.0",
    }
end

return essentials