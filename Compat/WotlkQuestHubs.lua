---@type DailyQuests
local DailyQuests = QuestieLoader:ImportModule("DailyQuests")

--[[
Questie-335: WotLK daily quest hubs

This file intentionally lives in Compat and is loaded after upstream's
Modules/Quest/DailyQuests/QuestHubs.lua. It extends the upstream hub table
instead of modifying/replacing Questie's DailyQuests or QuestHubs files.

The hub list was seeded from the WotLK work in Aldori's 3.3.5 fork and checked
against Questie-335 11.3.0's WotLK quest database. Every quest ID below is
marked with QUEST_FLAGS_DAILY (0x1000 / 4096) in that database.

For rotating pools (Dalaran cooking/fishing, dungeon dailies and Call to Arms)
limit = 1. Questie can therefore hide sibling quests after one quest from that
pool is accepted or completed. The server still remains the authority for
which quest is actually offered before the player accepts one.
]]

---@alias WotlkHubId string

---@class WotlkHub
---@field quests QuestId[]
---@field limit number
---@field exclusiveHubs? table<WotlkHubId, boolean>
---@field preQuestHubs? table<WotlkHubId, boolean>
---@field preQuestHubsSingle? table<WotlkHubId, boolean>
---@field preQuestHubsGroup? table<WotlkHubId, boolean>
---@field IsActive? function(completedQuests: table<QuestId, boolean>, questLog: table<QuestId, Quest>): boolean

---@type table<WotlkHubId, WotlkHub>
local wotlkHubs = {
    -- Argent Tournament -------------------------------------------------------
    argent_tournament = {
        IsActive = function(completedQuests)
            return completedQuests[13667] or completedQuests[13668]
        end,
        quests = {
            13592, 13600, 13603, 13616, 13625, 13627,
            13665, 13666, 13669, 13670, 13671, 13673, 13674, 13675,
            13676, 13677, 13681, 13682,
            13741, 13742, 13743, 13744, 13745, 13746, 13747, 13748,
            13749, 13750, 13752, 13753, 13754, 13755, 13756, 13757,
            13758, 13759, 13760, 13761, 13762, 13763, 13764, 13765,
            13767, 13768, 13769, 13770, 13771, 13772, 13773, 13774,
            13775, 13776, 13777, 13778, 13779, 13780, 13781, 13782,
            13783, 13784, 13785, 13786, 13787, 13788, 13789, 13790,
            13791, 13793,
            13809, 13810, 13811, 13812, 13813, 13814,
            13846, 13847, 13851, 13852, 13854, 13855, 13856, 13857,
            13858, 13859, 13860, 13861, 13862, 13863, 13864,
            14074, 14076, 14077, 14080, 14090, 14092, 14095, 14096,
            14101, 14102, 14104, 14105, 14107, 14108, 14112, 14136,
            14140, 14141, 14142, 14143, 14144, 14145, 14152,
        },
        limit = 112,
    },

    -- Icecrown ---------------------------------------------------------------
    icecrown = {
        quests = {
            12813, 12815, 12838, 12995,
            13069, 13071,
            13233, 13234, 13261, 13276, 13280, 13281, 13283, 13284,
            13289, 13292, 13297, 13300, 13301, 13302, 13309, 13310,
            13322, 13323, 13330, 13331, 13333, 13336, 13344, 13350,
            13353, 13357, 13365, 13368, 13376, 13382, 13404, 13406,
        },
        limit = 38,
    },

    -- Storm Peaks ------------------------------------------------------------
    storm_peaks_k3 = {
        quests = {12833, 12869},
        limit = 2,
    },

    storm_peaks_sohodir = {
        IsActive = function(completedQuests)
            return completedQuests[12976] -- A Monument to the Fallen
        end,
        quests = {12977, 12981, 12994, 13003, 13006, 13046},
        limit = 6,
    },

    storm_peaks_brunnhildar = {
        IsActive = function(completedQuests)
            return completedQuests[12886] -- The Drakkensryd
        end,
        quests = {13422, 13423, 13424, 13425},
        limit = 4,
    },

    -- Sholazar Basin ---------------------------------------------------------
    sholazar_oracles = {
        IsActive = function(completedQuests)
            return completedQuests[12581] -- A Hero's Burden
        end,
        quests = {12689, 12704, 12705, 12726, 12735, 12736, 12737, 12761, 12762},
        limit = 9,
        exclusiveHubs = {sholazar_frenzyheart = true},
    },

    sholazar_frenzyheart = {
        IsActive = function(completedQuests)
            return completedQuests[12581] -- A Hero's Burden
        end,
        quests = {12582, 12702, 12703, 12732, 12734, 12741, 12758, 12759, 12760},
        limit = 9,
        exclusiveHubs = {sholazar_oracles = true},
    },

    -- Zul'Drak ---------------------------------------------------------------
    zul_drak = {
        IsActive = function(completedQuests)
            return completedQuests[12596] -- Pa'Troll
        end,
        quests = {
            12501, 12502, 12509, 12519, 12541, 12563, 12564, 12568,
            12585, 12587, 12588, 12591, 12594, 12601, 12602, 12604,
        },
        limit = 16,
    },

    -- Grizzly Hills ----------------------------------------------------------
    grizzly_hills = {
        quests = {
            12038, 12170, 12244, 12268, 12270, 12280, 12284, 12288,
            12289, 12296, 12314, 12315, 12316, 12317, 12323, 12324,
            12432, 12437, 12444,
        },
        limit = 19,
    },

    -- Dragonblight / Wyrmrest ------------------------------------------------
    dragonblight_wyrmrest_defend = {
        quests = {11960},
        limit = 1,
    },

    dragonblight_wyrmrest_imperative = {
        IsActive = function(completedQuests)
            return completedQuests[12435] -- Report to Lord Afrasastrasz
        end,
        quests = {12372},
        limit = 1,
    },

    -- Coldarra ---------------------------------------------------------------
    coldarra_drake_hunt = {
        IsActive = function(completedQuests)
            return completedQuests[11919]
        end,
        quests = {11940},
        limit = 1,
    },

    coldarra_aces_high = {
        IsActive = function(completedQuests)
            return completedQuests[13413]
        end,
        quests = {13414},
        limit = 1,
    },

    -- Kalu'ak ----------------------------------------------------------------
    kalu_ak = {
        quests = {11945},
        limit = 1,
    },

    -- Dalaran profession dailies --------------------------------------------
    -- Alliance and Horde cooking versions are in the same rotating pool.
    dalaran_cooking = {
        quests = {13100, 13101, 13102, 13103, 13107, 13112, 13113, 13114, 13115, 13116},
        limit = 1,
    },

    dalaran_fishing = {
        quests = {13692, 13830, 13832, 13833, 13834, 13836},
        limit = 1,
    },

    -- Dalaran dungeon dailies ------------------------------------------------
    -- Archmage Timear: one NORMAL dungeon daily per day.
    dalaran_normal_dungeon = {
        quests = {13240, 13241, 13243, 13244},
        limit = 1,
    },

    -- Archmage Lan'dalock: one HEROIC Proof of Demise daily per day.
    dalaran_heroic_dungeon = {
        quests = {
            13245, 13246, 13247, 13248, 13249, 13250, 13251,
            13252, 13253, 13254, 13255, 13256, 14199,
        },
        limit = 1,
    },

    -- Independent heroic daily in Ahn'kahet; it is not part of Lan'dalock's
    -- rotating Proof of Demise pool.
    ahnkahet_all_things_in_good_time = {
        quests = {13190},
        limit = 1,
    },

    -- Battleground Call to Arms ---------------------------------------------
    call_to_arms = {
        quests = {
            13427, 13428, -- Alterac Valley
            14178, 14181, -- Arathi Basin
            14179, 14182, -- Eye of the Storm
            14180, 14183, -- Warsong Gulch
            13405, 13407, -- Strand of the Ancients
            14163, 14164, -- Isle of Conquest
        },
        limit = 1,
    },
}

