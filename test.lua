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
exploittab:Slider('WalkSpeed', 16, 16, 50, function(a)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = a
end)

exploittab:Slider('JumpPower', 50, 50, 500, function(a)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = a
end)

exploittab:Slider('Gravity', 196, 0, 196, function(a)
	game.Workspace.Gravity = a
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
teleporttab:Button('Map', function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4705, 156, -4331)
end)

teleporttab:Button('Lobby', function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4648, 963, 4225)
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
