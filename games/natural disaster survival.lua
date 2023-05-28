local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/lib/solarismodified.lua"))()

local win = SolarisLib:New({
  Name = "CarpetHack Hub",
  FolderToSave = "CH Hub"
})

local tab = win:Tab("Exploits")
local tab2 = win:Tab("Customization")
local tab3 = win:Tab("Credits")

local sec = tab:Section("Main")
local sec_2 = tab:Section("Teleports")
local sec_3 = tab:Section("Character Related")

local sec2_1 = tab2:Section("UI")
local sec2_2 = tab2:Section("Map")

local sec3_1 = tab3:Section("SolarisLib")

--Needed values
local runService = game:GetService("RunService")

--Window 1
sec:Button("Disable FallDamage", function()
	pcall(function()
		game.Players.LocalPlayer.Character.FallDamageScript:Destroy()
	end)
	game.Players.LocalPlayer.CharacterAdded:Connect(function()
		pcall(function()
			game.Players.LocalPlayer.Character:WaitForChild("FallDamageScript"):Destroy()
		end)
	end)
end)

local toggle = sec:Toggle("Walk on Water", false,"Jesus", function(bool)
	if bool == false then 
		game.Workspace.WaterLevel.CanCollide = false
		game.Workspace.WaterLevel.Size = Vector3.new(10, 1, 10)
	end
	if bool == true then 
		game.Workspace.WaterLevel.CanCollide = true
		game.Workspace.WaterLevel.Size = Vector3.new(1000, 1, 1000)
	end
end)

local toggle = sec:Toggle("Solid Island", false,"SolidIsland", function(bool)
	for i, v in pairs (game.workspace:GetDescendants())do
		if v.Name == 'LowerRocks' then -- change part to the name you want to look for
			v.CanCollide = bool
		end
	end
end)

local toggle = sec:Toggle("Choose Map", false,"ChooseMap", function(bool)
	game.Players.LocalPlayer.PlayerGui.MainGui.MapVotePage.Visible = bool
end)

local toggle = sec:Toggle("AutoFarm", false,"Farm", function(bool)
	if bool then
		pcall(function()
			if game.Players.LocalPlayer.Character.FallDamageScript then
				game.Players.LocalPlayer.Character.FallDamageScript:Destroy()
			end
		end)
		event = runService.RenderStepped:Connect(function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-264, 195, 288)
		end)
	end
	if not bool then
		pcall(function()
			event:Disconnect()
		end)
	end
end)

sec:Button("Launch The Launch Land Rocket", function()
	pcall(function()
		fireclickdetector(game:GetService("Workspace").Structure["Launch Land"]["SPACESHIP!!"].Shuttle.IgnitionButton.ClickDetector)
		fireclickdetector(game:GetService("Workspace").Structure["Launch Land"].RocketStand.ConsoleLower.ReleaseButtonLower.ClickDetector)
		fireclickdetector(game:GetService("Workspace").Structure["Launch Land"].RocketStand.ConsoleUpper.ReleaseButtonUpper.ClickDetector)
		fireclickdetector(game:GetService("Workspace").Structure["Launch Land"].LoadingTower.Console.ReleaseEntryBridge.ClickDetector)
	end)
end)

sec:Button("Current Disaster", function()
	SolarisLib:Notification("Current Disaster.", game.Players.LocalPlayer.Character.SurvivalTag.Value)
end)

sec:Button("Say Current Disaster", function()
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Current Disaster: "..game.Players.LocalPlayer.Character.SurvivalTag.Value, "All")
end)

sec_2:Button("Island", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108, 49, 0)
end)

sec_2:Button("Tower", function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-264, 196, 288)
end)

local slider = sec_3:Slider("Walkspeed", 0,200,16,1,"speed", function(t)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = t
end)

local slider = sec_3:Slider("Jumppower", 0,300,50,1,"jump", function(t)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = t
end)

local slider = sec_3:Slider("Gravity", 0,196,196,1,"speed", function(t)
	game.Workspace.Gravity = t
end)

--Window 2
sec2_1:Button("Remove Sandstorm GUI", function()
	game.Players.LocalPlayer.PlayerGui.SandStormGui:destroy()
end)

sec2_1:Button("Remove Blizzard GUI", function()
	game.Players.LocalPlayer.PlayerGui.BlizzardGui:destroy()
end)

sec2_2:Button("Remove Ads", function()
	game:GetService("Workspace").BillboardAd:Destroy()
	game:GetService("Workspace")["Main Portal Template "]:Destroy()
	game:GetService("Workspace").ReturnPortal:Destroy()
end)

sec2_2:Colorpicker("Water Color", Color3.fromRGB(13, 105, 172),"WaterColor", function(t)
	game.Workspace.WaterLevel.Color = t
	game.Workspace.Structure.FloodLevel.Color = t
end)

sec2_2:Button("Reset Water Color", function()
	game.Workspace.WaterLevel.BrickColor = BrickColor.new("Bright blue")
	game.Workspace.Structure.FloodLevel.BrickColor = BrickColor.new("Bright blue")
end)

--Window 3
local label = sec3_1:Label("trill")
local label = sec3_1:Label("dawid")
local label = sec3_1:Label("All of the other devs.")
