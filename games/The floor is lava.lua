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
local teleporttab = win:Tab('Teleports')
local settings = win:Tab('Settings')
local credits = win:Tab('Credits')


--ExploitTab
exploittab:Toggle('Autofarm', function(bool)
	if bool then
		event = runService.RenderStepped:Connect(function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(13, 60.8, -248)
		end)
	end
	if not bool then
		event:Disconnect()
	end
end)

exploittab:Toggle('Parkour Autofarm', function(bool)
	if bool then
		event = runService.RenderStepped:Connect(function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(26.5, 61, -445)
		end)
	end
	if not bool then
		event:Disconnect()
	end
end)

exploittab:Slider('WalkSpeed', 16, 16, 100, function(a)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = a
end)

exploittab:Slider('Jump Height', 50, 50, 200, function(a)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = a
end)

exploittab:Slider('Gravity', 196, 0, 196, function(a)
	game.Workspace.Gravity = a
end)

--TeleportTab
teleporttab:Button('Spawn', function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(13, 60.8, -248)
end)

teleporttab:Button('Map', function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2, 60, -67)
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