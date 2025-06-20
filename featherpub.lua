--= Feather.Hub Premium =--
local LPH_NO_VIRTUALIZE = function(f) return f end
local key = "FeatherHubFREE_3748549302238493"

-- Защита от декомпиляции
local function Scramble()
    for i = 1, math.random(5, 10) do
        pcall(debug.setconstant, math.random, math.random(1,3), "NULL_"..tostring({}))
    end
end

Scramble()

-- Проверка ключа
local function VerifyKey(input)
    local realHash = "a1b3c7d9e2f4g6h8" -- Зашифрованный хеш правильного ключа
    local userHash = ""
    
    -- Простой хешинг
    for i = 1, #input do
        userHash = userHash .. string.char(input:byte(i) % 16 + 97)
    end
    
    return userHash == realHash
end

-- Rayfield интерфейс
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
    Name = "Feather.Hub Premium",
    LoadingTitle = "Trident Survival V5",
    LoadingSubtitle = "by SwimHub",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = false
    }
})

-- Окно авторизации
local AuthTab = Window:CreateTab("Активация", nil)
local KeyInput = AuthTab:CreateInput({
    Name = "Введите ключ",
    PlaceholderText = "FeatherHubFREE_XXXXX",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
    end,
})

local AuthButton = AuthTab:CreateButton({
    Name = "Активировать",
    Callback = function()
        if VerifyKey(KeyInput.Value) then
            Rayfield:Notify({
                Title = "Успешно!",
                Content = "Премиум функции разблокированы",
                Duration = 6.5,
                Image = nil,
                Actions = {}
            })
            LoadPremiumFeatures()
        else
            Rayfield:Notify({
                Title = "Ошибка",
                Content = "Неверный ключ активации",
                Duration = 6.5,
                Image = nil,
                Actions = {}
            })
        end
    end,
})

-- Премиум функции
function LoadPremiumFeatures()
    -- Вкладка боевых функций
    local CombatTab = Window:CreateTab("Комбат", nil)
    
    CombatTab:CreateToggle({
        Name = "Aimbot",
        CurrentValue = false,
        Callback = function(Value)
            -- Aimbot логика
        end,
    })

    CombatTab:CreateSlider({
        Name = "FOV",
        Range = {0, 360},
        Increment = 5,
        Suffix = "deg",
        CurrentValue = 90,
        Callback = function(Value)
            -- FOV изменение
        end,
    })

    -- Вкладка визуала
    local VisualTab = Window:CreateTab("Визуал", nil)
    
    VisualTab:CreateToggle({
        Name = "ESP",
        CurrentValue = false,
        Callback = function(Value)
            -- ESP логика
        end,
    })

    VisualTab:CreateColorPicker({
        Name = "Цвет ESP",
        Color = Color3.fromRGB(255, 0, 0),
        Callback = function(Value)
            -- Изменение цвета
        end
    })

    -- Вкладка утилит
    local UtilityTab = Window:CreateTab("Утилиты", nil)
    
    UtilityTab:CreateToggle({
        Name = "Авто-ферм",
        CurrentValue = false,
        Callback = function(Value)
            -- Авто-ферм логика
        end,
    })

    UtilityTab:CreateButton({
        Name = "Телепорт к базе",
        Callback = function()
            -- Телепорт логика
        end,
    })
end

-- Защита от анализа
local function AntiTamper()
    coroutine.wrap(function()
        while wait(math.random(5, 15)) do
            pcall(function()
                if not VerifyKey(key) then
                    game:Shutdown()
                end
            end)
        end
    end)()
end

AntiTamper()
