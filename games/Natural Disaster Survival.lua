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
exploittab:Toggle('Walk On Water', function(bool)
	local water = game.Workspace.WaterLevel
	if not bool then 
		water.CanCollide = false
		water.Size = Vector3.new(10, 1, 10)
	end
	if bool then 
		water.CanCollide = true
		water.Size = Vector3.new(1000, 1, 1000)
	end
end)

exploittab:Toggle('Solid Island', function(bool)
	for _, v in pairs (game.workspace:GetDescendants())do
		if v.Name == 'LowerRocks' then
			v.CanCollide = bool
		end
	end
end)

exploittab:Toggle('Choose Map', function(bool)
	game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible = bool
end)

exploittab:Toggle('Autofarm', function(bool)
	if bool then
		event = runService.RenderStepped:Connect(function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-264, 195, 288)
		end)
	else
		event:Disconnect()
	end
end)

exploittab:Button('Launch Rocket', function()
	pcall(function()
		fireclickdetector(game:GetService("Workspace").Structure["Launch Land"]["SPACESHIP!!"].Shuttle.IgnitionButton.ClickDetector)
		fireclickdetector(game:GetService("Workspace").Structure["Launch Land"].RocketStand.ConsoleLower.ReleaseButtonLower.ClickDetector)
		fireclickdetector(game:GetService("Workspace").Structure["Launch Land"].RocketStand.ConsoleUpper.ReleaseButtonUpper.ClickDetector)
		fireclickdetector(game:GetService("Workspace").Structure["Launch Land"].LoadingTower.Console.ReleaseEntryBridge.ClickDetector)
	end)
end)

exploittab:Button('Say Current Disaster', function()
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(game.Players.LocalPlayer.Character.SurvivalTag.Value, "All")
end)

exploittab:Slider('WalkSpeed', 16, 16, 50, function(a)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = a
end)

exploittab:Slider('Gravity', 196, 0, 196, function(a)
	game.Workspace.Gravity = a
end)

exploittab:Button('Remove Sandstorm UI', function()
	game.Players.LocalPlayer.PlayerGui.SandStormGui:destroy()
end)

exploittab:Button('Remove Blizzard UI', function()
	game.Players.LocalPlayer.PlayerGui.BlizzardGui:destroy()
end)

exploittab:Button('Remove Ads', function()
	game:GetService("Workspace").BillboardAd:Destroy()
	game:GetService("Workspace")["Main Portal Template "]:Destroy()
	game:GetService("Workspace").ReturnPortal:Destroy()
end)


--TeleportTab
teleporttab:Button('Island', function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108, 49, 0)
end)

teleporttab:Button('Tower', function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-264, 196, 288)
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