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
exploittab:Button('Drop Trucks Contents', function()
    for _,v in workspace.Trucks:GetChildren() do
        v:WaitForChild("LeverBounds"):WaitForChild("ClickDetector"):WaitForChild("Detector"):FireServer()
    end
end)

exploittab:Button('Remove Job Buttons', function()
    game.Workspace.JobButtons:destroy()
end)

exploittab:Button('Remove Manager Door', function()
    game.Workspace.PizzaPlaceDoors.ManagerDoor:destroy()
end)

exploittab:Toggle('Spam Team Change', function(bool)
    if bool then
        local runService = game:GetService("RunService")
        event = runService.RenderStepped:Connect(function()
            game:GetService("ReplicatedStorage").PlayerChannel:FireServer("ChangeJob", "Cashier")
            wait(0.2)
            game:GetService("ReplicatedStorage").PlayerChannel:FireServer("ChangeJob", "Cook")
            wait(0.2)
            game:GetService("ReplicatedStorage").PlayerChannel:FireServer("ChangeJob", "Pizza Boxer")
            wait(0.2)
            game:GetService("ReplicatedStorage").PlayerChannel:FireServer("ChangeJob", "Delivery")
            wait(0.2)
            game:GetService("ReplicatedStorage").PlayerChannel:FireServer("ChangeJob", "Supplier")
        end)
    end
    if not bool then
        event:Disconnect()
    end
end)

exploittab:Toggle('Mute Alarm', function(bool)
    if bool then
        local runService = game:GetService("RunService")
        event = runService.RenderStepped:Connect(function()
            wait(0.5)
            game:GetService("Workspace").Alarm.Alarm.Alarm:Destroy()
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
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(47, 4, 185)
end)

teleporttab:Button('Cashier', function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(41, 3, 81)
end)

teleporttab:Button('Cook', function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(36, 5, 62)
end)

teleporttab:Button('Pizza Boxer', function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(47, 4, 185)
end)

teleporttab:Button('Delivery', function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(55, 5, 18)
end)

teleporttab:Button('Supplier', function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8, 14, -1033)
end)

teleporttab:Button('Manager', function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(24, 5, 6)
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
