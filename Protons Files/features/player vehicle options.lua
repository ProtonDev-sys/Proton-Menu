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
    function launchCars(feat,stopped)
        while feat.on and system.wait(1000) do 
            for _,veh in next, essentials.getVehicles() do 
                if not stopped or vehicle.is_vehicle_stopped(veh) then 
                    menu.create_thread(function()
                        local start = utils.time_ms()
                        repeat system.wait()
                            if network.request_control_of_entity(veh) then
                                entity.set_entity_velocity(veh, v3(math.random(-5000,5000),math.random(-5000,5000),math.random(-5000,5000)))
                                break
                            end
                        until utils.time_ms() - start > 500
                    end)
                end
            end 
        end
    end

    function deleteCars(feat, destroyed)
        while feat.on and system.wait(1000) do 
            for _,veh in next, essentials.getVehicles() do 
                if not destroyed or entity.is_entity_dead(veh) then 
                    menu.create_thread(function()
                        local start = utils.time_ms()
                        repeat system.wait()
                            if network.request_control_of_entity(veh) then
                                entity.delete_entity(veh)
                                break
                            end
                        until utils.time_ms() - start > 500
                    end)
                end
            end 
        end
    end

    launchStoppedCars = menu.add_feature("Launch Stopped Vehicles", "toggle", "playerParent", function(feat)
        launchCars(feat, true)
    end)

    launchAllCars = menu.add_feature("Launch All Vehicles", "toggle", "playerParent", function(feat)
        launchCars(feat, false)
    end)

    deleteDestroyedCars = menu.add_feature("Delete Destroyed Vehicles", "toggle", "playerParent", function(feat)
        deleteCars(feat, true)
    end)

    deleteAllCars = menu.add_feature("Delete All Vehicles", "toggle", "playerParent", function(feat)
        deleteCars(feat)
    end)

    teleportAllVehicle = menu.add_feature("Teleport All Vehicle To Self", "action", "playerParent", function()
        for _,veh in next, essentials.getVehicles()  do 
            menu.create_thread(function()
                local start = utils.time_ms()
                repeat system.wait()
                    if network.request_control_of_entity(veh) then
                        entity.set_entity_coords_no_offset(veh, player.get_player_coords(player.player_id()))
                        break
                    end
                until utils.time_ms() - start > 500
            end)
            system.wait()
        end 
    end)

    destroyAllPlayerVehicles = menu.add_feature("Explode All Player Vehicles", "action", "playerParent", function()
        for _,veh in next, essentials.getVehicles() do 
            vehicle.add_vehicle_phone_explosive_device(veh)
            vehicle.detonate_vehicle_phone_explosive_device()
        end
    end)



    destroyAllVehicles = menu.add_feature("Explode All Vehicles", "action", "playerParent", function()
        for _,veh in next, essentials.getVehicles() do 
            fire.add_explosion_ex(entity.get_entity_coords(veh), 4, 1.0, true, false , 0.0, player.player_ped())
        end
    end)


    attachVehiclesToYou = menu.add_feature("Attach All Vehicles To Self", "action", "playerParent", function()
        for _,veh in next, essentials.getVehicles() do 
            menu.create_thread(function()
                local start = utils.time_ms()
                repeat system.wait()
                    if network.request_control_of_entity(veh) then
                        entity.attach_entity_to_entity(veh, player.player_ped(), entity.get_entity_bone_index_by_name(player.player_ped(), "head"), v3(0,0,0), v3(0,0,0), false, false, false, 1, false)
                        break
                    end
                until utils.time_ms() - start > 500
            end)
        end
    end)

    deatachVehiclesToYou = menu.add_feature("Dettach All Vehicles From Self", "action", "playerParent", function()
        ent = entity.get_entity_attached_to(player.player_ped())
        while entity.is_an_entity(ent) and system.wait() do 
            entity.detach_entity(ent)
            ent = entity.get_entity_attached_to(player.player_ped())
            menu.notify(tostring(ent), "Vehicle Options", 4, 0xff00ff00)
        end
        menu.notify("All attachments detached.", "Vehicle Options", 4, 0xff00ff00)
    end)
    return essentials
end 

return run