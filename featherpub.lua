-- feather.pub | Trident Survival 2023 | ALL-IN-ONE LOADSTRING
-- [Key: FeatherHubFREE_3748549302238493]

-- Встроенная библиотека Kavo UI (чтобы не грузить отдельно)
local KavoLib = {}
function KavoLib.CreateLib(name, theme)
    -- Упрощённый код GUI (основные элементы) 
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "FeatherPubUI"
    ScreenGui.Parent = game.CoreGui
    -- ... (остальное создание интерфейса)
    return {
        NewTab = function() return { NewSection = function() return { 
            NewToggle = function() end,
            NewSlider = function() end,
            NewButton = function() end 
        } end } end
    }
end

-- Проверка ключа
local Key = "FeatherHubFREE_3748549302238493"
if Key ~= "FeatherHubFREE_3748549302238493" then
    game.Players.LocalPlayer:Kick("❌ Invalid Key!")
    return
end

-- Основной код (AimBot, ESP и т.д.)
local function Main()
    local Window = KavoLib.CreateLib("feather.pub", "BloodTheme")
    
    -- Combat
    local CombatTab = Window:NewTab("Combat")
    CombatTab:NewSection("AimBot"):NewToggle("Enable", "Ловит головы", function(state)
        getgenv().AimBot = state
        while AimBot do
            task.wait()
            -- Логика AimBot (упрощённая)
            local target = FindClosestPlayer()
            if target then
                AimAt(target.Head)
            end
        end
    end)

    -- Visual
    local VisualTab = Window:NewTab("Visual")
    VisualTab:NewSection("ESP"):NewToggle("Box ESP", "Рамки игроков", function(state)
        getgenv().BoxESP = state
        UpdateESP()
    end)
end

-- Запуск
Main()
print("feather.pub loaded! Key: " .. Key)
