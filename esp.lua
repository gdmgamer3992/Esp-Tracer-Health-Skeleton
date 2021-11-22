local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint

local HeadOff = Vector3.new(0, 0.5, 0)
local LegOff = Vector3.new(0,3,0)

for i,v in pairs(game.Players:GetChildren()) do
    local BoxOutline = Drawing.new("Square")
    BoxOutline.Visible = false
    BoxOutline.Color = Color3.new(0,0,0)
    BoxOutline.Thickness = 3
    BoxOutline.Transparency = 1
    BoxOutline.Filled = false

    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Color3.new(1,1,1)
    Box.Thickness = 1
    Box.Transparency = 1
    Box.Filled = false
    local HealthBarOutline = Drawing.new("Square")
    HealthBarOutline.Thickness = 3
    HealthBarOutline.Filled = false
    HealthBarOutline.Color = Color3.new(0,0,0)
    HealthBarOutline.Transparency = 1
    HealthBarOutline.Visible = false

    local HealthBar = Drawing.new("Square")
    HealthBar.Thickness = 1
    HealthBar.Filled = false
    HealthBar.Transparency = 1
    HealthBar.Visible = false

    function boxesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                local RootPart = v.Character.HumanoidRootPart
                local Head = v.Character.Head
                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
                local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)

                if onScreen then
                    BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                    BoxOutline.Visible = true

                    Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                    Box.Visible = true
                    HealthBarOutline.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                    HealthBarOutline.Position = BoxOutline.Position - Vector2.new(6,0)
                    HealthBarOutline.Visible = true

                    HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / math.clamp(game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value, 0, game:GetService("Players")[v.Character.Name].NRPBS:WaitForChild("MaxHealth").Value)))
                    HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1 / HealthBar.Size.Y))
                    HealthBar.Color = Color3.fromRGB(255 - 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 0)
                    HealthBar.Visible = true


                    if v.TeamColor == lplr.TeamColor then
                        BoxOutline.Visible = false
                        Box.Visible = false
                         HealthBarOutline.Visible = false
                        HealthBar.Visible = false
                    else
                        BoxOutline.Visible = true
                        Box.Visible = true
                        HealthBarOutline.Visible = true
                        HealthBar.Visible = true
                    end

                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                    HealthBarOutline.Visible = false
                    HealthBar.Visible = false
                end
            else
                BoxOutline.Visible = false
                Box.Visible = false
                 HealthBarOutline.Visible = false
                HealthBar.Visible = false
            end
        end)
    end
    coroutine.wrap(boxesp)()
end

