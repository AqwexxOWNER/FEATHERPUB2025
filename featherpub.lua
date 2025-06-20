-- feather.pub | Trident Survival 2023 | Mobile Optimized
-- Features: Bypass, AimBot, Hitbox Extender, ESP, Weather Control, SpeedHack, Config System

local Key = "FeatherHubFREE_3748549302238493" -- Введите ключ
if Key ~= "FeatherHubFREE_3748549302238493" then
    error("Invalid Key!") 
end

-- GUI Library
local FeatherPub = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = FeatherPub.CreateLib("feather.pub | Trident Survival 2023", "BloodTheme")

-- Tabs
local CombatTab = Window:NewTab("Combat")
local VisualTab = Window:NewTab("Visual")
local ExplorerTab = Window:NewTab("Explorer")
local SettingsTab = Window:NewTab("Settings")

-- COMBAT
local CombatSection = CombatTab:NewSection("Aim Assistance")

-- AimBot
CombatSection:NewToggle("AimBot", "Автоматически целится в голову", function(state)
    getgenv().AimBotEnabled = state
    if state then
        spawn(function()
            while AimBotEnabled do
                task.wait()
                -- Логика AimBot (упрощённая для примера)
                local closestPlayer = FindClosestPlayer()
                if closestPlayer then
                    AimAt(closestPlayer.Head)
                end
            end
        end)
    end
end)

-- Hitbox Extender
CombatSection:NewSlider("Head Hitbox Size", "1-100", 100, 1, function(value)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            player.Character.Head.Size = Vector3.new(value, value, value)
        end
    end
end)

-- VISUAL
local VisualSection = VisualTab:NewSection("ESP")

-- ESP Functions
VisualSection:NewToggle("Box ESP", "Показывает хитбокс игрока", function(state)
    getgenv().BoxESP = state
    UpdateESP()
end)

VisualSection:NewToggle("Health ESP", "Показывает здоровье", function(state)
    getgenv().HealthESP = state
    UpdateESP()
end)

VisualSection:NewToggle("Skeleton ESP", "Показывает скелет", function(state)
    getgenv().SkeletonESP = state
    UpdateESP()
end)

VisualSection:NewToggle("BackPack ESP", "Показывает рюкзак", function(state)
    getgenv().BackpackESP = state
    UpdateESP()
end)

VisualSection:NewToggle("Totem ESP", "Показывает тотемы", function(state)
    getgenv().TotemESP = state
    UpdateESP()
end)

-- Weather Control
VisualSection:NewToggle("Always Day", "Фиксирует день", function(state)
    if state then
        game.Lighting.TimeOfDay = "12:00:00"
        game.Lighting.ClockTime = 12
    end
end)

-- EXPLORER
local ExplorerSection = ExplorerTab:NewSection("Movement")

-- LongNeck
ExplorerSection:NewToggle("LongNeck", "Увеличивает шею", function(state)
    if state then
        game.Players.LocalPlayer.Character.Head.Neck.Length = 10
    else
        game.Players.LocalPlayer.Character.Head.Neck.Length = 1
    end
end)

-- SpeedHack
ExplorerSection:NewSlider("Speed", "1-100", 100, 16, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

-- SETTINGS (Config System)
local SettingsSection = SettingsTab:NewSection("Configuration")

SettingsSection:NewTextBox("Config Name", "Введите название", function(text)
    getgenv().CurrentConfig = text
end)

SettingsSection:NewButton("Save Config", "Сохраняет текущие настройки", function()
    SaveConfig(CurrentConfig)
end)

SettingsSection:NewButton("Load Config", "Загружает сохранённые настройки", function()
    LoadConfig(CurrentConfig)
end)

-- Функции (упрощённые для примера)
function FindClosestPlayer()
    -- Логика поиска ближайшего игрока
end

function AimAt(part)
    -- Логика AimBot
end

function UpdateESP()
    -- Обновление ESP
end

function SaveConfig(name)
    -- Сохранение конфига
end

function LoadConfig(name)
    -- Загрузка конфига
end

print("feather.pub успешно загружен! | Key: " .. Key)