local wotlkHubQuestLookup = {}

local function NormalizeHub(hub)
    hub.quests = hub.quests or {}
    hub.exclusiveHubs = hub.exclusiveHubs or {}

    -- Questie 11.3 uses preQuestHubs. Newer Questie/Aldori versions split
    -- this into single/group variants. Supporting all three here keeps this
    -- Compat file easy to carry forward.
    hub.preQuestHubs = hub.preQuestHubs or {}
    hub.preQuestHubsSingle = hub.preQuestHubsSingle or hub.preQuestHubs or {}
    hub.preQuestHubsGroup = hub.preQuestHubsGroup or {}
end

local function RebuildWotlkLookup()
    wotlkHubQuestLookup = {}

    for hubId, hub in pairs(wotlkHubs) do
        NormalizeHub(hub)
        DailyQuests.hubs[hubId] = hub

        for _, questId in pairs(hub.quests) do
            if not wotlkHubQuestLookup[questId] then
                wotlkHubQuestLookup[questId] = {}
            end
            table.insert(wotlkHubQuestLookup[questId], hub)
        end
    end
end

RebuildWotlkLookup()

local OriginalInitialize = DailyQuests.Initialize
local OriginalShouldBeHidden = DailyQuests.ShouldBeHidden

function DailyQuests.Initialize(...)
    -- Re-add the Compat hubs in case upstream recreated the hub table before
    -- initialization, then let Questie's own initialization run normally.
    RebuildWotlkLookup()
    return OriginalInitialize(...)
end

local function IsHubComplete(hub, completedQuests, questLog, includeQuestLog)
    local completedCount = 0

    for _, questId in pairs(hub.quests or {}) do
        if completedQuests[questId] or (includeQuestLog and questLog[questId]) then
            completedCount = completedCount + 1
        end
    end

    return completedCount >= (hub.limit or 0)
end

