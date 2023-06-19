local BlekLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/lib/library.lua"))()

--Locals
local runService = game:GetService("RunService")

--Keybind
BlekLib:SetUIBind(Enum.KeyCode.F)

local win = BlekLib:Create({
    Name = "CH Hub",
    StartupSound = {
        Toggle = false,
        SoundID = "rbxassetid://6958727243",
        TimePosition = 1
    }
})

--Tabs
local exploittab = win:Tab('Exploits')
local teleporttab = win:Tab('Waypoints')
local settings = win:Tab('Settings')
local credits = win:Tab('Credits')


--ExploitTab
exploittab:Slider('Walkspeed', 16, 16, 100, function(a)
    if event then
        event:Disconnect()
    end

    event = runService.RenderStepped:Connect(function()
        wait(0.1)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = a
    end)
end)

exploittab:Slider('Jump Height', 50, 50, 200, function(a)
    if event then
        event:Disconnect()
    end

    event = runService.RenderStepped:Connect(function()
        wait(0.1)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = a
    end)
end)

exploittab:Slider('Gravity', 196, 0, 196, function(a)
    if event then
        event:Disconnect()
    end

    event = runService.RenderStepped:Connect(function()
        wait(0.1)
        game.Workspace.Gravity = a
    end)
end)

exploittab:Textbox('FOV (Standard = 70)', function(v)
    game.Workspace.Camera.FieldOfView = v
end)

--TeleportTab
local pos1 = nil
local pos2 = nil
local pos3 = nil
local pos4 = nil
teleporttab:Button('Save Waypoint #1', function()
    pos1 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)
teleporttab:Button('Load Waypoint #1', function()
    if pos1 then
    	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos1
    end
end)

teleporttab:Button('Save Waypoint #2', function()
    pos2 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)
teleporttab:Button('Load Waypoint #2', function()
    if pos2 then
    	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos2
    end
end)

teleporttab:Button('Save Waypoint #3', function()
    pos3 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)
teleporttab:Button('Load Waypoint #3', function()
    if pos3 then
    	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos3
    end
end)

teleporttab:Button('Save Waypoint #4', function()
    pos4 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)
teleporttab:Button('Load Waypoint #4', function()
    if pos4 then
    	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos4
    end
end)


--Settings
settings:Button('Destroy GUI', function()
    win:Exit()
end)


--Credits
credits:Label('GUI Library made by:')
credits:Label('laderite / https://github.com/laderite')
credits:Label(' ')
credits:Label('Toggle GUI code by:')
credits:Label('TRHP / that one guy | joe123')
credits:Label(' ')
credits:Label('Special thank you to:')
credits:Label('My alternative personalities')
credits:Label(tostring(game.Players.LocalPlayer.Name) .. " / You :)")