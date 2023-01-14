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
    function explodeAllPeds(feat)
        while feat.on and system.wait() do
            for _,playerID in next, essentials.getPlayers() do 
                if player.player_id() ~= playerID then 
                    fire.add_explosion_ex(entity.get_entity_coords(player.get_player_ped(playerID)), 4, 1.0, true, false , 0.0, player.player_ped())
                end
            end
        end
    end

    function explodeAllVehicles(feat)
        while feat.on and system.wait() do 
            for _,veh in next, essentials.getVehicles() do 
                fire.add_explosion_ex(entity.get_entity_coords(veh), 4, 1.0, true, false , 0.0, player.player_ped())
            end
        end 
    end

    local vehicleNames = {"adder","Airbus","Airtug","akula","akuma","alkonost","alpha","alphaz1","AMBULANCE","annihilator","annihilator2","apc","arbitergt","ardent","armytanker","armytrailer","armytrailer2","asbo","asea","asea2","asterope","astron","astron2","autarch","avarus","avenger","avenger2","avisa","bagger","baletrailer","Baller","baller2","baller3","baller4","baller5","baller6","baller7","banshee","banshee2","BARRACKS","BARRACKS2","BARRACKS3","barrage","bati","bati2","Benson","besra","bestiagts","bf400","BfInjection","Biff","bifta","bison","Bison2","Bison3","BjXL","blade","blazer","blazer2","blazer3","blazer4","blazer5","BLIMP","BLIMP2","blimp3","blista","blista2","blista3","BMX","boattrailer","bobcatXL","Bodhi2","bombushka","boor","boxville","boxville2","boxville3","boxville4","boxville5","brawler","brickade","brickade2","brioso","brioso2","brioso3","broadway","bruiser","bruiser2","bruiser3","brutus","brutus2","brutus3","btype","btype2","btype3","buccaneer","buccaneer2","buffalo","buffalo2","buffalo3","buffalo4","bulldozer","bullet","Burrito","burrito2","burrito3","Burrito4","burrito5","BUS","buzzard","Buzzard2","cablecar","caddy","Caddy2","caddy3","calico","CAMPER","caracara","caracara2","carbonizzare","carbonrs","Cargobob","cargobob2","Cargobob3","Cargobob4","cargoplane","cargoplane2","casco","cavalcade","cavalcade2","cerberus","cerberus2","cerberus3","champion","cheburek","cheetah","cheetah2","chernobog","chimera","chino","chino2","cinquemila","cliffhanger","clique","club","coach","cog55","cog552","cogcabrio","cognoscenti","cognoscenti2","comet2","comet3","comet4","comet5","comet6","comet7","conada","contender","coquette","coquette2","coquette3","coquette4","corsita","cruiser","CRUSADER","cuban800","cutter","cyclone","cyclone2","cypher","daemon","daemon2","deathbike","deathbike2","deathbike3","defiler","deity","deluxo","deveste","deviant","diablous","diablous2","dilettante","dilettante2","Dinghy","dinghy2","dinghy3","dinghy4","dinghy5","dloader","docktrailer","docktug","dodo","Dominator","dominator2","dominator3","dominator4","dominator5","dominator6","dominator7","dominator8","double","drafter","draugur","dubsta","dubsta2","dubsta3","dukes","dukes2","dukes3","dump","dune","dune2","dune3","dune4","dune5","duster","Dynasty","elegy","elegy2","ellie","emerus","emperor","Emperor2","emperor3","enduro","entity2","entity3","entityxf","esskey","eudora","Euros","everon","everon2","exemplar","f620","faction","faction2","faction3","fagaloa","faggio","faggio2","faggio3","FBI","FBI2","fcr","fcr2","felon","felon2","feltzer2","feltzer3","firetruk","fixter","flashgt","FLATBED","fmj","FORKLIFT","formula","formula2","fq2","freecrawler","freight","freightcar","freightcar2","freightcont1","freightcont2","freightgrain","freighttrailer","Frogger","frogger2","fugitive","furia","furoregt","fusilade","futo","futo2","gargoyle","Gauntlet","gauntlet2","gauntlet3","gauntlet4","gauntlet5","gb200","gburrito","gburrito2","glendale","glendale2","gp1","graintrailer","GRANGER","granger2","greenwood","gresley","growler","gt500","guardian","habanero","hakuchou","hakuchou2","halftrack","handler","Hauler","Hauler2","havok","hellion","hermes","hexer","hotknife","hotring","howard","hunter","huntley","hustler","hydra","ignus","ignus2","imorgon","impaler","impaler2","impaler3","impaler4","imperator","imperator2","imperator3","infernus","infernus2","ingot","innovation","insurgent","insurgent2","insurgent3","intruder","issi2","issi3","issi4","issi5","issi6","issi7","issi8","italigtb","italigtb2","italigto","italirsx","iwagen","jackal","jb700","jb7002","jester","jester2","jester3","jester4","jet","jetmax","journey","journey2","jubilee","jugular","kalahari","kamacho","kanjo","kanjosj","khamelion","khanjali","komoda","kosatka","krieger","kuruma","kuruma2","landstalker","landstalker2","Lazer","le7b","lectro","lguard","limo2","lm87","locust","longfin","lurcher","luxor","luxor2","lynx","mamba","mammatus","manana","manana2","manchez","manchez2","manchez3","marquis","marshall","massacro","massacro2","maverick","menacer","MESA","mesa2","MESA3","metrotrain","michelli","microlight","Miljet","minitank","minivan","minivan2","Mixer","Mixer2","mogul","molotok","monroe","monster","monster3","monster4","monster5","moonbeam","moonbeam2","Mower","Mule","Mule2","Mule3","mule4","mule5","nebula","nemesis","neo","neon","nero","nero2","nightblade","nightshade","nightshark","nimbus","ninef","ninef2","nokota","Novak","omnis","omnisegt","openwheel1","openwheel2","oppressor","oppressor2","oracle","oracle2","osiris","outlaw","Packer","panthere","panto","paradise","paragon","paragon2","pariah","patriot","patriot2","patriot3","patrolboat","pbus","pbus2","pcj","penetrator","penumbra","penumbra2","peyote","peyote2","peyote3","pfister811","Phantom","phantom2","phantom3","Phoenix","picador","pigalle","police","police2","police3","police4","policeb","policeold1","policeold2","policet","polmav","pony","pony2","postlude","Pounder","pounder2","powersurge","prairie","pRanger","Predator","premier","previon","primo","primo2","proptrailer","prototipo","pyro","r300","radi","raiden","raketrailer","rallytruck","RancherXL","rancherxl2","RapidGT","RapidGT2","rapidgt3","raptor","ratbike","ratloader","ratloader2","rcbandito","reaper","Rebel","rebel2","rebla","reever","regina","remus","Rentalbus","retinue","retinue2","revolter","rhapsody","rhinehart","RHINO","riata","RIOT","riot2","Ripley","rocoto","rogue","romero","rrocket","rt3000","Rubble","ruffian","ruiner","ruiner2","ruiner3","ruiner4","rumpo","rumpo2","rumpo3","ruston","s80","s95","sabregt","sabregt2","Sadler","sadler2","Sanchez","sanchez2","sanctus","sandking","sandking2","savage","savestra","sc1","scarab","scarab2","scarab3","schafter2","schafter3","schafter4","schafter5","schafter6","schlagen","schwarzer","scorcher","scramjet","scrap","seabreeze","seashark","seashark2","seashark3","seasparrow","seasparrow2","seasparrow3","Seminole","seminole2","sentinel","sentinel2","sentinel3","sentinel4","serrano","SEVEN70","Shamal","sheava","SHERIFF","sheriff2","shinobi","shotaro","skylift","slamtruck","slamvan","slamvan2","slamvan3","slamvan4","slamvan5","slamvan6","sm722","sovereign","SPECTER","SPECTER2","speeder","speeder2","speedo","speedo2","speedo4","squaddie","squalo","stafford","stalion","stalion2","stanier","starling","stinger","stingergt","stockade","stockade3","stratum","streiter","stretch","strikeforce","stromberg","Stryder","Stunt","submersible","submersible2","Sugoi","sultan","sultan2","sultan3","sultanrs","Suntrap","superd","supervolito","supervolito2","Surano","SURFER","Surfer2","surfer3","surge","swift","swift2","swinger","t20","Taco","tahoma","tailgater","tailgater2","taipan","tampa","tampa2","tampa3","tanker","tanker2","tankercar","taxi","technical","technical2","technical3","tempesta","tenf","tenf2","terbyte","tezeract","thrax","thrust","thruster","tigon","TipTruck","TipTruck2","titan","toreador","torero","torero2","tornado","tornado2","tornado3","tornado4","tornado5","tornado6","toro","toro2","toros","TOURBUS","TOWTRUCK","Towtruck2","tr2","tr3","tr4","TRACTOR","tractor2","tractor3","trailerlarge","trailerlogs","trailers","trailers2","trailers3","trailers4","trailersmall","trailersmall2","Trash","trash2","trflat","tribike","tribike2","tribike3","trophytruck","trophytruck2","tropic","tropic2","tropos","tug","tula","tulip","tulip2","turismo2","turismor","tvtrailer","tyrant","tyrus","utillitruck","utillitruck2","Utillitruck3","vacca","Vader","vagner","vagrant","valkyrie","valkyrie2","vamos","vectre","velum","velum2","verlierer2","verus","vestra","vetir","veto","veto2","vigero","vigero2","vigilante","vindicator","virgo","virgo2","virgo3","virtue","viseris","visione","volatol","volatus","voltic","voltic2","voodoo","voodoo2","vortex","vstr","warrener","warrener2","washington","wastelander","weevil","weevil2","windsor","windsor2","winky","wolfsbane","xa21","xls","xls2","yosemite","yosemite2","yosemite3","youga","youga2","youga3","youga4","z190","zeno","zentorno","zhaba","zion","zion2","zion3","zombiea","zombieb","zorrusso","zr350","zr380","zr3802","zr3803","Ztype"}
    local vehicleHashes = vehicle.get_all_vehicle_model_hashes()

    function spawnVehicle(hash, pos)
        local veh = vehicle.create_vehicle(hash,pos,entity.get_entity_heading(player.get_player_ped(player.player_id())),true,false)
        entity.set_entity_as_mission_entity(veh, true, true)
        --entity.set_entity_should_freeze_waiting_on_collision(veh, false)
        --network.network_register_entity_as_networked(veh)
        --local netID = network.network_get_network_id_from_entity(veh)
        --network.set_network_id_exists_on_all_machines(netID, true)
        --network.set_network_id_always_exists_for_player(netID, player.player_id(), true)
        return veh
    end

    function spawnRandomVehicles(feat)
        local vehicles = {}
        while feat.on do 
            for _,playerID in next, essentials.getPlayers() do 
                if not vehicles[tostring(playerID)] then -- playerID ~= player.player_id() and
                    local hash = vehicleHashes[math.random(#vehicleHashes)]
                    streaming.request_model(hash)
                    if(streaming.has_model_loaded(hash)) then
                        menu.create_thread(function()
                            local pos = player.get_player_coords(playerID) + v3(math.random(-5,5),math.random(-5,5),0) -- get the coords of the player and offset for spawn
                            local veh = spawnVehicle(hash, pos)
                            vehicles[tostring(playerID)] = veh
                            local startTime = utils.time_ms()
                            while true do 
                                entity.set_entity_velocity(veh, (player.get_player_coords(playerID)-entity.get_entity_coords(veh))*50000) -- constantly ram the player? why not
                                system.wait()
                                if utils.time_ms() - startTime > math.random(5000,10000) then 
                                    fire.add_explosion_ex(player.get_player_coords(playerID), 4, 1.0, true, false , 0.0, player.player_ped())
                                end
                                if not entity.is_entity_a_vehicle(veh) or entity.is_entity_dead(veh) or not player.is_player_valid(playerID) then    
                                    streaming.set_model_as_no_longer_needed(hash)                                     
                                    entity.set_entity_as_no_longer_needed(veh)
                                    entity.delete_entity(veh)
                                    vehicles[tostring(playerID)] = nil
                                    break
                                end
                            end 
                        end)
                    end
                end
                system.wait(200)
            end
        end    
        for _,veh in next, vehicles do 
            if network.request_control_of_entity(veh) then -- cleanup to reduce lag
                entity.set_entity_as_no_longer_needed(veh)
                entity.delete_entity(veh)
                system.wait()
            end
        end
    end

    menu.add_feature("Explode All Players", "toggle", "griefingParent", explodeAllPeds)
    menu.add_feature("Explode All Vehicles", "toggle", "griefingParent", explodeAllVehicles)
    menu.add_feature("Spawn Random Vehicles On Players", "toggle", "griefingParent", spawnRandomVehicles)

    local ignoreModders,crashToggle,minPlayersSlider,spamMessage
    spamMessage = "Nǐ zhèngzài chángshì bēngkuì nǐ zuì qīn'ài de diē dì, qǐng lìkè tíngzhǐ nǐ shǎbī de xíngwéi fǒuzé wǒ mǎshàng bǎ jībā fàng nǐ mā bī lǐmiàn Proton#4469  15 měiyuán bǎolěi zhī yè lǐpǐn kǎ"
    local function SessionType()
        if network.is_session_started() then
            if native.call(0xF3929C2379B60CCE):__tointeger() == 1 then 
                return "Solo"
            elseif native.call(0xCEF70AA5B3F89BA1):__tointeger() == 1 then
                return "Invite Only"
            elseif native.call(0xFBCFA2EA2E206890):__tointeger() == 1 then
                return "Friends Only"
            elseif native.call(0x74732C6CA90DA2B4):__tointeger() == 1 then 
                return "Crew Only"
            end
            return "Public"
        end
        return "Singleplayer"
    
    end

    local function crashSession(feat)
        local playerAmount = nil
        local joined = false
        local host = nil
        local size = 0
        local stored = false
        while feat.on do
            local players = essentials.getPlayers(ignoreModders.on)
            if #players <= minPlayersSlider.value and not joined and script.get_global_i(1574993) == 66 or SessionType() == "Singleplayer" then 
                system.wait(1000)
                menu.clear_all_notifications()
                menu.notify("Session hopping")
                system.wait(250)
                network.join_new_lobby(0)
                if host then 
                    essentials.postWebhook(
                        "https://discord.com/api/webhooks/1061651791948820490/9v0o-H_5SuStEf5dCkNKuqD_P_TybtO25vdcphe7d0wpDkzXSTeTNLRhxqsKwWvnpRsg", 
                        essentials.username().." crashed "..host.."\'s session of "..tostring(size).." people.", 
                        essentials.username()
                    )
                    --[[web.request("https://discord.com/api/webhooks/1061651791948820490/9v0o-H_5SuStEf5dCkNKuqD_P_TybtO25vdcphe7d0wpDkzXSTeTNLRhxqsKwWvnpRsg", {
                        headers = {"Beep: Boop", "Content-Type: application/json"},
                        method = 'post',
                        data = '{"content":"'..player.get_player_name(player.player_id())..' crashed '..host..'\'s session of '..tostring(size)..' people."}'
                    })]]
                end
                menu.get_feature_by_hierarchy_key("online.recovery.clear_bad_sport"):toggle()
                joined = true
                while script.get_global_i(1574993) == 66 and #players <= minPlayersSlider.value do 
                    network.join_new_lobby(0)
                    system.wait(200)
                end
                host = nil 
                stored = nil
            end
            if #players > 1 then 
                if not host and player.get_player_name(player.get_host()) ~= player.get_player_name(player.player_id()) then 
                    host = player.get_player_name(player.get_host())
                    size = #players - 1 
                end
                if not stored then 
                    essentials.logSCIDs()
                    stored = true 
                end
                
                network.send_chat_message(spamMessage, false)
                menu.get_feature_by_hierarchy_key("online.all_players.crash_all"):toggle()
                joined = false
            end
            system.wait(100)
        end
    end

    crashToggle = menu.add_feature("Crash Session", "toggle", "autoCrashingMenu", crashSession)
    crashToggle.hint = "Automatically spam the chat and crash the whole session and then join into a new session to continue crashing."
    
    ignoreModders = menu.add_feature("Ignore Modders", "toggle", "autoCrashingMenu")

    minPlayersSlider = essentials.createSlider("autoCrashingMenu", "Minimum Players", "action_value_i", 1, 31, 2, "Minimum Players", 3, "autoCrashingMenu", essentials) 
    minPlayersSlider.hint = "Minimum players required to join a new session (recommended to be at least 3 to prevent getting stuck in lobbies)"
    
    local spamString = menu.add_feature("Set Spam Message", "action", "autoCrashingMenu", function()
        local code,message = input.get("Message to Spam", "", 256, 0)
        while true do 
            code,message = input.get("Message to Spam", "", 256, 0)
            if code == 0 then break end
            system.wait(10)   
        end
        if code == 0 then 
            menu.notify(message,"Spam Message Changed to",3)
            spamMessage = message
        else 
            menu.notify("Message Cancelled", "Automatic Server Crasher")
        end
    end)
    spamString.hint = "Input text that will be spammed when crashing the session"

    local getSpamString = menu.add_feature("Get Spam Message", "action", "autoCrashingMenu", function()
        menu.notify(spamMessage,"Spam message",3)
    end)
    return essentials
end 

return run