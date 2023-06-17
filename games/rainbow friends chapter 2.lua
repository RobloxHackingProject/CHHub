local BlekLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/lib/library.lua"))()

--Locals
local runService = game:GetService("RunService")
local lighting = game:GetService("Lighting")

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
exploittab:Button('Collect all items', function()
    for _,v in ipairs(game:GetService("Workspace"):GetChildren()) do
        if v:FindFirstChild("TouchTrigger") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.TouchTrigger.CFrame
            wait(0.1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(52, 140, -8)
            wait(0.2)
        end
    end
end)

exploittab:Toggle('Toggle Shadows', function(bool)
    lighting.GlobalShadows = not bool
end)

exploittab:Toggle('Friends ESP', function(bool)
    if bool then
        local runService = game:GetService("RunService")
        event = runService.RenderStepped:Connect(function()
            for _,v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
                if not v:FindFirstChild("Lol") then
                    local esp = Instance.new("Highlight", v)
                    esp.Name = "Lol"
                    esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    esp.FillColor = Color3.new(0, 0, 255)
                end
            end
        end)
    end
    if not bool then
        event:Disconnect()
        for _,v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
            v:FindFirstChild("Lol"):Destroy()
        end
    end
end)

exploittab:Toggle('Item ESP', function(bool)
    if bool then
        local runService = game:GetService("RunService")
        event = runService.RenderStepped:Connect(function()
            for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v:FindFirstChild("TouchTrigger") then
                    if not v:FindFirstChild("Lol") then
                        local esp = Instance.new("Highlight", v)
                        esp.Name = "Lol"
                        esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        esp.FillColor = Color3.new(0, 255, 0)
                    end
                end
            end
        end)
    end
    if not bool then
        event:Disconnect()
        for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v:FindFirstChild("TouchTrigger") then
                v:FindFirstChild("Lol"):Destroy()
            end
        end
    end
end)

exploittab:Slider('Walkspeed', 16, 16, 100, function(a)
	if a ~= -69420 then
	event = runService.RenderStepped:Connect(function()
		wait(.1)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = a
	end)
	else
		event:Disconnect()
	end
end)

--TeleportTab
teleporttab:Button('Drop off location', function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(42, 136, -7)
end)

teleporttab:Button('Spawn', function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-70, 136, -111)
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
