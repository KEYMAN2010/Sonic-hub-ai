repeat
    wait()
until game:IsLoaded()

local function ai(msg)
local api = "https://et.goatbypassers.xyz/api/assistant?msg=".. msg
local response = game:GetService("HttpService"):GetAsync(api)
local jsonData = game:GetService("HttpService"):JSONDecode(response)
local responseMsg = jsonData.message
game.Players.LocalPlayer.CharacterAdded:Wait()
local chat = game.Players.LocalPlayer.Character:WaitForChild("Chat")
chat:Chat(responseMsg)
end

local function sexwithx(state)
if state == true do
game:GetService("Chat"):MessagePosted:Connect(function(message)
if message:sub(1,3) == "!ai" then
local msg = message:sub(5)
aiChat(msg)
end
end)
else state == false do
return
end


local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

local circleButton = Instance.new("ImageButton")
circleButton.Name = "CircleButton"
circleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30) 
circleButton.Size = UDim2.new(0, 70, 0, 70) 
circleButton.Position = UDim2.new(0.1, 0, 0.1, 0)
circleButton.Parent = screenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0) 
UICorner.Parent = circleButton
local textLabel = Instance.new("TextLabel")
textLabel.Text = "Sonic Hub"
textLabel.Font = Enum.Font.LuckiestGuy 
textLabel.TextSize = 14 
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) 
textLabel.Size = UDim2.new(1, 0, 1, 0) 
textLabel.BackgroundTransparency = 1 
textLabel.Parent = circleButton

circleButton.MouseButton1Click:Connect(function()
game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
end)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager =
    loadstring(
    game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua")
)()

local Window =
        Fluent:CreateWindow(
        {
            Title = "Sonic Hub",
            SubTitle = "AI tool" ,
            TabWidth = 100,
            Size = UDim2.fromOffset(480, 360),
            Acrylic = true,
            Theme = "Dark",
            MinimizeKey = Enum.KeyCode.LeftControl
        }
    )
    
    local Tabs = {
        Main = Window:AddTab({Title = "Main", Icon = ""}),
    }
    
    local Sexwithxtoggle = Tabs.Main:AddToggle("AI (use !ai [your message]", {Title = "AI (use !ai [your message]", Default = false })

    Sexwithxtoggle:OnChanged(function(state)
        if state then
        sexwithx(true)
        else
        sexwithx(false)
        end
        end)
SaveManager:SetLibrary(Fluent)
    InterfaceManager:SetLibrary(Fluent)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    InterfaceManager:SetFolder("SonicHub")
    SaveManager:SetFolder("SonicHub/ai")
    InterfaceManager:BuildInterfaceSection(Tabs.Main)
    SaveManager:BuildConfigSection(Tabs.Main)
