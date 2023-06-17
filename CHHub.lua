local ids = {
    189707, --Natural Disaster Survival
    192800, --Work at a pizza place
    8888615802, --Rainbow friends chapter 1  
    13622981808 --Rainbow friends chapter 2
}

if game.PlaceId == ids[1] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/games/Natural%20Disaster%20Survival.lua"))()
elseif game.PlaceId == ids[2] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/games/Work%20at%20a%20pizza%20place.lua"))()
elseif game.PlaceId == ids[3] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/games/rainbow%20friends%20chapter%201.lua"))()
elseif game.PlaceId == ids[4] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/games/rainbow%20friends%20chapter%202.lua"))()
end