game.Players.PlayerAdded:Connect(function(v)
    local BoxOutline = Drawing.new("Square")
    BoxOutline.Visible = false
    BoxOutline.Color = Color3.new(0,0,0)
    BoxOutline.Thickness = 3
    BoxOutline.Transparency = 1
    BoxOutline.Filled = false

    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Color3.new(1,1,1)
    Box.Thickness = 1
    Box.Transparency = 1
    Box.Filled = false
      
    local HealthBarOutline = Drawing.new("Square")
    HealthBarOutline.Thickness = 3
    HealthBarOutline.Filled = false
    HealthBarOutline.Color = Color3.new(0,0,0)
    HealthBarOutline.Transparency = 1
    HealthBarOutline.Visible = false
        local HealthBar = Drawing.new("Square")
    HealthBar.Thickness = 1
    HealthBar.Filled = false
    HealthBar.Transparency = 1
    HealthBar.Visible = false


    function boxesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                local RootPart = v.Character.HumanoidRootPart
                local Head = v.Character.Head
                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
                local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + HeadOff)
                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - LegOff)

                if onScreen then
                    BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                    BoxOutline.Visible = true

                    Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                    Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                    Box.Visible = true

                    HealthBarOutline.Size = Vector2.new(2, HeadPosition.Y - LegPosition.Y)
                    HealthBarOutline.Position = BoxOutline.Position - Vector2.new(6,0)
                    HealthBarOutline.Visible = true

                    HealthBar.Size = Vector2.new(2, (HeadPosition.Y - LegPosition.Y) / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / math.clamp(game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value, 0, game:GetService("Players")[v.Character.Name].NRPBS:WaitForChild("MaxHealth").Value)))
                    HealthBar.Position = Vector2.new(Box.Position.X - 6, Box.Position.Y + (1/HealthBar.Size.Y))
		    HealthBar.Color = Color3.fromRGB(255 - 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 255 / (game:GetService("Players")[v.Character.Name].NRPBS["MaxHealth"].Value / game:GetService("Players")[v.Character.Name].NRPBS["Health"].Value), 0)                    
		    HealthBar.Visible = true

                    iif v.TeamColor == lplr.TeamColor then
                        --- Our Team
                        BoxOutline.Visible = false
                        Box.Visible = false
                        HealthBarOutline.Visible = false
                        HealthBar.Visible = false
                    else
                        ---Enemy Team
                        BoxOutline.Visible = true
                        Box.Visible = true
                        HealthBarOutline.Visible = true
                        HealthBar.Visible = true
                    end

                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                    HealthBarOutline.Visible = false
                    HealthBar.Visible = false
                end
            else
                BoxOutline.Visible = false
                Box.Visible = false
                HealthBarOutline.Visible = false
                HealthBar.Visible = false
            end
        end)
    end
    coroutine.wrap(boxesp)()
end)
local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint

_G.TeamCheck = false -- Use True or False to toggle TeamCheck

for i,v in pairs(game.Players:GetChildren()) do
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    function lineesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                if OnScreen then
                    Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)

                    if _G.TeamCheck and v.TeamColor == lplr.TeamColor then
                        --//Teammates
                        Tracer.Visible = false
                    else
                        --//Enemies
                        Tracer.Visible = true
                    end
                else
                    Tracer.Visible = false
                end
            else
                Tracer.Visible = false
            end
        end)
    end
    coroutine.wrap(lineesp)()
end

game.Players.PlayerAdded:Connect(function(v)
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    function lineesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, OnScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)

                if OnScreen then
                    Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)

                    if _G.TeamCheck and v.TeamColor == lplr.TeamColor then
                        --//Teammates
                        Tracer.Visible = false
                    else
                        --//Enemies
                        Tracer.Visible = true
                    end
                else
                    Tracer.Visible = false
                end
            else
                Tracer.Visible = false
            end
        end)
    end
    coroutine.wrap(lineesp)()
end)

local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint
local esp_settings = {
    enabled = true,
    skel = true,
    skel_col = Color3.fromRGB(255,255,255)
}

