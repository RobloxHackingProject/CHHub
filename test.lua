--Tower of Hell, teleporting gets detected :(
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
local esptab = win:Tab('Esp')
local teleporttab = win:Tab('Teleports')
local settings = win:Tab('Settings')
local credits = win:Tab('Credits')


--ExploitTab
exploittab:Toggle('Autofarm', function(bool)
	if bool then
		oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		event = runService.RenderStepped:Connect(function()
			for _,v in pairs(game.Workspace.tower.sections:GetDescendants()) do
				if v.Name == "start" or v.Name == "stop" then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
					wait(1)
				end
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldPos
			brick = game.Workspace.tower.sections.finish.FinishGlow.CFrame.Position
			wait(10)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(brick.X, brick.Y - 5, brick.Z)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldPos
		end)
	else
		event:Disconnect()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldPos
	end
end)

exploittab:Slider('WalkSpeed', 16, 16, 50, function(a)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = a
end)

exploittab:Slider('JumpPower', 50, 50, 500, function(a)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = a
end)

--EspTab
esptab:Toggle('Player ESP', function(bool)
    if bool then
        local runService = game:GetService("RunService")
        event = runService.RenderStepped:Connect(function()
            for _,v in pairs(game:GetService("Players"):GetChildren()) do
		chr = v.Character
                if not chr:FindFirstChild("Lol") then
                    local esp = Instance.new("Highlight", chr)
                    esp.Name = "Lol"
                    esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    esp.FillColor = Color3.new(0, 0, 255)
                end
            end
        end)
    end
    if not bool then
        event:Disconnect()
        for _,v in pairs(game:GetService("Players"):GetChildren()) do
            v.Character:FindFirstChild("Lol"):Destroy()
        end
    end
end)

--TeleportTab
teleporttab:Button('Top of Tower', function()
	for _,v in pairs(game.Workspace.tower.sections.finish.steps:GetChildren()) do
		if v.Size.X == 1 and v.Size.Y == 25 and v.Size.Z == 46.22054672241211 then
			brick = v.CFrame.Position
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(brick.X, brick.Y + 1, brick.Z)
		end
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