local function ShouldHideWotlkHub(hub, completedQuests, questLog)
    if hub.IsActive and (not hub.IsActive(completedQuests, questLog)) then
        return true
    end

    -- Once a quest from a mutually exclusive hub is accepted/completed, hide
    -- this hub for the current reset.
    for exclusiveHubId in pairs(hub.exclusiveHubs or {}) do
        local exclusiveHub = DailyQuests.hubs[exclusiveHubId]
        if exclusiveHub and IsHubComplete(exclusiveHub, completedQuests, questLog, true) then
            return true
        end

        -- For exclusive hubs whose limit is larger than one, any quest from
        -- the sibling hub is sufficient to establish the player's choice.
        if exclusiveHub then
            for _, questId in pairs(exclusiveHub.quests or {}) do
                if completedQuests[questId] or questLog[questId] then
                    return true
                end
            end
        end
    end

    -- Upstream semantics: accepted quests count toward the hub limit as well
    -- as quests completed during the current daily reset.
    if IsHubComplete(hub, completedQuests, questLog, true) then
        return true
    end

    -- Questie 11.3: a single completed prerequisite hub unlocks this hub.
    local preQuestHubs = hub.preQuestHubs or {}
    if next(preQuestHubs) then
        local onePrerequisiteComplete = false
        for preHubId in pairs(preQuestHubs) do
            local preHub = DailyQuests.hubs[preHubId]
            if preHub and IsHubComplete(preHub, completedQuests, questLog, false) then
                onePrerequisiteComplete = true
                break
            end
        end
        if not onePrerequisiteComplete then
            return true
        end
    end

    -- Newer schema: one of the listed prerequisite hubs must be complete.
    local preQuestHubsSingle = hub.preQuestHubsSingle or {}
    if next(preQuestHubsSingle) then
        local onePrerequisiteComplete = false
        for preHubId in pairs(preQuestHubsSingle) do
            local preHub = DailyQuests.hubs[preHubId]
            if preHub and IsHubComplete(preHub, completedQuests, questLog, false) then
                onePrerequisiteComplete = true
                break
            end
        end
        if not onePrerequisiteComplete then
            return true
        end
    end

    -- Newer schema: every listed prerequisite hub must be complete.
    for preHubId in pairs(hub.preQuestHubsGroup or {}) do
        local preHub = DailyQuests.hubs[preHubId]
        if preHub and (not IsHubComplete(preHub, completedQuests, questLog, false)) then
            return true
        end
    end

    return false
end

---@param questId QuestId
---@param completedQuests table<QuestId, boolean>
---@param questLog table<QuestId, Quest>
---@return boolean
function DailyQuests.ShouldBeHidden(questId, completedQuests, questLog)
    local hubs = wotlkHubQuestLookup[questId]

    if not hubs then
        return OriginalShouldBeHidden(questId, completedQuests, questLog)
    end

    completedQuests = completedQuests or {}
    questLog = questLog or {}

    -- A quest can belong to more than one hub. It only needs one applicable
    -- hub to remain visible.
    for _, hub in pairs(hubs) do
        if not ShouldHideWotlkHub(hub, completedQuests, questLog) then
            return false
        end
    end

    return true
end

-- Optional WotLK API helper. Kept isolated here so upstream DailyQuests.lua can
-- remain untouched and future versions can use it if desired.
function DailyQuests:IsAtDailyQuestLimit()
    local maxDailyQuests = GetMaxDailyQuests and GetMaxDailyQuests() or 0
    if maxDailyQuests <= 0 then
        return false
    end

    if GetDailyQuestsCompleted then
        local completed = GetDailyQuestsCompleted()
        if completed and completed >= maxDailyQuests then
            return true
        end
    end

    local completed = 0
    for _ in pairs((Questie.db.char and Questie.db.char.daily) or {}) do
        completed = completed + 1
    end

    return completed >= maxDailyQuests
end

-- Small diagnostic command for testing the Compat integration in-game.
--   /q335hubs          -> number of WotLK hubs/quests loaded
--   /q335hubs 12977    -> hub membership + current hide/show decision
SLASH_QUESTIE335HUBS1 = "/q335hubs"
SlashCmdList.QUESTIE335HUBS = function(message)
    local questId = tonumber(message)

    if not questId then
        local hubCount, questCount = 0, 0
        for _, hub in pairs(wotlkHubs) do
            hubCount = hubCount + 1
            questCount = questCount + #(hub.quests or {})
        end
        Questie:Print("[Questie-335] WotLK daily hubs loaded:", hubCount, "hubs /", questCount, "quest entries")
        return
    end

    local hubs = wotlkHubQuestLookup[questId]
    if not hubs then
        Questie:Print("[Questie-335] Quest", questId, "is not in a WotLK daily hub")
        return
    end

    local completedQuests = (Questie.db.char and Questie.db.char.complete) or {}
    local QuestiePlayer = QuestieLoader:ImportModule("QuestiePlayer")
    local questLog = QuestiePlayer.currentQuestlog or {}
    local hidden = DailyQuests.ShouldBeHidden(questId, completedQuests, questLog)

    local names = {}
    for hubId, hub in pairs(wotlkHubs) do
        for _, id in pairs(hub.quests or {}) do
            if id == questId then
                table.insert(names, hubId)
                break
            end
        end
    end

    Questie:Print("[Questie-335] Quest", questId, "hub(s):", table.concat(names, ", "), "=>", hidden and "HIDDEN" or "VISIBLE")
end
