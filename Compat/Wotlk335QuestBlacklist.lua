---@type QuestieCorrections
local QuestieCorrections = QuestieLoader:ImportModule("QuestieCorrections")

local MAX_ORIGINAL_WOTLK_QUEST_ID = 26034

-- Quests que existieron durante WotLK, pero ya no estaban disponibles
-- en el estado final de 3.3.5a.
local removedBefore335 = {
    -- Timear dungeon dailies
    [13240] = true,
    [13241] = true,
    [13243] = true,
    [13244] = true,

    -- Proof of Demise heroic dailies
    [13245] = true,
    [13246] = true,
    [13247] = true,
    [13248] = true,
    [13249] = true,
    [13250] = true,
    [13251] = true,
    [13252] = true,
    [13253] = true,
    [13254] = true,
    [13255] = true,
    [13256] = true,
    [14199] = true,
}

-- Excepciones para servidores privados que utilicen deliberadamente
-- IDs posteriores a 3.3.5a.
local allowedPost335Quests = {
    -- [99999] = true,
}

local function ApplyWotlk335Blacklist()
    local hiddenQuests = QuestieCorrections.hiddenQuests

    if type(hiddenQuests) ~= "table" then
        return
    end

    -- Aplica también las blacklists registradas por nuestro Compat.
    QuestieCompat.LoadBlacklists()

    -- Estas quests deben permanecer ocultas aunque alguna corrección
    -- anterior de Compat las haya marcado como false.
    for questId in pairs(removedBefore335) do
        hiddenQuests[questId] = true
    end

    -- Si upstream ya contiene entradas explícitas posteriores a 3.3.5,
    -- las forzamos a hidden=true.
    for questId in pairs(hiddenQuests) do
        if type(questId) == "number"
            and questId > MAX_ORIGINAL_WOTLK_QUEST_ID
            and not allowedPost335Quests[questId] then

            hiddenQuests[questId] = true
        end
    end

    -- Para cualquier quest futura que upstream añada y que todavía
    -- no tenga una entrada explícita en hiddenQuests.
    local mt = getmetatable(hiddenQuests) or {}

    if not mt.__questie335PostWotlkBlacklist then
        local oldIndex = mt.__index

        mt.__index = function(tbl, questId)
            if type(questId) == "number"
                and questId > MAX_ORIGINAL_WOTLK_QUEST_ID
                and not allowedPost335Quests[questId] then

                return true
            end

            if type(oldIndex) == "function" then
                return oldIndex(tbl, questId)
            elseif type(oldIndex) == "table" then
                return oldIndex[questId]
            end

            return nil
        end

        mt.__questie335PostWotlkBlacklist = true
        setmetatable(hiddenQuests, mt)
    end
end

-- QuestieCorrections.lua ya ha ejecutado MinimalInit() una vez antes
-- de que este archivo sea cargado, así que aplicamos el filtro ahora.
ApplyWotlk335Blacklist()

-- MinimalInit reconstruye hiddenQuests, por lo que debemos volver a
-- aplicar nuestras reglas cada vez que Questie lo ejecute.
local OriginalMinimalInit = QuestieCorrections.MinimalInit

function QuestieCorrections:MinimalInit(...)
    OriginalMinimalInit(self, ...)

    ApplyWotlk335Blacklist()
end