local function draw(player, character)

    local skel_head = Drawing.new("Line")
    skel_head.Visible = false
    skel_head.Thickness = 1.5
    skel_head.Color = Color3.new(1,1,1)

    local skel_torso = Drawing.new("Line")
    skel_torso.Visible = false
    skel_torso.Thickness = 1.5
    skel_torso.Color = Color3.new(1,1,1)

    local skel_leftarm = Drawing.new("Line")
    skel_leftarm.Visible = false
    skel_leftarm.Thickness = 1.5
    skel_leftarm.Color = Color3.new(1,1,1)

    local skel_rightarm = Drawing.new("Line")
    skel_rightarm.Visible = false
    skel_rightarm.Thickness = 1.5
    skel_rightarm.Color = Color3.new(1,1,1)

    local skel_leftleg = Drawing.new("Line")
    skel_leftleg.Visible = false
    skel_leftleg.Thickness = 1.5
    skel_leftleg.Color = Color3.new(1,1,1)

    local skel_rightleg = Drawing.new("Line")
    skel_rightleg.Visible = false
    skel_rightleg.Thickness = 1.5
    skel_rightleg.Color = Color3.new(1,1,1)

    local function update()
        local connection
        connection = runservice.RenderStepped:Connect(function()

            if workspace:FindFirstChild(character.Name) and
            character and 
            character:FindFirstChild("HumanoidRootPart") and 
            character:FindFirstChild("Humanoid") and 
            character:FindFirstChild("Humanoid").Health ~= 0 then 

                local character_rootpart_3d = character.HumanoidRootPart.Position
                local character_rootpart_2d, rootpart_onscreen = camera:WorldToViewportPoint(character_rootpart_3d)

                if rootpart_onscreen and character.Humanoid.RigType == Enum.HumanoidRigType.R6 and esp_settings.enabled then

                    local head_2d = camera:WorldToViewportPoint(character.Head.Position)
                    local torso_upper_2d = camera:WorldToViewportPoint(character.Torso.Position + Vector3.new(0,1,0))
                    local torso_lower_2d = camera:WorldToViewportPoint(character.Torso.Position + Vector3.new(0,-1,0))
                    
                    local leftarm_2d = camera:WorldToViewportPoint(character["Left Arm"].Position + Vector3.new(0,-1,0))
                    local rightarm_2d = camera:WorldToViewportPoint(character["Right Arm"].Position + Vector3.new(0,-1,0))
                    local leftleg_2d = camera:WorldToViewportPoint(character["Left Leg"].Position + Vector3.new(0,-1,0))
                    local rightleg_2d = camera:WorldToViewportPoint(character["Right Leg"].Position + Vector3.new(0,-1,0))

                    skel_head.From = Vector2.new(head_2d.X, head_2d.Y)
                    skel_head.To = Vector2.new(torso_upper_2d.X, torso_upper_2d.Y)

                    skel_torso.From = Vector2.new(torso_upper_2d.X, torso_upper_2d.Y)
                    skel_torso.To = Vector2.new(torso_lower_2d.X, torso_lower_2d.Y)
                    
                    skel_leftarm.From = Vector2.new(torso_upper_2d.X, torso_upper_2d.Y)
                    skel_leftarm.To = Vector2.new(leftarm_2d.X, leftarm_2d.Y)

                    skel_rightarm.From = Vector2.new(torso_upper_2d.X, torso_upper_2d.Y)
                    skel_rightarm.To = Vector2.new(rightarm_2d.X, rightarm_2d.Y)

                    skel_leftleg.From = Vector2.new(torso_lower_2d.X, torso_lower_2d.Y)
                    skel_leftleg.To = Vector2.new(leftleg_2d.X, leftleg_2d.Y)

                    skel_rightleg.From = Vector2.new(torso_lower_2d.X, torso_lower_2d.Y)
                    skel_rightleg.To = Vector2.new(rightleg_2d.X, rightleg_2d.Y)

                    skel_head.Visible = esp_settings.skel
                    skel_torso.Visible = esp_settings.skel
                    skel_leftarm.Visible = esp_settings.skel
                    skel_rightarm.Visible = esp_settings.skel
                    skel_leftleg.Visible = esp_settings.skel
                    skel_rightleg.Visible = esp_settings.skel

                else

                    skel_head.Visible = false
                    skel_torso.Visible = false
                    skel_leftarm.Visible = false
                    skel_rightarm.Visible = false
                    skel_leftleg.Visible = false
                    skel_rightleg.Visible = false

                end

            else

                if player == nil then
                    connection:Disconnect()
                    connection = nil 
                end

                skel_head.Visible = false
                skel_torso.Visible = false
                skel_leftarm.Visible = false
                skel_rightarm.Visible = false
                skel_leftleg.Visible = false
                skel_rightleg.Visible = false

            end
        end)
    end
    coroutine.wrap(update)()

end

local function playeradded(player)
    if player.Character then
        coroutine.wrap(draw)(player, player.Character)
    end
    player.CharacterAdded:Connect(function(character)
        coroutine.wrap(draw)(player, character)
    end)
end

for a,b in next, entities:GetPlayers() do
    if b ~= localplayer then
        playeradded(b)
    end
end

entities.PlayerAdded:Connect(playeradded)
