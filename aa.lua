-- ============================================================
-- TOWNSHIP HEADLESS / CONFIG-ONLY BUILD
-- Based on TownShip_Optimized_Fixed_8sLobbyWait.lua
-- No Linoria menu is downloaded or rendered.
-- Keep the 8-second lobby settle from the working build.
-- ============================================================

-- ============================================================
-- OPTIMIZED BUILD
-- Conservative performance/stability pass.
-- Core features, UI controls, remotes and config behavior preserved.
-- ============================================================

-- ============================================================
-- TOWNSHIP HEADLESS CONFIG
-- No Linoria menu is created.
--
-- HOW TO USE:
--   * Edit MainMenu, Lobby, or Mission below.
--   * The script automatically loads the correct section for the current place.
--   * Advanced exact-ID overrides are available at the bottom if needed.
--
-- Multi-select settings use a simple list:
--   {"Memory Scroll", "Emperor's Key"}
-- The headless layer converts it to the format the original script expects.
-- ============================================================

local CONFIG = {
    -- ========================================================
    -- GENERAL
    -- true = enabled / false = disabled
    -- Numbers are usually seconds, amounts, speed, height, etc.
    -- ========================================================
    System = {
        PrintNotifications = true,   -- true = print old UI notifications in the console.
        PrintConfigLoads = false,    -- true = print every config value as the script loads it.
    },

    -- ========================================================
    -- MAIN MENU
    -- Used only while you are on the game's main menu.
    -- ========================================================
    MainMenu = {
        AutoSelect = true,           -- Automatically selects the configured slot when the slot screen appears.
        AutoDialog = false,           -- Automatically clicks/continues supported dialog prompts.
        AutoJoin = true,             -- Automatically joins the destination selected in JoinDestination.

        AutoRedeem = false,          -- Automatically redeems stored codes.
        AutoNotNow = true,          -- Automatically clicks "Not Now" when that supported popup appears.
        StopAtSpinLimit = false,     -- Stops family spinning when the amount in StopAtSpins is reached.
        AutoNotify = false,          -- Enables the family/spin notification system.
        AutoTeleport = false,        -- Automatically teleports after AutoTeleportTime.
        AutoSpin = false,            -- Automatically spins for the families listed in SpinFamilies.
        PopupRealTime = false,       -- Enables the real-time family/status popup logic. No visible Linoria menu is created.

        HideUI = true,               -- Compatibility setting from the old UI version; headless mode has no menu to show.
        MobileUI = true,             -- Enables old mobile-UI compatibility behavior where supported.

        Slot = "B",                  -- Character slot to automatically select. Example: "A".
        SelectDelay = 1,             -- Seconds to wait between automatic slot-selection actions.

        JoinDestination = "Lobby",   -- Destination used by AutoJoin. Example: "Lobby".
        JoinDelay = 0,               -- Seconds to wait before AutoJoin performs its action.

        TeleportTime = 0,            -- Delay in seconds for AutoTeleport. 0 = no extra delay.

        StopAtSpins = "0",           -- Spin limit used by StopAtSpinLimit. Kept as text for compatibility.
        SpinFamilies = {},           -- Families AutoSpin should target. Example: {"Yeager", "Ackerman"}.
        SpinDelay = 0.01,            -- Delay in seconds between family-spin attempts.

        WebhookURL = "",             -- Main-menu/family webhook URL. Leave "" to disable sending to a URL.
        WebhookPing = "None",        -- Ping mode for the main-menu webhook. Current value: "None".

        NewCode = "",                -- A code to add/store when using the code-storage action.
        StoredCodes = {},            -- Codes selected/stored for automatic redemption.

        PopupScale = 100,            -- Scale percentage for the old popup/status display. 100 = normal size.
    },

    -- ========================================================
    -- LOBBY / TRADE LOBBY
    -- Used in Town Central and the trade lobby.
    -- ========================================================
    Lobby = {
        HideUI = true,               -- Compatibility setting; there is no Linoria menu in this headless build.
        MobileUI = false,            -- Old mobile-UI compatibility behavior for the lobby.

        AutoStartMission = true,     -- Automatically starts the configured mission.
        AutoWaves = false,           -- Automatically handles/starts wave-related actions where supported.
        AutoTeleport = false,        -- Lobby automatic teleport feature.

        Mission = {
            Name = "Shiganshina",         -- Mission/map to start automatically.
            Objective = "Skirmish",  -- Mission objective/mode.
            Difficulty = "Hardest",  -- Mission difficulty.

            Modifiers = {            -- Mission modifiers to select automatically.
                "Nightmare",         -- Enables the Nightmare modifier.
                "No Skills",         -- Enables the No Skills modifier.
                "Injury Prone",      -- Enables the Injury Prone modifier.
                "Oddball",           -- Enables the Oddball modifier.
                "No Perks",          -- Enables the No Perks modifier.
                "Fog",               -- Enables the Fog modifier.
                "Glass Cannon",      -- Enables the Glass Cannon modifier.
                "Chronic Injuries",  -- Enables the Chronic Injuries modifier.
                "No Memories",       -- Enables the No Memories modifier.
                "Time Trial",        -- Enables the Time Trial modifier.
            },

            Delay = 5,               -- Seconds the mission starter waits between/start around mission actions.
            WavesDelay = 0,          -- Extra delay in seconds for wave actions.
        },

        Boosts = {
            Enabled = true,          -- Master toggle for the automatic boost system.
            Gold = true,             -- Enables automatic Gold boost handling.
            Luck = false,            -- Enables automatic Luck boost handling.
            XP = false,              -- Enables automatic XP boost handling.
            Delay = 1,               -- Seconds between automatic boost checks.

            Purchase = false,        -- Enables the separate boost-purchase feature.
            AutoUse = false,         -- Automatically uses boosts selected in Selected.
            Selected = {},           -- Boosts for the separate purchase/use system. Example: {"2x Gold Boost [2h]"}.
            Amount = 1,              -- Quantity used by the separate boost-purchase system.
            UseDelay = 0,            -- Delay in seconds between separate boost-use actions.
        },

        Cosmetics = {
            AutoSell = true,         -- Automatically sells all obtainable mission-drop cosmetics listed in Auto Sell Cosmetics.
            Repeat = 3,              -- Number of sell attempts made for each cosmetic per cycle.
            Delay = 0.25,            -- Seconds between cosmetic sell requests.
        },

        Perks = {
            AutoDelete = true,       -- Automatically deletes perks matching the enabled rarities below.

            Common = true,           -- Delete Common perks.
            Rare = true,             -- Delete Rare perks.
            Epic = true,             -- Delete Epic perks.
            Legendary = true,        -- Delete Legendary perks.
            Secret = false,          -- Delete Secret perks. false keeps them.

            Delay = 0.05,            -- Seconds between perk-delete batches.
            Interval = 5,            -- Seconds between automatic perk-delete scans.
        },

        Upgrades = {
            Blade = true,            -- Automatically upgrades Blade equipment.
            Spear = false,           -- Automatically upgrades Thunder Spear equipment.

            BladeDelay = 0,          -- Extra delay between Blade upgrade actions.
            SpearDelay = 0,          -- Extra delay between Spear upgrade actions.
        },

        Skills = {
            Unlock = true,           -- Automatically unlocks skills according to the configured side choices.
            AutoEquip = true,        -- Automatically equips the five skill IDs below.

            SupportSide = "Right",   -- Support skill-tree side. Example: "Left", "Right", or "None".
            OffenseSide = "Left",    -- Offense skill-tree side.
            DefenseSide = "None",    -- Defense skill-tree side. "None" disables that side.

            UnlockDelay = 0.08,      -- Seconds between automatic skill-unlock actions.
            EquipDelay = 1,          -- Seconds between automatic skill-equip actions.

            Slots = {
                "76",                -- Skill ID for slot 1.
                "95",                -- Skill ID for slot 2.
                "26",                -- Skill ID for slot 3.
                "7",                 -- Skill ID for slot 4.
                "3",                 -- Skill ID for slot 5.
            },
        },

        ShadowChecker = {
            Enabled = true,          -- Enables the account/shadow-checker logic.
            WebhookURL = "https://discord.com/api/webhooks/1398658944578355323/IMZAxHul-JnmivPapO2Xd1R_Ddxwwq49O91dSQo-3fLerY6AqM7D0h6cOSQdeaiUR2cP",         -- Webhook used by the shadow checker. Leave "" if you do not want one.
        },

        Prestige = {
            Enabled = true,          -- Enables automatic prestige.
            ForceGold = true,        -- Forces/uses the custom Gold requirement values below.

            GoldRequirements = {
                [0] = 200,           -- Gold requirement used for Prestige 0 -> 1.
                [1] = 400,           -- Gold requirement used for Prestige 1 -> 2.
                [2] = 600,           -- Gold requirement used for Prestige 2 -> 3.
                [3] = 800,           -- Gold requirement used for Prestige 3 -> 4.
                [4] = 1000,          -- Gold requirement used for Prestige 4 -> 5.
            },

            Boost = "Gold Boost",    -- Boost name/value passed to the prestige system.
            SendAs = "Name",         -- Format used when sending the prestige boost/talent value.
            Cooldown = 8,            -- Seconds between prestige attempts.
        },

        Claims = {
            Quests = true,           -- Automatically claims available quest rewards.
            Achievements = true,     -- Automatically claims available achievement rewards.
            Delay = 0,               -- Extra delay between claim actions.
        },

        Trade = {
            Receiver = {             -- Account 1 / Receiver usernames.
                "Xz_CrazejBMoonOBEcho", -- This username is treated as a receiver account.
            },

            Sender = {               -- Account 2 / Sender usernames.
                "GoldeeenlionBlox",  -- This username is treated as a sender account.
            },

            ReceiverSend = true,     -- Enables repeated trade invites/actions for Receiver-list accounts.
            ReceiverAccept = true,   -- Enables automatic trade acceptance for Receiver-list accounts.

            SenderSend = true,       -- Enables repeated trade invites/actions for Sender-list accounts.
            SenderAccept = true,     -- Enables automatic trade acceptance for Sender-list accounts.

            CurrentPlayersSend = false,   -- Enables Send Trade for the Current Players selection.
            CurrentPlayersAccept = false, -- Enables Auto Accept for the Current Players selection.

            ApplyHistory = true,     -- Applies the trading history option below.
            History = "Off",         -- Trading history setting sent to the game. "On" or "Off".

            AutoTrade = false,       -- Enables the manual Auto Trade item-giving worker.
            AcceptTrade = true,      -- Automatically readies/accepts the active trade.

            Items = {                -- Items the sender should place into the trade.
                "Memory Scroll",     -- Trade Memory Scrolls.
            },

            AmountPerItem = 100,     -- Target amount of each selected item to place in the trade.

            AutoDisable = false,     -- Automatically stops trade logic when the configured threshold is reached.
            AutoDisableThreshold = 0,-- Memory Scroll threshold used by AutoDisable.

            ReceiverInput = "",      -- Text used when manually adding a Receiver username to the saved list.
            SenderInput = "",        -- Text used when manually adding a Sender username to the saved list.
        },
    },

    -- ========================================================
    -- IN MISSION
    -- Used after entering an actual mission.
    -- ========================================================
    Mission = {
        HideUI = true,               -- Compatibility setting; headless mode has no Linoria menu.
        MobileUI = false,             -- Disables old mobile-UI compatibility behavior in missions.

        AutoFarm = true,             -- Master Blade auto-farm toggle.
        AutoReload = true,           -- Automatically refills/reloads Blade equipment.
        AutoRetry = true,            -- Automatically presses Retry after mission rewards appear.
        AutoReturn = true,           -- Returns to Town Central after TargetMissions missions.

        AutoThunderSpear = false,    -- Enables the Thunder Spear auto-farm system.
        AutoSpearQuest = false,      -- Enables the automatic Thunder Spear quest helper.

        SpearHitDistanceEnabled = true, -- Enables the custom Thunder Spear hit-distance setting below.

        SkipCutScene = false,        -- Enables the supported automatic cutscene skip feature.
        SkipForce = false,           -- Enables the force-skip helper where supported.

        PlayerStats = false,         -- Enables the player-stats display/worker from the original script.

        Farm = {
            Mode = "Tween",          -- Blade movement mode: "Tween", "Teleport", or "No Movement".
            HoverSpeed = 1000,       -- Tween/movement speed used while moving above Titans.
            HoverHeight = 400,       -- Height in studs to stay above the current Titan.

            SafetyTime = 0,          -- Seconds to wait in safety/wave state before normal farming starts.
            StopAtTitansLeft = 0,    -- Stop/pause threshold based on Titans remaining. 0 disables the threshold.
            KillHits = 9,            -- Number of Titan targets/hits used by the fast Titan worker.
        },

        ThunderSpear = {
            Mode = "Tween",          -- Thunder Spear movement mode.
            HoverSpeed = 120,        -- Thunder Spear movement/tween speed.
            HoverHeight = 120,       -- Height in studs used by Thunder Spear farming.
            HitDistance = 80,        -- Maximum configured Thunder Spear hit distance.
        },

        Performance = {
            UIScale = 100,           -- Old UI scale percentage. Kept for compatibility even though this build is headless.
            FPSLimit = 30,           -- FPS cap from the config you sent.

            RenderModes = {          -- Performance/render optimizations to enable.
                "Delete Map",        -- Removes supported map objects to reduce rendering load.
                "Low Graphic",       -- Applies the original low-graphics optimization.
                "Disable 3D Render", -- Disables 3D rendering where supported for maximum performance.
            },
        },

        Return = {
            TargetMissions = 20,     -- Number of completed missions before AutoReturn goes back to the lobby.
        },

        FailSafe = {
            Enabled = true,          -- Enables the combined fail-safe action system.
            Delay = 46,              -- Seconds before the configured fail-safe action is performed.

            Actions = {              -- Actions performed by the fail-safe when enabled.
                "Teleport to Lobby", -- Teleports back to Town Central/lobby.
            },
        },

        Webhook = {
            Enabled = true,          -- Sends mission/result data through the configured webhook system.
            URL = "https://discord.com/api/webhooks/1558494472797687979/O5Vt1C_RX40wxAeHhAYWtumJvqjZRENmyMsg7rOVUFPAtpsIvZtbgkQ1ToL40fAUbxMz", -- Mission webhook URL.
            Mode = "All Data",       -- Amount/type of information included in the webhook message.
            PingMode = "None",       -- Ping behavior for webhook messages.

            Filters = {              -- Data categories included in the webhook.
                "Progression",       -- Include progression data.
                "Currency",          -- Include currency data.
                "Cosmetics",         -- Include cosmetic data.
                "Loadout",           -- Include loadout data.
                "Inventory",         -- Include inventory data.
            },
        },

        Description = {
            Enabled = false,         -- Automatic description/status generation stays disabled.
            Type = "Horst",          -- Description format/type used by the original feature.

            Stats = {                -- Stats selected in your config.
                "Prestige",
                "Shards",
                "Slot",
                "Spins",
                "Level",
                "Gems",
                "Gold",
            },

            Items = {},              -- No description items selected.
            Cosmetics = {},          -- No description cosmetics selected.
        },
    },

    -- ========================================================
    -- ADVANCED OVERRIDES
    -- Normally leave these empty.
    -- These let you override an original control ID directly without
    -- changing the simple sections above.
    -- Example:
    -- Toggles = {AutoFarmBlade = false}
    -- ========================================================
    Advanced = {
        Toggles = {},                -- Exact original toggle IDs and true/false values.
        Values = {},                 -- Exact original slider/dropdown IDs and their values.
        Inputs = {},                 -- Exact original input IDs and their text values.
        Buttons = {},                -- Exact original button names; true runs that action once.
    },
}


-- ============================================================
-- SIMPLE CONFIG -> ORIGINAL CONTROL IDS
-- The rest of the script still uses its original control names,
-- so this converts the clean config above automatically.
-- ============================================================

local ACTIVE = {
    Toggles = {},
    Values = {},
    Inputs = {},
    Buttons = {},
}

local function setToggle(id, value)
    if value ~= nil then
        ACTIVE.Toggles[id] = value
    end
end

local function setValue(id, value)
    if value ~= nil then
        ACTIVE.Values[id] = value
    end
end

local function setInput(id, value)
    if value ~= nil then
        ACTIVE.Inputs[id] = value
    end
end

local function copyList(list)
    if type(list) ~= "table" then
        return {}
    end

    local out = {}
    for i = 1, #list do
        out[i] = list[i]
    end
    return out
end

local MAIN_MENU_ID_CONFIG = 13379208636
local LOBBY_ID_CONFIG = 14916516914
local TRADE_ID_CONFIG = 14932214603

local CurrentConfigSection

if game.PlaceId == MAIN_MENU_ID_CONFIG then
    CurrentConfigSection = "MainMenu"

    local C = CONFIG.MainMenu

    setToggle("AutoClickSelectToggle", C.AutoSelect)
    setToggle("AutoDialogClickerToggle", C.AutoDialog)
    setToggle("MyToggle", C.AutoJoin)

    setToggle("AutoRedeemToggle", C.AutoRedeem)
    setToggle("AutoNotNowClickerToggle", C.AutoNotNow)
    setToggle("StopAtSpinLimitToggle", C.StopAtSpinLimit)
    setToggle("AutoNotifyToggle", C.AutoNotify)
    setToggle("AutoTeleportToggle", C.AutoTeleport)
    setToggle("AutoSpinToggle", C.AutoSpin)
    setToggle("PopupRealTimeToggle", C.PopupRealTime)

    setToggle("HideUIToggle", C.HideUI)
    setToggle("EnableMobileUI", C.MobileUI)

    setValue("SlotSelectionDropdown", C.Slot)
    setValue("SelectDelaySlider", C.SelectDelay)

    setValue("JoinDestinationDropdown", C.JoinDestination)
    setValue("AutoJoinDelaySlider", C.JoinDelay)

    setValue("AutoTeleportTimeSlider", C.TeleportTime)

    setInput("StopAtSpinLimitInput", C.StopAtSpins)
    setValue("AutoSpinFamilies", copyList(C.SpinFamilies))
    setValue("AutoSpinDelaySlider", C.SpinDelay)

    setInput("Webhook_URL", C.WebhookURL)
    setValue("Webhook_PingMode", C.WebhookPing)

    setInput("NewCodeInput", C.NewCode)
    setValue("CodeListDropdown", copyList(C.StoredCodes))

    setValue("PopupUIScale", C.PopupScale)

elseif game.PlaceId == LOBBY_ID_CONFIG
    or game.PlaceId == TRADE_ID_CONFIG then

    CurrentConfigSection = "Lobby"

    local C = CONFIG.Lobby

    setToggle("HideUIToggle", C.HideUI)
    setToggle("EnableMobileUI", C.MobileUI)

    setToggle("AutoStartMissionToggle", C.AutoStartMission)
    setToggle("AutoWavesToggle", C.AutoWaves)
    setToggle("AutoTeleportToggle", C.AutoTeleport)

    setValue("MissionDropdown", C.Mission.Name)
    setValue("MissionObjectiveDropdown", C.Mission.Objective)
    setValue("MissionDifficultyDropdown", C.Mission.Difficulty)
    setValue("MissionModifiersDropdown", copyList(C.Mission.Modifiers))
    setValue("MissionDelaySlider", C.Mission.Delay)
    setValue("WavesDelaySlider", C.Mission.WavesDelay)

    setToggle("AutoBoost_Enable", C.Boosts.Enabled)
    setToggle("AutoBoost_Gold", C.Boosts.Gold)
    setToggle("AutoBoost_Luck", C.Boosts.Luck)
    setToggle("AutoBoost_XP", C.Boosts.XP)
    setValue("AutoBoost_Delay", C.Boosts.Delay)

    setToggle("Boost_PurchaseToggle", C.Boosts.Purchase)
    setToggle("Boost_AutoUseToggle", C.Boosts.AutoUse)
    setValue("Boost_ListDropdown", copyList(C.Boosts.Selected))
    setValue("Boost_AmountSlider", C.Boosts.Amount)
    setValue("Boost_DelaySlider", C.Boosts.UseDelay)

    setToggle("AutoSellCosmetics", C.Cosmetics.AutoSell)
    setValue("AutoSellRepeat", C.Cosmetics.Repeat)
    setValue("AutoSellDelay", C.Cosmetics.Delay)

    setToggle("PerkDel_Auto", C.Perks.AutoDelete)
    setToggle("PerkDel_Common", C.Perks.Common)
    setToggle("PerkDel_Rare", C.Perks.Rare)
    setToggle("PerkDel_Epic", C.Perks.Epic)
    setToggle("PerkDel_Legendary", C.Perks.Legendary)
    setToggle("PerkDel_Secret", C.Perks.Secret)
    setValue("PerkDel_Delay", C.Perks.Delay)
    setValue("PerkDel_Interval", C.Perks.Interval)

    setToggle("AutoUpgradeBladeToggle", C.Upgrades.Blade)
    setToggle("AutoUpgradeSpearToggle", C.Upgrades.Spear)
    setValue("BladeUpgradeDelaySlider", C.Upgrades.BladeDelay)
    setValue("SpearUpgradeDelaySlider", C.Upgrades.SpearDelay)

    setToggle("UnlockSkillsToggle", C.Skills.Unlock)
    setToggle("AutoEquipSkillsToggle", C.Skills.AutoEquip)

    setValue("SupportSideDropdown", C.Skills.SupportSide)
    setValue("OffenseSideDropdown", C.Skills.OffenseSide)
    setValue("DefenseSideDropdown", C.Skills.DefenseSide)

    setValue("UnlockDelaySlider", C.Skills.UnlockDelay)
    setValue("SkillEquipDelay", C.Skills.EquipDelay)

    setInput("SkillSlot1", C.Skills.Slots[1])
    setInput("SkillSlot2", C.Skills.Slots[2])
    setInput("SkillSlot3", C.Skills.Slots[3])
    setInput("SkillSlot4", C.Skills.Slots[4])
    setInput("SkillSlot5", C.Skills.Slots[5])

    setToggle("EnableShadowChecker", C.ShadowChecker.Enabled)
    setInput("ShadowBanWebhookURL", C.ShadowChecker.WebhookURL)

    setToggle("PrestigeToggle", C.Prestige.Enabled)
    setToggle("ForceGoldToggle", C.Prestige.ForceGold)

    setValue("GoldReq_0to1", C.Prestige.GoldRequirements[0])
    setValue("GoldReq_1to2", C.Prestige.GoldRequirements[1])
    setValue("GoldReq_2to3", C.Prestige.GoldRequirements[2])
    setValue("GoldReq_3to4", C.Prestige.GoldRequirements[3])
    setValue("GoldReq_4to5", C.Prestige.GoldRequirements[4])

    setValue("BoostDropdown", C.Prestige.Boost)
    setValue("PrestigeSendAsDropdown", C.Prestige.SendAs)
    setValue("PrestigeCooldownSlider", C.Prestige.Cooldown)

    setToggle("ClaimQuestToggle", C.Claims.Quests)
    setToggle("ClaimAchievementToggle", C.Claims.Achievements)
    setValue("ClaimDelaySlider", C.Claims.Delay)

    setValue("Trade_Acc1_Dropdown", copyList(C.Trade.Receiver))
    setValue("Trade_Acc2_Dropdown", copyList(C.Trade.Sender))

    setInput("Trade_Acc1_Input", C.Trade.ReceiverInput)
    setInput("Trade_Acc2_Input", C.Trade.SenderInput)

    setToggle("Trade_Acc1_Send", C.Trade.ReceiverSend)
    setToggle("Trade_Acc1_Accept", C.Trade.ReceiverAccept)

    setToggle("Trade_Acc2_Send", C.Trade.SenderSend)
    setToggle("Trade_Acc2_Accept", C.Trade.SenderAccept)

    setToggle("Trade_Current_Send", C.Trade.CurrentPlayersSend)
    setToggle("Trade_Current_Accept", C.Trade.CurrentPlayersAccept)

    setToggle("ApplyHistoryToggle", C.Trade.ApplyHistory)
    setValue("HistoryOptionDropdown", C.Trade.History)

    setToggle("Alt2_AutoTradeToggle", C.Trade.AutoTrade)
    setToggle("Alt2_AcceptTradeToggle", C.Trade.AcceptTrade)

    setValue("Alt2_ItemSelectDropdown", copyList(C.Trade.Items))
    setValue("Alt2_SelectAmountSlider", C.Trade.AmountPerItem)

    setToggle("AutoDisableToggle", C.Trade.AutoDisable)
    setValue("AutoDisableThresholdSlider", C.Trade.AutoDisableThreshold)

else
    CurrentConfigSection = "Mission"

    local C = CONFIG.Mission

    setToggle("HideUIToggle", C.HideUI)
    setToggle("EnableMobileUI", C.MobileUI)

    setToggle("AutoFarmBlade", C.AutoFarm)
    setToggle("AutoReloadBlade", C.AutoReload)
    setToggle("StartRejoin", C.AutoRetry)
    setToggle("AutoReturnToggle", C.AutoReturn)

    setToggle("AutoThunderSpearToggle", C.AutoThunderSpear)
    setToggle("AutoSpearQuestToggle", C.AutoSpearQuest)
    setToggle("SpearHitDistanceToggle", C.SpearHitDistanceEnabled)

    setToggle("SkipCutSceneToggle", C.SkipCutScene)
    setToggle("SkipForceToggle", C.SkipForce)

    setToggle("PlayerStatsToggle", C.PlayerStats)

    setValue("FarmModeDropdown", C.Farm.Mode)
    setValue("HoverSpeedSlider", C.Farm.HoverSpeed)
    setValue("HoverHeightSlider", C.Farm.HoverHeight)
    setValue("SafetyTimeSlider", C.Farm.SafetyTime)
    setValue("StopAtTitansLeftSlider", C.Farm.StopAtTitansLeft)
    setValue("KillHitsSlider", C.Farm.KillHits)

    setValue("ThunderSpear_FarmMode", C.ThunderSpear.Mode)
    setValue("ThunderSpear_HoverSpeed", C.ThunderSpear.HoverSpeed)
    setValue("ThunderSpear_HoverHeight", C.ThunderSpear.HoverHeight)
    setValue("SpearHitDistanceSlider", C.ThunderSpear.HitDistance)

    setValue("UIScaleSlider", C.Performance.UIScale)
    setValue("FPSLimitSlider", C.Performance.FPSLimit)
    setValue("RenderModeDropdown", copyList(C.Performance.RenderModes))

    setValue("TargetMissionsSlider", C.Return.TargetMissions)

    setToggle("CombinedActionToggle", C.FailSafe.Enabled)
    setValue("CombinedActionDelaySlider", C.FailSafe.Delay)
    setValue("CombinedActionsDropdown", copyList(C.FailSafe.Actions))

    setToggle("WebhookToggle", C.Webhook.Enabled)
    setInput("WebhookURL", C.Webhook.URL)
    setValue("WebhookMode", C.Webhook.Mode)
    setValue("WebhookPingMode", C.Webhook.PingMode)
    setValue("WebhookFilters", copyList(C.Webhook.Filters))

    setToggle("SetDescToggle", C.Description.Enabled)
    setValue("DescTypeDropdown", C.Description.Type)
    setValue("DescStatsDropdown", copyList(C.Description.Stats))
    setValue("DescItemsDropdown", copyList(C.Description.Items))
    setValue("DescCosmeticsDropdown", copyList(C.Description.Cosmetics))
end

-- Exact-ID overrides always win.
for id, value in pairs(CONFIG.Advanced.Toggles or {}) do
    ACTIVE.Toggles[id] = value
end

for id, value in pairs(CONFIG.Advanced.Values or {}) do
    ACTIVE.Values[id] = value
end

for id, value in pairs(CONFIG.Advanced.Inputs or {}) do
    ACTIVE.Inputs[id] = value
end

for id, value in pairs(CONFIG.Advanced.Buttons or {}) do
    ACTIVE.Buttons[id] = value
end

-- Compatibility aliases used by the existing headless control layer.
CONFIG.Toggles = ACTIVE.Toggles
CONFIG.Values = ACTIVE.Values
CONFIG.Inputs = ACTIVE.Inputs
CONFIG.Buttons = ACTIVE.Buttons

CONFIG.ActiveSection = CurrentConfigSection

getgenv().TownShipHeadlessConfig = CONFIG

-- ============================================================
-- ULTRA-FAST BOOT
-- Mission = minimal waits | Lobby = normal waits
-- ============================================================
local MAIN_MENU_ID_BOOT = 13379208636
local LOBBY_ID_BOOT = 14916516914
local TRADE_ID_BOOT = 14932214603
local _pid = game.PlaceId
local IS_MISSION_BOOT = (_pid ~= LOBBY_ID_BOOT and _pid ~= TRADE_ID_BOOT and _pid ~= MAIN_MENU_ID_BOOT)

if not game:IsLoaded() then
    if IS_MISSION_BOOT then
        -- mission: don't spin long
        local t = tick()
        while not game:IsLoaded() and (tick() - t) < 2 do task.wait() end
        if not game:IsLoaded() then game.Loaded:Wait() end
    else
        local bootAttempts = 0
        while not game:IsLoaded() and bootAttempts < 2 do
            bootAttempts += 1
            task.wait(0.25)
        end
        if not game:IsLoaded() then game.Loaded:Wait() end
    end
end

local Players = game:GetService("Players")
local player = Players.LocalPlayer
if not player then
    if IS_MISSION_BOOT then
        local t = tick()
        while not player and (tick() - t) < 2 do
            player = Players.LocalPlayer
            task.wait()
        end
    end
    if not player then
        repeat task.wait() player = Players.LocalPlayer until player
    end
end

-- Mission: FindFirstChild first (no long WaitForChild block)
local PlayerGui = player:FindFirstChild("PlayerGui") or player:WaitForChild("PlayerGui", IS_MISSION_BOOT and 2 or 10)

task.defer(function()
    if not game:IsLoaded() then game.Loaded:Wait() end
end)

-- Lobby-only loader (only runs checks in lobby place)
_G.LobbyUILoaded = false
task.spawn(function()
    local LOBBY_PLACE = 14916516914
    local TRADE_PLACE = 14932214603

    -- Not lobby → mark loaded so nothing waits forever
    if game.PlaceId ~= LOBBY_PLACE and game.PlaceId ~= TRADE_PLACE then
        _G.LobbyUILoaded = true
        return
    end

    local function isLobbyUiReady()
        local ok = false
        pcall(function()
            local interface = PlayerGui:FindFirstChild("Interface")
            if not interface then return end
            local gearUp = interface:FindFirstChild("Gear_Up")
            if not gearUp then return end

            -- Prefer real lobby panel visibility
            local lobby = gearUp:FindFirstChild("Lobby")
            if lobby then
                local backing = lobby:FindFirstChild("Backing")
                if backing and backing:IsA("GuiObject") and backing.Visible then
                    ok = true
                    return
                end
                if lobby:IsA("GuiObject") and lobby.Visible then
                    ok = true
                    return
                end
            end

            -- Fallback: HUD / Topbar inventory button exists
            local top = interface:FindFirstChild("Topbar")
            if top and top:FindFirstChild("Main") then
                ok = true
            end
        end)
        return ok
    end

    local start = tick()
    local timeout = 45 -- max wait

    repeat
        if isLobbyUiReady() then
            -- small settle time after UI appears
            task.wait(1.5)
            if isLobbyUiReady() then
                _G.LobbyUILoaded = true
                print("[Lobby] UI loaded")
                return
            end
        end
        task.wait(0.25)
    until (tick() - start) >= timeout

    -- Timeout fallback so features still run
    _G.LobbyUILoaded = true
    print("[Lobby] UI wait timed out — continuing")
end)





-- ระบบเช็คสถานะ GUI และ Auto Teleport เมื่อผิดปกติ
-- OPTIMIZED: helpers are declared before first use and services are cached.
task.spawn(function()
    local PlayersService = game:GetService("Players")
    local LocalPlayer = PlayersService.LocalPlayer
    if not LocalPlayer then return end
    if game.PlaceId ~= 14916516914 then return end

    local localPlayerGui = LocalPlayer:WaitForChild("PlayerGui", 10)
    if not localPlayerGui then return end

    local function IsActuallyVisible(gui)
        if not gui or not gui:IsA("GuiObject") or not gui.Visible then
            return false
        end

        local current = gui.Parent
        while current do
            if current:IsA("GuiObject") and not current.Visible then
                return false
            end
            if current:IsA("ScreenGui") and not current.Enabled then
                return false
            end
            current = current.Parent
        end
        return true
    end

    local function GetGuiByPath(root, pathSegments)
        local current = root
        for index = 1, #pathSegments do
            if not current then break end
            current = current:FindFirstChild(pathSegments[index])
        end
        return current
    end

    local targets = {
        {"Interface", "Gear_Up", "Lobby", "Backing"},
        {"Interface", "Topbar", "Main", "Categories", "Inventory"},
    }

    local function checkAnyVisible()
        for index = 1, #targets do
            local gui = GetGuiByPath(localPlayerGui, targets[index])
            if gui and IsActuallyVisible(gui) then
                return true
            end
        end
        return false
    end

    local ReplicatedStorageService = game:GetService("ReplicatedStorage")
    local assets = ReplicatedStorageService:FindFirstChild("Assets")
    local remotes = assets and assets:FindFirstChild("Remotes")
    local remote = remotes and remotes:FindFirstChild("POST")

    if not checkAnyVisible() then
        task.wait(10)

        if not checkAnyVisible() then
            if remote then
                pcall(function()
                    remote:FireServer("Functions", "Teleport", "Menu", nil)
                end)
            else
                pcall(function()
                    game:GetService("TeleportService"):Teleport(
                        13379208636,
                        LocalPlayer
                    )
                end)
            end
        end
    end
end)


-- Already past boot above — only re-check if needed
if not game:IsLoaded() then game.Loaded:Wait() end
if not Players.LocalPlayer then
    repeat task.wait() until Players.LocalPlayer
end
PlayerGui = Players.LocalPlayer:FindFirstChild("PlayerGui") or Players.LocalPlayer:WaitForChild("PlayerGui", 3)

-- Interface wait: LOBBY only long | MISSION almost instant
do
    local pid = game.PlaceId
    local isLobbyPlace = (pid == 14916516914 or pid == 14932214603)
    local pg = Players.LocalPlayer.PlayerGui
    if isLobbyPlace then
        local t0 = tick()
        while not pg:FindFirstChild("Interface") and (tick() - t0) < 30 do
            task.wait(0.1)
        end
        task.wait(0.5)
    else
        -- MISSION / main menu: max ~0.4s total, no settle sleep
        local t0 = tick()
        while not pg:FindFirstChild("Interface") and (tick() - t0) < 0.4 do
            task.wait()
        end
        -- zero settle — farm tabs can start immediately
    end
end

-- ระบบ AFK 
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local VirtualUser = game:GetService("VirtualUser")

local currentCamera = game.Workspace.CurrentCamera

player.Idled:Connect(function()
	VirtualUser:Button2Down(Vector2.zero, currentCamera.CFrame)
	task.wait(1)
	VirtualUser:Button2Up(Vector2.zero, currentCamera.CFrame)
end)
----------------------------------------------------------------------

-- ============================================================
-- HEADLESS CONTROL COMPATIBILITY LAYER
-- Replaces Linoria UI objects with tiny Lua tables.
-- No control/menu UI is created.
-- ============================================================

getgenv().Options = {}
getgenv().Toggles = {}
Options = getgenv().Options
Toggles = getgenv().Toggles

local function cloneTable(value)
    if type(value) ~= "table" then
        return value
    end

    local out = {}
    for k, v in pairs(value) do
        if type(v) == "table" then
            out[k] = cloneTable(v)
        else
            out[k] = v
        end
    end
    return out
end

local function normalizeMulti(value)
    if type(value) ~= "table" then
        if value == nil or value == "" then
            return {}
        end
        return {[tostring(value)] = true}
    end

    local hasNumeric = false
    for k in pairs(value) do
        if type(k) == "number" then
            hasNumeric = true
            break
        end
    end

    if not hasNumeric then
        return cloneTable(value)
    end

    local out = {}
    for _, v in ipairs(value) do
        if type(v) == "string" then
            out[v] = true
        end
    end
    return out
end

local function configValue(id, defaultValue, kind, multi)
    local value = nil

    if kind == "toggle" then
        value = CONFIG.Toggles[id]
    elseif kind == "input" then
        value = CONFIG.Inputs[id]
        if value == nil then
            value = CONFIG.Values[id]
        end
    else
        value = CONFIG.Values[id]
    end

    if value == nil then
        value = defaultValue
    end

    if multi then
        value = normalizeMulti(value)
    elseif type(value) == "table" then
        value = cloneTable(value)
    end

    return value
end

local function makeControl(id, opts, kind)
    opts = opts or {}

    local control = {
        Id = id,
        Text = opts.Text or tostring(id),
        Values = opts.Values,
        Multi = opts.Multi == true,
        Callback = opts.Callback,
    }

    control.Value = configValue(
        id,
        opts.Default,
        kind,
        control.Multi
    )

    local function valuesEqual(a, b)
        if type(a) == "table" or type(b) == "table" then
            return false
        end
        return a == b
    end

    function control:SetValue(value)
        if self.Multi then
            value = normalizeMulti(value)
        end

        local changed = not valuesEqual(self.Value, value)
        self.Value = value

        if changed and type(self.Callback) == "function" then
            local ok, err = pcall(self.Callback, value)
            if not ok then
                warn(
                    "[Headless Config] callback error for "
                    .. tostring(self.Id)
                    .. ": "
                    .. tostring(err)
                )
            end
        end

        return self
    end

    function control:SetValues(values)
        self.Values = values
        return self
    end

    function control:SetText(value)
        self.Text = tostring(value or "")
        return self
    end

    function control:AddKeyPicker(keyId, keyOpts)
        return makeControl(keyId, keyOpts or {}, "value")
    end

    Options[id] = control
    if kind == "toggle" then
        Toggles[id] = control
    end

    -- Non-toggle values should exist before following controls are built.
    if kind ~= "toggle" and type(control.Callback) == "function" then
        local ok, err = pcall(control.Callback, control.Value)
        if not ok then
            warn(
                "[Headless Config] initial value error for "
                .. tostring(id)
                .. ": "
                .. tostring(err)
            )
        end
    elseif kind == "toggle" and type(control.Callback) == "function" then
        -- Start enabled features after the current setup stack has completed.
        task.defer(function()
            if control.Value == configValue(
                id,
                opts.Default,
                kind,
                control.Multi
            ) then
                local ok, err = pcall(control.Callback, control.Value)
                if not ok then
                    warn(
                        "[Headless Config] initial toggle error for "
                        .. tostring(id)
                        .. ": "
                        .. tostring(err)
                    )
                end
            end
        end)
    end

    if CONFIG.System.PrintConfigLoads then
        print(
            "[Headless Config]",
            tostring(id),
            "=",
            type(control.Value) == "table" and "<table>" or tostring(control.Value)
        )
    end

    return control
end

local Node = {}
Node.__index = Node

local function newNode(name)
    return setmetatable({
        Name = tostring(name or "Headless"),
        Holder = nil,
    }, Node)
end

function Node:AddTab(name)
    return newNode(name)
end

function Node:AddLeftGroupbox(name)
    return newNode(name)
end

function Node:AddRightGroupbox(name)
    return newNode(name)
end

function Node:AddLeftTabbox(name)
    return newNode(name)
end

function Node:AddToggle(id, opts)
    return makeControl(id, opts, "toggle")
end

function Node:AddSlider(id, opts)
    return makeControl(id, opts, "value")
end

function Node:AddDropdown(id, opts)
    return makeControl(id, opts, "value")
end

function Node:AddInput(id, opts)
    return makeControl(id, opts, "input")
end

function Node:AddLabel(text)
    local label = {
        Text = tostring(text or ""),
    }

    function label:SetText(value)
        self.Text = tostring(value or "")
        return self
    end

    function label:AddKeyPicker(id, opts)
        return makeControl(id, opts or {}, "value")
    end

    return label
end

function Node:AddDivider()
    return self
end

function Node:AddButton(text, callback)
    local enabled = CONFIG.Buttons[tostring(text)] == true

    if enabled and type(callback) == "function" then
        task.defer(function()
            local ok, err = pcall(callback)
            if not ok then
                warn(
                    "[Headless Config] button error for "
                    .. tostring(text)
                    .. ": "
                    .. tostring(err)
                )
            end
        end)
    end

    return {
        Text = tostring(text or ""),
        Press = callback,
    }
end

local Library = {
    ToggleKeybind = nil,
}

function Library:CreateWindow(_)
    local window = newNode("TownShip Headless")

    -- Fake holder only for compatibility with old code.
    -- Visible=false makes trade code treat the old menu as hidden.
    window.Holder = {
        Visible = false,
        Position = UDim2.new(0, 0, 0, 0),
    }

    return window
end

function Library:Notify(message, _duration)
    if CONFIG.System.PrintNotifications then
        print("[TownShip]", tostring(message))
    end
end

function Library:Toggle()
    -- No UI exists. Keep it logically hidden.
end

function Library:Unload()
    getgenv().TownShipHeadlessUnloaded = true
    print("[TownShip] Headless unload flag set")
end

local ThemeManager = {
    BuiltInThemes = {},
}

function ThemeManager:SetLibrary(_) end
function ThemeManager:SetFolder(_) end
function ThemeManager:ApplyTheme(_) end
function ThemeManager:SaveDefault(_) end

local SaveManager = {
    Folder = "TownShip/Headless",
    AutoloadLabel = nil,
}

function SaveManager:SetLibrary(_) end
function SaveManager:SetFolder(folder)
    self.Folder = folder or self.Folder
end
function SaveManager:IgnoreThemeSettings() end
function SaveManager:SetIgnoreIndexes(_) end
function SaveManager:BuildFolderTree() end
function SaveManager:BuildConfigSection(_) end
function SaveManager:LoadAutoloadConfig() end
function SaveManager:RefreshConfigList()
    return {}
end


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local VIM = game:GetService("VirtualInputManager")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")

pcall(function()
    UserInputService.MouseIconEnabled = true
    UserInputService.MouseBehavior = Enum.MouseBehavior.Default
end)
local Player = Players.LocalPlayer
local PlayerGui = Player:FindFirstChild("PlayerGui") or Player:WaitForChild("PlayerGui", 3)

local Assets
do
    local a = ReplicatedStorage:FindFirstChild("Assets")
    if a then
        Assets = a:FindFirstChild("Remotes")
    end
    if not Assets then
        Assets = ReplicatedStorage:WaitForChild("Assets", 5):WaitForChild("Remotes", 5)
    end
end
local POST = Assets:FindFirstChild("POST") or Assets:WaitForChild("POST", 3)
local GET = Assets:FindFirstChild("GET") or Assets:WaitForChild("GET", 3)

local function SafeInvoke(remote, ...)
    local args = {...}
    local maxRetries = 3
    local attempt = 0
    while attempt < maxRetries do
        attempt = attempt + 1
        local success, result = pcall(function()
            return remote:InvokeServer(unpack(args))
        end)
        if success then
            return true, result
        end
        if attempt < maxRetries then
            local delay = 0.3 * (2 ^ (attempt - 1))
            task.wait(delay)
        end
    end
    return false, nil
end

local function SafeFire(remote, ...)
    local args = {...}
    local success = pcall(function()
        remote:FireServer(unpack(args))
    end)
    return success
end

getgenv().SafeInvoke = SafeInvoke
getgenv().SafeFire = SafeFire

-- OPTIMIZED: removed unused ErrorLog / LastServerResponse bookkeeping.

-- OPTIMIZED: duplicate Player.Idled anti-AFK handler removed.
-- The earlier VirtualUser handler already handles idle prevention.

task.spawn(function()
    while task.wait(300) do
        pcall(function()
            local ok, memBefore = pcall(gcinfo)
            collectgarbage("collect")
            local ok2, memAfter = pcall(gcinfo)
        end)
    end
end)

local LastGlobalHeartbeat = tick()
task.spawn(function()
    local watchConn = RunService.Heartbeat:Connect(function() LastGlobalHeartbeat = tick() end)
    while task.wait(10) do
        pcall(function()
            local elapsed = tick() - LastGlobalHeartbeat
            if elapsed > 15 then
                if watchConn then pcall(function() watchConn:Disconnect() end) end
                watchConn = RunService.Heartbeat:Connect(function() LastGlobalHeartbeat = tick() end)
            end
        end)
    end
end)

local PlaceId = game.PlaceId
local MAIN_MENU_ID = 13379208636
local LOBBY_ID = 14916516914
local TRADE_LOBBY_ID = 14932214603
-- ===== Mission Counter System =====
local MISSIONS_FILE = "TownShip/missions_count_" .. tostring(Player.UserId) .. ".txt"
local completedMissions = 0
local targetMissions = 2
local autoReturnEnabled = false
local isReturning = false

if isfile(MISSIONS_FILE) then
    completedMissions = tonumber(readfile(MISSIONS_FILE)) or 0
else
    writefile(MISSIONS_FILE, "0")
end

local function saveMissionsCount()
    writefile(MISSIONS_FILE, tostring(completedMissions))
end

local function resetMissionsCount()
    completedMissions = 0
    saveMissionsCount()
end
local function IsMainmenuLobby() return PlaceId == MAIN_MENU_ID end
local function IsLobbyLobby() return PlaceId == LOBBY_ID or PlaceId == TRADE_LOBBY_ID end
local function IsIngameLobby() return not IsMainmenuLobby() and not IsLobbyLobby() end

task.spawn(function()
    local start = tick()
    repeat
        if PlayerGui:FindFirstChild("Interface") then break end
        task.wait()
    until tick() - start > 3
end)

-- Main Menu / Lobby startup settle
--
-- MAIN MENU:
--   1) Wait for Interface.Title_Screen
--   2) Continue as soon as the character Slots are actually visible
--   3) Also accept a visible "Loaded!" state as a fallback
--   4) Ignore hidden/stale loading labels and use only a short settle
--
-- LOBBY:
--   Keep the original Gear_Up.Lobby + 8 second settle.
do
    local MAIN_MENU_PLACE = 13379208636
    local LOBBY_PLACE = 14916516914
    local TRADE_PLACE = 14932214603

    if PlaceId == MAIN_MENU_PLACE then
        print("[MainMenu] Waiting for Title_Screen...")

        local titleScreen = nil
        local titleStart = tick()

        -- First wait for the actual main-menu screen.
        while (tick() - titleStart) < 90 do
            pcall(function()
                local interface = Player.PlayerGui:FindFirstChild("Interface")
                titleScreen = interface
                    and interface:FindFirstChild("Title_Screen")
            end)

            if titleScreen then
                break
            end

            task.wait(0.10)
        end

        if titleScreen then
            print("[MainMenu] Title_Screen found — waiting for menu to be ready...")

            local function cleanText(value)
                value = tostring(value or "")
                value = value:gsub("<.->", "")
                value = value:gsub("^%s+", "")
                value = value:gsub("%s+$", "")
                return value
            end

            local function isActuallyVisible(obj)
                if not obj then
                    return false
                end

                if obj:IsA("GuiObject") then
                    if not obj.Visible then
                        return false
                    end

                    if obj.AbsoluteSize.X <= 1 or obj.AbsoluteSize.Y <= 1 then
                        return false
                    end
                end

                local current = obj.Parent

                while current and current ~= titleScreen.Parent do
                    if current:IsA("GuiObject") and not current.Visible then
                        return false
                    end

                    if current:IsA("ScreenGui") and not current.Enabled then
                        return false
                    end

                    current = current.Parent
                end

                return true
            end

            local function isSlotsReady()
                if not titleScreen or not titleScreen.Parent then
                    return false
                end

                local slots = titleScreen:FindFirstChild("Slots")
                if not slots then
                    return false
                end

                -- If the character slots are already visible, the menu is usable.
                return isActuallyVisible(slots)
            end

            local function getMainMenuLoadState()
                if not titleScreen or not titleScreen.Parent then
                    return false, nil
                end

                -- Main fix: don't wait for the Loaded! label if the slot screen
                -- is already visible and usable.
                if isSlotsReady() then
                    return true, "Slots Ready"
                end

                local loadingText = nil

                for _, obj in ipairs(titleScreen:GetDescendants()) do
                    if obj:IsA("TextLabel") or obj:IsA("TextButton") then
                        -- Ignore hidden/old loading labels left in the UI tree.
                        if isActuallyVisible(obj) then
                            local raw = cleanText(obj.Text)
                            local lower = string.lower(raw)

                            if lower == "loaded!"
                                or lower == "loaded"
                                or lower:find("loaded!", 1, true) then

                                return true, raw
                            end

                            if lower:find("loading data", 1, true)
                                or lower:find("loading", 1, true) then

                                loadingText = raw
                            end
                        end
                    end
                end

                return false, loadingText
            end

            local dataStart = tick()
            local lastPrintedState = nil
            local dataLoaded = false

            -- Short fallback only. Normally this ends as soon as Slots appear.
            while (tick() - dataStart) < 20 do
                local loaded, stateText = getMainMenuLoadState()

                if loaded then
                    dataLoaded = true
                    print(
                        "[MainMenu] Menu ready: "
                        .. tostring(stateText or "Ready")
                    )
                    break
                end

                if stateText
                    and stateText ~= lastPrintedState then

                    lastPrintedState = stateText
                    print(
                        "[MainMenu] Waiting on game data: "
                        .. tostring(stateText)
                    )
                end

                task.wait(0.05)
            end

            if dataLoaded then
                task.wait(0.75)
                print("[MainMenu] Ready — continuing script")
            else
                warn("[MainMenu] Ready state not detected — continuing anyway")
                task.wait(1)
            end
        else
            warn("[MainMenu] Title_Screen wasn't detected — continuing")
            task.wait(1)
        end

    elseif PlaceId == LOBBY_PLACE or PlaceId == TRADE_PLACE then
        print("[Lobby] Waiting for Interface / Gear_Up...")

        local t0 = tick()

        while (tick() - t0) < 90 do
            local gear = nil

            pcall(function()
                gear = Player.PlayerGui:FindFirstChild("Interface")
                    and Player.PlayerGui.Interface:FindFirstChild("Gear_Up")
            end)

            if gear then
                local lobby = gear:FindFirstChild("Lobby")

                if lobby then
                    print("[Lobby] Gear_Up.Lobby found — waiting 8s settle...")
                    task.wait(8)

                    _G.LobbyUILoaded = true
                    print("[Lobby] Ready — continuing script")
                    break
                end
            end

            task.wait(0.15)
        end

        if not _G.LobbyUILoaded then
            print("[Lobby] Timeout — continuing anyway")
            _G.LobbyUILoaded = true
            task.wait(3)
        end
    end
end

local Window = Library:CreateWindow({Title="#Town Ship", Center=true, AutoShow=true})

local function isUIHiddenGlobal()
    local ok, hidden = pcall(function()
        return Window and Window.Holder and not Window.Holder.Visible
    end)
    return ok and hidden
end

local function hideUIGlobal()
    pcall(function()
        if Window and Window.Holder and Window.Holder.Visible then
            if Library and Library.Toggle then
                Library:Toggle()
            end
        end
    end)
end

local function showUIGlobal()
    pcall(function()
        if Window and Window.Holder and not Window.Holder.Visible then
            if Library and Library.Toggle then
                Library:Toggle()
            end
        end
    end)
end

getgenv().isUIHidden = isUIHiddenGlobal
getgenv().hideUI = hideUIGlobal
getgenv().showUI = showUIGlobal

local TownShipFolder = "TownShip"
if not isfolder(TownShipFolder) then makefolder(TownShipFolder) end

local activeFolder
if IsMainmenuLobby() then activeFolder = TownShipFolder.."/Mainmenu"
elseif IsLobbyLobby() then activeFolder = TownShipFolder.."/Lobby"
elseif IsIngameLobby() then activeFolder = TownShipFolder.."/Ingame"
else activeFolder = TownShipFolder.."/Default" end
if not isfolder(activeFolder) then makefolder(activeFolder) end

pcall(function()
    if game.Workspace:FindFirstChild("LinoriaLibSettings") then game.Workspace.LinoriaLibSettings:Destroy() end
    if isfolder("LinoriaLibSettings") then delfolder("LinoriaLibSettings") end
end)


local oldBuildFolderTree = SaveManager.BuildFolderTree
SaveManager.BuildFolderTree = function(...) if oldBuildFolderTree then return oldBuildFolderTree(...) end end
SaveManager:SetLibrary(Library)
SaveManager:SetFolder(activeFolder)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({"MenuKeybind"})
ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder(TownShipFolder)
pcall(function() SaveManager:BuildFolderTree() end)

local Tabs = {}
if IsMainmenuLobby() then Tabs.MainMenu = Window:AddTab("Main Menu") end
if IsLobbyLobby() then
    Tabs.Lobby = Window:AddTab("Lobby")
    Tabs.Session = Window:AddTab("Equipment")
    Tabs.Trade = Window:AddTab("Trade")
end
if IsIngameLobby() then
    Tabs.AutoFarm = Window:AddTab("Auto Farm")
    Tabs.Webhook = Window:AddTab("Webhook")
end


-- ============================================================
-- Auto Boost (Gold / Luck / XP) - Integrated
-- ============================================================
if IsLobbyLobby() then
    task.spawn(function()
        while not Tabs.Session do task.wait(0.1) end
        task.wait(0.3)

        local BoostGroup = Tabs.Session:AddLeftGroupbox("Auto Boost")

        local BOOST_ITEMS = {
            Gold = {
                ["2h"]  = "2x Gold Boost [2h]",
                ["1h"]  = "2x Gold Boost [1h]",
                ["30m"] = "2x Gold Boost [30m]",
            },
            Luck = {
                ["2h"]  = "2x Luck Boost [2h]",
                ["1h"]  = "2x Luck Boost [1h]",
                ["30m"] = "2x Luck Boost [30m]",
            },
            XP = {
                ["2h"]  = "2x XP Boost [2h]",
                ["1h"]  = "2x XP Boost [1h]",
                ["30m"] = "2x XP Boost [30m]",
            },
        }

        local BOOST_IDS = {
            Gold = { ["2h"] = 9, ["1h"] = 8, ["30m"] = 7 },
            Luck = { ["2h"] = nil, ["1h"] = nil, ["30m"] = nil },
            XP   = { ["2h"] = nil, ["1h"] = nil, ["30m"] = nil },
        }

        local BOOST_DURATION = {
            ["2h"] = 7200,
            ["1h"] = 3600,
            ["30m"] = 1800,
        }

        local TIER_PRIORITY = {"2h", "1h", "30m"}

        local boostState = {
            enabled = false,
            selected = { Gold = true, Luck = false, XP = false },
            cycleDelay = 1,
            bought = 0,
            used = 0,
            cycles = 0,
        }

        -- Runtime protection against duplicate Gold purchases.
        local goldRuntime = {
            activeUntil = 0,
            purchaseLockUntil = 0,
            lastBuyAt = 0,
            lastUseAt = 0,
            inventoryChecked = false,
        }

        -- Gold debug output.
        -- Only prints when the state changes so the console does not get spammed.
        local lastGoldDebugState = nil

        local function goldDebug(state, message)
            if lastGoldDebugState == state then
                return
            end

            lastGoldDebugState = state
            print("[GoldBoost] " .. tostring(message))
        end

        local function parseTimerText(text)
            if type(text) ~= "string" then
                return nil
            end

            text = text:gsub("^%s+", ""):gsub("%s+$", "")

            -- HH:MM:SS
            local h, m, s = text:match("(%d+):(%d+):(%d+)")
            if h then
                return tonumber(h) * 3600 + tonumber(m) * 60 + tonumber(s)
            end

            -- MM:SS
            local mm, ss = text:match("^(%d+):(%d+)$")
            if mm then
                return tonumber(mm) * 60 + tonumber(ss)
            end

            -- Formats such as "2h 14m 05s", "30m", "45s"
            local hours = tonumber(text:match("(%d+)%s*[hH]")) or 0
            local mins = tonumber(text:match("(%d+)%s*[mM]")) or 0
            local secs = tonumber(text:match("(%d+)%s*[sS]")) or 0

            if hours > 0 or mins > 0 or secs > 0 then
                return hours * 3600 + mins * 60 + secs
            end

            -- Plain numeric seconds.
            if text:match("^%d+$") then
                return tonumber(text)
            end

            return nil
        end

        local function readBoostTimer(boostType)
            local paths = {
                function()
                    return Player.PlayerGui.Interface.Gear_Up.Boosts[boostType].Time.Time
                end,
                function()
                    return Player.PlayerGui.Interface.Gear_Up.Boosts[boostType].Time
                end,
                function()
                    return Player.PlayerGui.Interface.Gear_Up.Boosts[boostType].Timer.Time
                end,
                function()
                    return Player.PlayerGui.Interface.Gear_Up.Boosts[boostType].Timer
                end,
            }

            for _, getter in ipairs(paths) do
                local ok, label = pcall(getter)

                if ok and label then
                    local value = nil

                    if typeof(label) == "Instance" then
                        pcall(function()
                            if label:IsA("TextLabel") or label:IsA("TextButton") then
                                value = label.Text
                            elseif label:IsA("IntValue") or label:IsA("NumberValue") then
                                value = tostring(label.Value)
                            end
                        end)
                    elseif type(label) == "string" or type(label) == "number" then
                        value = tostring(label)
                    end

                    local seconds = parseTimerText(value)
                    if seconds ~= nil then
                        return seconds
                    end
                end
            end

            -- nil means "timer could not be read", NOT "boost is off".
            return nil
        end

        local function rememberGoldActive(seconds)
            seconds = tonumber(seconds)
            if not seconds or seconds <= 3 then
                return
            end

            goldRuntime.activeUntil = math.max(
                goldRuntime.activeUntil,
                tick() + seconds
            )
        end

        local function getGoldActiveState(ignorePurchaseLock)
            local seconds = readBoostTimer("Gold")

            -- The real readable timer always wins over local cache.
            if seconds ~= nil then
                if seconds > 3 then
                    rememberGoldActive(seconds)
                    goldDebug(
                        "active",
                        string.format("ACTIVE | %ds remaining | no buy", math.floor(seconds))
                    )
                    return true, seconds
                end

                -- Timer explicitly says OFF, so clear any stale guessed cache.
                goldRuntime.activeUntil = 0

                if (not ignorePurchaseLock)
                    and tick() < goldRuntime.purchaseLockUntil then

                    local remainingLock = math.max(
                        0,
                        math.floor(goldRuntime.purchaseLockUntil - tick())
                    )

                    goldDebug(
                        "purchase_lock",
                        string.format("WAITING FOR TIMER UPDATE | lock %ds | no buy", remainingLock)
                    )
                    return true, remainingLock
                end

                goldDebug(
                    "inactive",
                    "INACTIVE | real timer says off | eligible for checks"
                )
                return false, seconds
            end

            -- Only trust local active cache when the real timer is unreadable.
            local cached = math.floor(goldRuntime.activeUntil - tick())

            if cached > 3 then
                goldDebug(
                    "cached_active",
                    string.format(
                        "ACTIVE (cached because timer unreadable) | %ds remaining | no buy",
                        cached
                    )
                )
                return true, cached
            end

            if (not ignorePurchaseLock)
                and tick() < goldRuntime.purchaseLockUntil then

                local remainingLock = math.max(
                    0,
                    math.floor(goldRuntime.purchaseLockUntil - tick())
                )

                goldDebug(
                    "purchase_lock",
                    string.format("WAITING FOR TIMER UPDATE | lock %ds | no buy", remainingLock)
                )
                return true, remainingLock
            end

            goldDebug(
                "timer_unknown",
                "TIMER UNREADABLE | safe mode blocks buying"
            )

            return false, nil
        end

        local function isBoostActive(boostType)
            if boostType == "Gold" then
                local active = getGoldActiveState()
                return active
            end

            local seconds = readBoostTimer(boostType)
            return seconds ~= nil and seconds > 3
        end

        local function getBestTier(boostType)
            for _, tier in ipairs(TIER_PRIORITY) do
                local ids = BOOST_IDS[boostType]
                if ids and ids[tier] then
                    return tier, ids[tier]
                end
            end

            return nil, nil
        end

        local function getTierFromItemName(itemName)
            for tier, name in pairs(BOOST_ITEMS.Gold) do
                if name == itemName then
                    return tier
                end
            end

            return nil
        end

        -- Uses only the known working inventory remote.
        -- The old logic tried six different remotes and could trigger the same
        -- item more than once before the UI timer updated.
        local function useGoldBoost(itemName, tier, quiet, ignorePurchaseLock)
            if not itemName then
                return false
            end

            local active = getGoldActiveState(ignorePurchaseLock)
            if active then
                return false
            end

            -- Ultra-fast temporary lock only.
            -- Purchased-item activation is verified from the real timer.
            local useLock = ignorePurchaseLock and 0.8 or 1.2
            goldRuntime.purchaseLockUntil = math.max(
                goldRuntime.purchaseLockUntil,
                tick() + useLock
            )

            local ok, result = pcall(function()
                return GET:InvokeServer(
                    "S_Inventory",
                    "Item",
                    itemName
                )
            end)

            if not ok or result == false then
                goldRuntime.purchaseLockUntil = math.max(
                    goldRuntime.purchaseLockUntil,
                    tick() + 0.5
                )

                goldDebug(
                    "use_failed",
                    "USE FAILED | quick retry allowed"
                )
                return false
            end

            goldDebug(
                "use_waiting",
                string.format(
                    "USE SENT | %s | verifying real timer",
                    tostring(itemName)
                )
            )

            -- Nil/no-error from this remote is NOT proof the item was used.
            -- Confirm activation from the actual Gold timer only.
            local verifyStarted = tick()
            local seconds = nil

            repeat
                task.wait(0.05)
                seconds = readBoostTimer("Gold")

                if seconds ~= nil and seconds > 3 then
                    rememberGoldActive(seconds)

                    boostState.used = boostState.used + 1
                    goldRuntime.lastUseAt = tick()

                    goldDebug(
                        "used_confirmed",
                        string.format(
                            "BOOST CONFIRMED ACTIVE | %ds remaining",
                            math.floor(seconds)
                        )
                    )

                    if not quiet then
                        Library:Notify("[Boost] Gold boost activated", 2)
                    end

                    return true
                end
            until (tick() - verifyStarted) >= 0.55

            -- No real timer confirmation = do NOT invent a 30m/1h/2h cache.
            goldRuntime.activeUntil = 0
            goldRuntime.purchaseLockUntil = math.max(
                goldRuntime.purchaseLockUntil,
                tick() + 1.0
            )

            goldDebug(
                "use_unconfirmed",
                string.format(
                    "USE NOT CONFIRMED | %s | no fake active cache",
                    tostring(itemName)
                )
            )

            return false
        end

        -- We only buy after the Gold timer has been read as inactive twice.
        -- If the timer cannot be read, the safe behavior is to NOT buy.
        local function isGoldConfirmedInactive()
            local active = getGoldActiveState()
            if active then
                return false
            end

            if tick() < goldRuntime.purchaseLockUntil then
                return false
            end

            for check = 1, 2 do
                local seconds = readBoostTimer("Gold")

                if seconds == nil then
                    return false
                end

                if seconds > 3 then
                    rememberGoldActive(seconds)
                    return false
                end

                if check < 2 then
                    task.wait(0.05)
                end
            end

            goldDebug("inactive_confirmed", "INACTIVE CONFIRMED twice | purchase check allowed")
            return true
        end

        local function getBoostPrestige()
            -- Read the real current slot prestige from server data.
            local ok, data = pcall(function()
                return GET:InvokeServer("Data", "Copy")
            end)

            if ok and type(data) == "table" and type(data.Slots) == "table" then
                local slotName = data.Current_Slot
                    or Player:GetAttribute("Slot")
                    or "A"

                local slot = data.Slots[slotName]

                if slot
                    and slot.Progression
                    and type(slot.Progression.Prestige) == "number" then

                    return slot.Progression.Prestige
                end
            end

            -- Fallback if Data/Copy is temporarily unavailable.
            local attr = Player:GetAttribute("Prestige")
            if type(attr) == "number" then
                return attr
            end

            return nil
        end

        local function buyGoldBoost()
            -- Prestige 5+ should NEVER spend Gold on a new boost.
            -- Inventory boosts can still be used; this only blocks buying.
            local prestige = getBoostPrestige()
            if prestige and prestige >= 5 then
                goldDebug(
                    "prestige5_block",
                    string.format("PRESTIGE %d | buying disabled", prestige)
                )
                return nil, nil
            elseif prestige ~= nil then
                goldDebug(
                    "prestige_ok",
                    string.format("PRESTIGE %d | buying allowed if boost is inactive", prestige)
                )
            else
                goldDebug("prestige_unknown", "PRESTIGE UNKNOWN | checking boost safely")
            end

            if not isGoldConfirmedInactive() then
                return nil, nil
            end

            -- Extra purchase debounce in case a server/UI response is delayed.
            if tick() - goldRuntime.lastBuyAt < 4 then
                return nil, nil
            end

            local tier, id = getBestTier("Gold")
            if not tier or not id then
                return nil, nil
            end

            local itemName = BOOST_ITEMS.Gold[tier]

            goldRuntime.purchaseLockUntil = tick() + 2.0

            goldDebug(
                "buying",
                string.format("BUYING | %s | market id %s", tostring(itemName), tostring(id))
            )

            local ok, result = pcall(function()
                return GET:InvokeServer("S_Market", "Buy", "1_Boosts", id, 1)
            end)

            if not ok or result == false then
                goldRuntime.purchaseLockUntil = math.max(
                    goldRuntime.purchaseLockUntil,
                    tick() + 3
                )

                goldDebug(
                    "buy_failed",
                    string.format(
                        "BUY REMOTE FAILED | result=%s",
                        tostring(result)
                    )
                )

                return nil, nil
            end

            -- IMPORTANT:
            -- This market remote can return nil even when the request was
            -- accepted. pcall success + result ~= false means "request sent".
            -- We verify the purchase by trying to use the item and checking
            -- the REAL Gold timer afterwards.
            goldRuntime.lastBuyAt = tick()

            goldDebug(
                "buy_sent",
                string.format(
                    "BUY REQUEST SENT | %s | result=%s | verifying...",
                    tostring(itemName),
                    tostring(result)
                )
            )

            return itemName, tier
        end

        -- Try to activate ONE Gold potion from inventory.
        -- It will never intentionally stack 2-3 inventory boosts anymore.
        local function tryInventoryGoldOnce()
            if goldRuntime.inventoryChecked then
                return false
            end

            goldRuntime.inventoryChecked = true
            goldDebug("inventory_check", "CHECKING INVENTORY for an existing Gold boost")

            local active = getGoldActiveState()
            if active then
                return false
            end

            for _, tier in ipairs(TIER_PRIORITY) do
                local itemName = BOOST_ITEMS.Gold[tier]

                if itemName then
                    local used = useGoldBoost(itemName, tier, true)

                    if used then
                        goldDebug(
                            "inventory_used",
                            string.format("INVENTORY BOOST ACTIVATED | %s", tostring(itemName))
                        )
                        Library:Notify("[Boost] Gold boost activated from inventory", 2)
                        return true
                    end

                    task.wait(0.15)
                end
            end

            return false
        end

        local function runBoostCycle()
            boostState.cycles = boostState.cycles + 1

            if not boostState.selected.Gold then
                goldDebug("gold_disabled", "Gold toggle OFF")
                return
            end

            -- Real timer first. If active, do nothing.
            local active = getGoldActiveState()
            if active then
                return
            end

            -- ULTRA-FAST START:
            -- The old inventory sweep could spend several seconds testing
            -- 2h -> 1h -> 30m before it even reached the market purchase.
            -- For Auto Buy mode we go straight to the market as soon as the
            -- real Gold timer is confirmed OFF.
            goldRuntime.inventoryChecked = true

            local boughtName, tier = buyGoldBoost()

            if not boughtName then
                return
            end

            -- Market delivery is normally immediate. Only give it a tiny
            -- settle instead of the old 0.70 second wait.
            task.wait(0.08)

            -- First instant activation attempt.
            local activated = useGoldBoost(
                boughtName,
                tier,
                true,
                true
            )

            -- One quick retry catches a slightly delayed inventory delivery
            -- without buying a second boost.
            if not activated then
                task.wait(0.08)

                activated = useGoldBoost(
                    boughtName,
                    tier,
                    true,
                    true
                )
            end

            if activated then
                boostState.bought = boostState.bought + 1

                goldDebug(
                    "buy_use_confirmed",
                    string.format(
                        "FAST BOUGHT + ACTIVE | %s",
                        tostring(boughtName)
                    )
                )

                Library:Notify(
                    "[Boost] Gold boost ready",
                    2
                )
            else
                goldDebug(
                    "buy_use_unconfirmed",
                    string.format(
                        "FAST BUY SENT | %s | timer not ready yet",
                        tostring(boughtName)
                    )
                )

                -- Short delay only. The 1s main cycle will re-check the real
                -- timer quickly; duplicate-buy debounce still protects us.
                goldRuntime.purchaseLockUntil = math.max(
                    goldRuntime.purchaseLockUntil,
                    tick() + 1.25
                )
            end
        end

        local boostLoopRunning = false

        local function startBoostLoop()
            if boostLoopRunning then
                return
            end

            boostLoopRunning = true

            task.spawn(function()
                while boostState.enabled do
                    pcall(runBoostCycle)
                    task.wait(boostState.cycleDelay)
                end

                boostLoopRunning = false
            end)
        end

        BoostGroup:AddToggle("AutoBoost_Enable", {
            Text = "Auto Buy + Use Boosts",
            Default = false,
            Callback = function(v)
                boostState.enabled = v

                if v then
                    print("[GoldBoost] AUTO BOOST ENABLED")
                    lastGoldDebugState = nil

                    -- Clear stale local guesses. A real active timer will
                    -- immediately repopulate activeUntil on the next check.
                    goldRuntime.activeUntil = 0
                    goldRuntime.purchaseLockUntil = 0
                    goldRuntime.inventoryChecked = false

                    Library:Notify("Auto Boost enabled", 2)
                    startBoostLoop()
                else
                    print("[GoldBoost] AUTO BOOST DISABLED")
                    lastGoldDebugState = nil

                    goldRuntime.activeUntil = 0
                    goldRuntime.purchaseLockUntil = 0

                    Library:Notify("Auto Boost disabled", 2)
                end
            end
        })

        BoostGroup:AddSlider("AutoBoost_Delay", {
            Text = "Cycle Delay",
            Default = 1,
            Min = 1,
            Max = 10,
            Rounding = 0,
            Suffix = "s",
            Callback = function(v)
                boostState.cycleDelay = v
            end
        })

        BoostGroup:AddDivider()

        BoostGroup:AddToggle("AutoBoost_Gold", {
            Text = "Gold Boost",
            Default = true,
            Callback = function(v)
                boostState.selected.Gold = v
            end
        })

        BoostGroup:AddToggle("AutoBoost_Luck", {
            Text = "Luck Boost",
            Default = false,
            Callback = function(v)
                boostState.selected.Luck = v
            end
        })

        BoostGroup:AddToggle("AutoBoost_XP", {
            Text = "XP Boost",
            Default = false,
            Callback = function(v)
                boostState.selected.XP = v
            end
        })

        BoostGroup:AddDivider()

        BoostGroup:AddButton("Run One Cycle Now", function()
            task.spawn(runBoostCycle)
        end)

        BoostGroup:AddButton("Check Active Boosts", function()
            local msg = {}

            for _, boostType in ipairs({"Gold", "Luck", "XP"}) do
                local seconds

                if boostType == "Gold" then
                    local active, remaining = getGoldActiveState()
                    if active then
                        seconds = remaining
                    else
                        seconds = readBoostTimer(boostType)
                    end
                else
                    seconds = readBoostTimer(boostType)
                end

                if seconds == nil then
                    table.insert(msg, boostType .. ": unknown")
                elseif seconds > 0 then
                    local h = math.floor(seconds / 3600)
                    local m = math.floor((seconds % 3600) / 60)
                    local s = seconds % 60

                    table.insert(
                        msg,
                        string.format("%s: %02d:%02d:%02d", boostType, h, m, s)
                    )
                else
                    table.insert(msg, boostType .. ": off")
                end
            end

            Library:Notify(table.concat(msg, " | "), 5)
        end)

        BoostGroup:AddLabel("Gold FAST mode: direct buy + real timer verification")

        -- Load saved UI settings after controls exist.
        task.defer(function()
            task.wait(0.10)

            pcall(function()
                if SaveManager and SaveManager.LoadAutoloadConfig then
                    SaveManager:LoadAutoloadConfig()
                end
            end)

            task.wait(0.03)

            pcall(function()
                if Options and Options.AutoBoost_Enable then
                    boostState.enabled = Options.AutoBoost_Enable.Value

                    if boostState.enabled then
                        startBoostLoop()
                    end
                end

                if Options and Options.AutoBoost_Gold then
                    boostState.selected.Gold = Options.AutoBoost_Gold.Value
                end

                if Options and Options.AutoBoost_Luck then
                    boostState.selected.Luck = Options.AutoBoost_Luck.Value
                end

                if Options and Options.AutoBoost_XP then
                    boostState.selected.XP = Options.AutoBoost_XP.Value
                end

                if Options and Options.AutoBoost_Delay then
                    boostState.cycleDelay = Options.AutoBoost_Delay.Value
                end
            end)

            -- Seed the Gold cache immediately if a boost is already active.
            local seconds = readBoostTimer("Gold")
            if seconds ~= nil and seconds > 3 then
                rememberGoldActive(seconds)
            end
        end)
    end)
end


-- ============================================================
-- Auto Sell Cosmetics (Lobby Only)
-- ============================================================
if IsLobbyLobby() then
    task.spawn(function()
        while not Tabs.Session do task.wait(0.1) end
        task.wait(0.4)

        local SellGroup = Tabs.Session:AddRightGroupbox("Auto Sell Cosmetics")

        local GET = game:GetService("ReplicatedStorage")
            :WaitForChild("Assets")
            :WaitForChild("Remotes")
            :WaitForChild("GET")

        local Cosmetics = {
            -- Any Mission (Aberrant+)
            "Angel's Halo",

            -- Chapel
            "Altar Chains",
            "Hardened Shield",

            -- Shiganshina
            "Blood Vial",
            "Kitsune Mask",

            -- Trost
            "Recon Visor",
            "Shogun's Helm",

            -- Outskirts
            "Midnight Mask",
            "Grimmjow's Mask",

            -- Giant Forest
            "Mushroom Hat",
            "Warrior's Medallion",

            -- Utgard
            "Wizard Hat",
            "Kitsune Ribbon",

            -- Loading Docks
            "Regiment Cloak (Green)",
            "Regiment Cloak (Black)",

            -- Stohess
            "Bowler Hat (Black)",
            "Bowler Hat (White)"
        }

        local enabled = false
        local repeatCount = 3
        local sellDelay = 0.25

        local function SellCosmetic(name)
            pcall(function()
                GET:InvokeServer(
                    "S_Inventory",
                    "Sell",
                    name,
                    1
                )
            end)
        end

        task.spawn(function()
            while task.wait(0.5) do
                if enabled then
                    for _, name in ipairs(Cosmetics) do
                        for i = 1, repeatCount do
                            SellCosmetic(name)
                            task.wait(sellDelay)
                        end
                    end
                end
            end
        end)

        SellGroup:AddToggle("AutoSellCosmetics", {
            Text = "Auto Sell Cosmetics",
            Default = false,
            Callback = function(v)
                enabled = v
            end
        })

        SellGroup:AddSlider("AutoSellRepeat", {
            Text = "Repeat Count",
            Default = 3,
            Min = 1,
            Max = 10,
            Rounding = 0,
            Callback = function(v)
                repeatCount = v
            end
        })

        SellGroup:AddSlider("AutoSellDelay", {
            Text = "Sell Delay",
            Default = 0.25,
            Min = 0.05,
            Max = 2,
            Rounding = 2,
            Callback = function(v)
                sellDelay = v
            end
        })
    end)
end

-- ============================================================
-- Auto Delete Perks (Batch - One Remote)
-- ============================================================
if IsLobbyLobby() then
    task.spawn(function()
        while not Tabs.Session do task.wait(0.1) end
        task.wait(0.4)

        local PerkGroup = Tabs.Session:AddRightGroupbox("Auto Delete Perks")

        local PerkLists = {
            Legendary = {
                "Peerless Commander","Indefatigable","Tyrant's Stare","Invincible","Eviscerate",
                "Font of Vitality","Flame Rhapsody","Robust","Sixth Sense","Gear Master",
                "Carnifex","Munitions Master","Sanctified","Wind Rhapsody","Peerless Constitution",
                "Exhumation","Warchief","Peerless Focus","Perfect Form","Courage Catalyst",
                "Aegis","Unparalleled Strength","Perfect Soul"
            },

            Common = {
                "Cripple","Lucky","Enhanced Metabolism","First Aid","Mighty",
                "Fortitude","Hollow","Gear Beginner","Enduring"
            },

            Epic = {
                "Munitions Expert","Gear Expert","Butcher","Resilient","Speedy",
                "Reckless Abandon","Focus","Stalwart Durability","Adrenaline","Safeguard",
                "Warrior","Solo","Mutilate","Trauma Battery","Hardy",
                "Unbreakable","Siphoning","Flawed Release","Luminous","Peerless Strength"
            },

            Rare = {
                "Blessed","Gear Intermediate","Unyielding","Fully Stocked","Forceful",
                "Lightweight","Protection","Mangle","Experimental Shells","Critical Hunter",
                "Tough","Heightened Vitality"
            },

            Secret = {
                "Everlasting Flame","Heavenly Restriction","Adaptation","Maximum Firepower",
                "Soulfeed","Kengo","Black Flash","Font of Inspiration","Explosive Fortune",
                "Immortal","Art of War","Tatsujin","Founder's Blessing","Unwavering Belief"
            }
        }

        local NameToRarity = {}

        for rarity, list in pairs(PerkLists) do
            for _, name in ipairs(list) do
                NameToRarity[name] = rarity
                NameToRarity[string.lower(name)] = rarity
            end
        end

        local targetRarities = {
            Common = true,
            Rare = true,
            Epic = false,
            Legendary = true,
            Secret = false,
        }

        local deleteDelay = 0.15
        local autoEnabled = false
        local autoInterval = 20
        local isDeleting = false
        local maxPerBatch = 25

        -- =====================================================
        -- Resolve rarity
        -- =====================================================

        local function resolveRarity(perkName)
            if not perkName or perkName == "" then
                return "Common"
            end

            if NameToRarity[perkName] then
                return NameToRarity[perkName]
            end

            local lower = string.lower(perkName)

            if NameToRarity[lower] then
                return NameToRarity[lower]
            end

            return "Common"
        end

        -- =====================================================
        -- Collect All Perks
        --
        -- CHANGED:
        --
        -- OLD:
        -- OLD Talents route disabled because it can consume/roll Memory Scroll
        --
        -- NEW:
        -- GET:InvokeServer(
        --     "Functions",
        --     "Settings",
        --     "Music",
        --     25
        -- )
        -- =====================================================

        local function collectAllPerks()
            local found = {}
            local seen = {}

            local ok, data = pcall(function()
                return GET:InvokeServer(
                    "Functions",
                    "Settings",
                    "Music",
                    25
                )
            end)

            if ok and type(data) == "table" then

                local storage = data.Slots
                    and data.Slots.A
                    and data.Slots.A.Perks
                    and data.Slots.A.Perks.Storage

                if type(storage) == "table" then
                    for uid, info in pairs(storage) do

                        if type(uid) == "string"
                            and #uid > 20
                            and not seen[uid] then

                            local name = "Unknown"

                            if type(info) == "table" then
                                name =
                                    info.Name
                                    or info.Perk
                                    or info.Title
                                    or "Unknown"
                            end

                            seen[uid] = true

                            table.insert(found, {
                                id = uid,
                                name = tostring(name),
                                rarity = resolveRarity(
                                    tostring(name)
                                )
                            })
                        end
                    end
                end
            end

            return found
        end

        -- =====================================================
        -- Delete Batch
        -- =====================================================

        local function deleteBatch(ids)
            if #ids == 0 then
                return false
            end

            local ok = pcall(function()
                GET:InvokeServer(
                    "S_Equipment",
                    "Delete",
                    "Perk",
                    ids
                )
            end)

            return ok
        end

        -- =====================================================
        -- Run Delete
        -- =====================================================

        local function runDeletePerks(silent)
            if isDeleting then
                return
            end

            isDeleting = true

            local list = collectAllPerks()

            if #list == 0 then
                if not silent then
                    Library:Notify(
                        "No perks found",
                        3
                    )
                end

                isDeleting = false
                return
            end

            local toDelete = {}

            for _, entry in ipairs(list) do
                if targetRarities[
                    entry.rarity
                ] then

                    table.insert(
                        toDelete,
                        entry.id
                    )
                end
            end

            if #toDelete == 0 then
                if not silent then
                    Library:Notify(
                        "No matching rarities to delete",
                        3
                    )
                end

                isDeleting = false
                return
            end

            local deleted = 0

            -- =================================================
            -- Batch delete
            -- =================================================

            for i = 1, #toDelete, maxPerBatch do

                local batch = {}

                for j = i,
                    math.min(
                        i + maxPerBatch - 1,
                        #toDelete
                    ) do

                    table.insert(
                        batch,
                        toDelete[j]
                    )
                end

                if deleteBatch(batch) then

                    deleted =
                        deleted + #batch

                else

                    -- =========================================
                    -- Fallback single deletion
                    -- =========================================

                    for _, id in ipairs(batch) do

                        pcall(function()
                            GET:InvokeServer(
                                "S_Equipment",
                                "Delete",
                                "Perk",
                                {id}
                            )
                        end)

                        deleted =
                            deleted + 1

                        task.wait(0.12)
                    end
                end

                task.wait(deleteDelay)
            end

            if deleted > 0
                or not silent then

                Library:Notify(
                    string.format(
                        "Deleted %d perks (batch)",
                        deleted
                    ),
                    3
                )
            end

            isDeleting = false
        end

        -- =====================================================
        -- UI
        -- =====================================================

        PerkGroup:AddToggle(
            "PerkDel_Common",
            {
                Text = "Delete Common",
                Default = true,

                Callback = function(v)
                    targetRarities.Common = v
                end
            }
        )

        PerkGroup:AddToggle(
            "PerkDel_Rare",
            {
                Text = "Delete Rare",
                Default = true,

                Callback = function(v)
                    targetRarities.Rare = v
                end
            }
        )

        PerkGroup:AddToggle(
            "PerkDel_Epic",
            {
                Text = "Delete Epic",
                Default = false,

                Callback = function(v)
                    targetRarities.Epic = v
                end
            }
        )

        PerkGroup:AddToggle(
            "PerkDel_Legendary",
            {
                Text = "Delete Legendary",
                Default = true,

                Callback = function(v)
                    targetRarities.Legendary = v
                end
            }
        )

        PerkGroup:AddToggle(
            "PerkDel_Secret",
            {
                Text = "Delete Secret",
                Default = false,

                Callback = function(v)
                    targetRarities.Secret = v
                end
            }
        )

        PerkGroup:AddDivider()

        -- =====================================================
        -- Delete Delay
        -- =====================================================

        PerkGroup:AddSlider(
            "PerkDel_Delay",
            {
                Text = "Batch Delay",

                Default = 0.15,

                Min = 0.05,
                Max = 1,

                Rounding = 2,

                Suffix = "s",

                Callback = function(v)
                    deleteDelay = v
                end
            }
        )

        -- =====================================================
        -- Auto Interval
        -- =====================================================

        PerkGroup:AddSlider(
            "PerkDel_Interval",
            {
                Text = "Auto Interval",

                Default = 20,

                Min = 5,
                Max = 120,

                Rounding = 0,

                Suffix = "s",

                Callback = function(v)
                    autoInterval = v
                end
            }
        )

        -- =====================================================
        -- Auto Delete
        -- =====================================================

        PerkGroup:AddToggle(
            "PerkDel_Auto",
            {
                Text = "Auto Delete (Lobby)",

                Default = false,

                Callback = function(v)

                    autoEnabled = v

                    if v then

                        Library:Notify(
                            "Auto Delete Perks enabled",
                            2
                        )

                        task.spawn(function()

                            while autoEnabled do

                                pcall(function()
                                    runDeletePerks(true)
                                end)

                                local t = 0

                                while autoEnabled
                                    and t < autoInterval do

                                    task.wait(1)

                                    t = t + 1
                                end
                            end
                        end)

                    else

                        Library:Notify(
                            "Auto Delete Perks disabled",
                            2
                        )
                    end
                end
            }
        )

        -- =====================================================
        -- Delete Now
        -- =====================================================

        PerkGroup:AddButton(
            "Delete Now",

            function()

                task.spawn(function()
                    runDeletePerks(false)
                end)
            end
        )

        PerkGroup:AddLabel(
            "Uses Music remote for perk IDs"
        )
    end)
end
if IsMainmenuLobby() then
  
    if not getgenv().SpinState then
        getgenv().SpinState = {
            storedSpins = 0,
            hasRolled = false
        }
    end

    Tabs.Webhook = Window:AddTab("Family")

    local WebhookGroup = Tabs.Webhook:AddLeftGroupbox("Webhook")

    local function IsActuallyVisible(gui)
        if not gui or not gui:IsA("GuiObject") then
            return false
        end
        if not gui.Visible then
            return false
        end
        local current = gui.Parent
        while current do
            if current:IsA("GuiObject") then
                if not current.Visible then
                    return false
                end
            end
            if current:IsA("ScreenGui") then
                if not current.Enabled then
                    return false
                end
            end
            current = current.Parent
        end
        return true
    end

    local function isSlotAVisible()
        local targetGui = PlayerGui:FindFirstChild("Interface")
        if targetGui then
            targetGui = targetGui:FindFirstChild("Title_Screen")
            if targetGui then
                targetGui = targetGui:FindFirstChild("Slots")
                if targetGui then
                    targetGui = targetGui:FindFirstChild("A")
                    if targetGui then
                        return IsActuallyVisible(targetGui)
                    end
                end
            end
        end
        return false
    end

    local slotReady = false

    task.spawn(function()
        while true do
            slotReady = isSlotAVisible()
            task.wait(0.5)
        end
    end)

    local function getCurrentFamilyFromSlotA()
        local success, label = pcall(function()
            return PlayerGui.Interface.Title_Screen.Slots.A.Details.Label
        end)
        if success and label and label:IsA("TextLabel") and label.Visible then
            local text = label.Text
            local family = text:match("^([^,]+)")
            if family then
                return family:gsub("%s+$", "")
            end
        end
        return nil
    end

    local function GetFamilyRarity(familyName)
        if not familyName then return "Common" end
        local commonList = {"Reeves","Blouse","Inocenio","Munsell","Boyega","Ral","Bozado","Pikale","Hume","Iglehaut"}
        local rareList = {"Braus","Kruger","Azumabito","Smith","Grice","Springer","Kirstein"}
        local epicList = {"Galliard","Zoe","Leonhart","Tybur","Ksaver","Braun","Finger","Arlert"}
        local legendaryList = {"Yeager","Ackerman","Reiss"}
        local mythicList = {"Fritz","Helos"}
        for _, name in ipairs(commonList) do if familyName:find(name) then return "Common" end end
        for _, name in ipairs(rareList) do if familyName:find(name) then return "Rare" end end
        for _, name in ipairs(epicList) do if familyName:find(name) then return "Epic" end end
        for _, name in ipairs(legendaryList) do if familyName:find(name) then return "Legendary" end end
        for _, name in ipairs(mythicList) do if familyName:find(name) then return "Mythic" end end
        return "Common"
    end

    local function GetColorByRarity(rarity)
        if rarity == "Epic" then return 0x9b59b6
        elseif rarity == "Legendary" then return 0xf1c40f
        elseif rarity == "Mythic" then return 0xe74c3c
        elseif rarity == "Rare" then return 0x3498db
        else return 0x95a5a6 end
    end

    local function SendTargetWebhook(currentFamily, spinNumber)
        local webhookURL = getgenv().WebhookURL or webhookURL
        if webhookURL == "" then return false end
        if spinNumber == "?" or spinNumber == nil or tonumber(spinNumber) == nil then
            return false
        end

        local pingMode = getgenv().WebhookPingMode or pingMode
        local rarity = GetFamilyRarity(currentFamily)
        local color = GetColorByRarity(rarity)
        local content = nil
        if pingMode == "Everyone" then content = "@everyone"
        elseif pingMode == "Here" then content = "@here" end

        local player = game:GetService("Players").LocalPlayer
        local userName = player.Name

        local body = game:GetService("HttpService"):JSONEncode({
            content = content,
            embeds = {{
                title = "Family Found: " .. currentFamily,
                color = color,
                fields = {
                    { name = "━━━━━━━━━  PLAYER ━━━━━━━━━", value = "Username : @" .. userName, inline = false },
                    { name = "━━━━━━━━━  SPINS ━━━━━━━━━", value = "Spins: " .. spinNumber, inline = false }
                },
                footer = { text = "Rarity: " .. rarity },
                timestamp = DateTime.now():ToIsoDate()
            }}
        })

        local requestFunction = (syn and syn.request) or (http and http.request) or http_request or request
        if not requestFunction then return false end
        return pcall(function()
            requestFunction({ Url = webhookURL, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = body })
        end)
    end

    local function SendSpinFinishedWebhook()
        local webhookURL = getgenv().WebhookURL or webhookURL
        if webhookURL == "" then return false end

        local pingMode = getgenv().WebhookPingMode or pingMode
        local content = nil
        if pingMode == "Everyone" then content = "@everyone"
        elseif pingMode == "Here" then content = "@here" end

        local player = game:GetService("Players").LocalPlayer
        local userName = player.Name

        local body = game:GetService("HttpService"):JSONEncode({
            content = content,
            embeds = {{
                title = "Spin Finished",
                color = 0xFFFF00,
                fields = {
                    { name = "━━━━━━━━━  PLAYER ━━━━━━━━━", value = "Username : @" .. userName, inline = false },
                    { name = "━━━━━━━━━  STATUS ━━━━━━━━━", value = "No Spins Left", inline = false }
                },
                footer = { text = "Spin session ended" },
                timestamp = DateTime.now():ToIsoDate()
            }}
        })

        local requestFunction = (syn and syn.request) or (http and http.request) or http_request or request
        if not requestFunction then return false end
        return pcall(function()
            requestFunction({ Url = webhookURL, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = body })
        end)
    end

    local function SendSpinStopWebhook(spinsLeft)
        local webhookURL = getgenv().WebhookURL or webhookURL
        if webhookURL == "" then return false end

        local pingMode = getgenv().WebhookPingMode or pingMode
        local content = nil
        if pingMode == "Everyone" then content = "@everyone"
        elseif pingMode == "Here" then content = "@here" end

        local player = game:GetService("Players").LocalPlayer
        local userName = player.Name

        local body = game:GetService("HttpService"):JSONEncode({
            content = content,
            embeds = {{
                title = "Auto Spin Stopped",
                color = 0x00BFFF,
                fields = {
                    { name = "━━━━━━━━━  PLAYER ━━━━━━━━━", value = "Username : @" .. userName, inline = false },
                    { name = "━━━━━━━━━  SPINS LEFT ━━━━━━━━━", value = tostring(spinsLeft), inline = false },
                    { name = "━━━━━━━━━  STATUS ━━━━━━━━━", value = "Stopped by spin limit", inline = false }
                },
                footer = { text = "Spin limit reached" },
                timestamp = DateTime.now():ToIsoDate()
            }}
        })

        local requestFunction = (syn and syn.request) or (http and http.request) or http_request or request
        if not requestFunction then return false end
        return pcall(function()
            requestFunction({ Url = webhookURL, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = body })
        end)
    end

    local autoNotifyEnabled = false
    local lastSentFamily = nil
    local lastSentSpins = nil

    task.spawn(function()
        while true do
            task.wait(0.5)

            if not autoNotifyEnabled then
                lastSentFamily = nil
                lastSentSpins = nil
                continue
            end

            local targetFamilies = {}
            if Options and Options.AutoSpinFamilies then
                for name, enabled in pairs(Options.AutoSpinFamilies.Value or {}) do
                    if enabled and not string.match(name, "^%-%-%-") then
                        table.insert(targetFamilies, string.lower(name))
                    end
                end
            end
            if #targetFamilies == 0 then
                lastSentFamily = nil
                lastSentSpins = nil
                continue
            end

            local currentFamily = getCurrentFamilyFromSlotA()
            local spinState = getgenv().SpinState
            local currentSpins = (spinState and spinState.hasRolled) and tostring(spinState.storedSpins) or "?"

            if not currentFamily then
                lastSentFamily = nil
                lastSentSpins = nil
                continue
            end

            local lowerFamily = string.lower(currentFamily)
            local isTarget = false
            for _, target in ipairs(targetFamilies) do
                if string.find(lowerFamily, target) then
                    isTarget = true
                    break
                end
            end

            if isTarget then
                if (lastSentFamily ~= currentFamily or lastSentSpins ~= currentSpins) and currentSpins ~= "?" then
                    lastSentFamily = currentFamily
                    lastSentSpins = currentSpins
                    SendTargetWebhook(currentFamily, currentSpins)
                end
            else
                if lastSentFamily ~= nil then
                    lastSentFamily = nil
                    lastSentSpins = nil
                end
            end
        end
    end)

    local webhookURL = ""
    local pingMode = "None"

    WebhookGroup:AddInput("Webhook_URL", {
        Default = "", Numeric = false, Finished = true,
        Text = "Discord Webhook URL",
        Placeholder = "https://discord.com/api/webhooks/...",
        Callback = function(v) webhookURL = v; getgenv().WebhookURL = v end
    })

    WebhookGroup:AddDropdown("Webhook_PingMode", {
        Text = "Ping Mode",
        Values = {"None", "Everyone", "Here"},
        Default = "None",
        Multi = false,
        Callback = function(v) pingMode = v; getgenv().WebhookPingMode = v end
    })

    WebhookGroup:AddButton("Test Send", function()
        SendTargetWebhook("Test Family (JaMe)", "?")
    end)

    WebhookGroup:AddToggle("AutoNotifyToggle", {
        Text = "Auto Send Families to Discord",
        Default = false,
        Callback = function(v)
            autoNotifyEnabled = v
            if v then
                lastSentFamily = nil
                lastSentSpins = nil
            end
        end
    })

    local SpinGroup = Tabs.Webhook:AddRightGroupbox("Auto Spin")
    local StopSpinGroup = Tabs.Webhook:AddRightGroupbox("Stop at Spin Left")

    local selectedFamilies = {}
    local rollDelay = 0.01
    local autoActive = false
    local spinTask = nil
    local waitingForSlot = false
    local stopAtSpinLimitEnabled = false
    local stopAtSpinLimitValue = 0

    local player = game:GetService("Players").LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    local Event = game:GetService("ReplicatedStorage").Assets.Remotes.GET

    local function performRoll()
        local maxRetries = 3
        local retryDelay = 0.3
        
        for attempt = 1, maxRetries do
            local success, ret1, ret2, ret3, ret4, ret5 = pcall(function()
                return Event:InvokeServer("Family", "Roll")
            end)
            
            if success then
                local spinsLeft = 0
                local familyGot = nil
                
                if type(ret1) == "number" then
                    spinsLeft = ret1
                end
                if type(ret2) == "number" then
                    spinsLeft = spinsLeft + ret2
                end
                
                if type(ret3) == "string" and ret3 ~= "" then
                    familyGot = ret3
                else
                    for _, v in ipairs({ret1, ret2, ret3, ret4, ret5}) do
                        if type(v) == "string" and v ~= "" then
                            familyGot = v
                            break
                        end
                    end
                end
                
                if familyGot then
                    local spinState = getgenv().SpinState
                    if not spinState then
                        getgenv().SpinState = { storedSpins = 0, hasRolled = false }
                        spinState = getgenv().SpinState
                    end
                    spinState.storedSpins = spinsLeft
                    spinState.hasRolled = true
                    return spinsLeft, familyGot
                end
            end
            
            if attempt < maxRetries then
                task.wait(retryDelay)
            end
        end
        
        return 0, nil
    end

    local function getSlotLabel()
        local success, label = pcall(function()
            return playerGui.Interface.Title_Screen.Slots.A.Details.Label
        end)
        if success and label and label:IsA("TextLabel") then return label end
        return nil
    end

    local function getFamilyTitleLabel()
        local success, title = pcall(function()
            return playerGui.Interface.Customisation.Family.Family.Title
        end)
        if success and title and title:IsA("TextLabel") then return title end
        return nil
    end

    local function getCurrentFamilyFromUI()
        local slotLabel = getSlotLabel()
        if slotLabel and slotLabel.Visible then
            local text = slotLabel.Text
            local family = text:match("^([^,]+)")
            if family then return family:gsub("%s+$", "") end
        end
        local familyTitle = getFamilyTitleLabel()
        if familyTitle and familyTitle.Visible then
            local text = familyTitle.Text
            local family = text:match("^([^%(]+)")
            if family then return family:gsub("%s+$", "") end
        end
        return nil
    end

    local function updateUIFamily(newFamily)
        local slotLabel = getSlotLabel()
        if slotLabel then
            local oldText = slotLabel.Text
            local lv = oldText:match("Lv%.(%d+)")
            if lv then
                slotLabel.Text = string.format("%s, Lv.%s", newFamily, lv)
            else
                slotLabel.Text = newFamily
            end
        end
        local familyTitle = getFamilyTitleLabel()
        if familyTitle then
            familyTitle.Text = newFamily
        end
    end

    local function syncUIFamilies()
        local slotFamily = nil
        local slotLabel = getSlotLabel()
        if slotLabel and slotLabel.Visible then
            local text = slotLabel.Text
            slotFamily = text:match("^([^,]+)")
            if slotFamily then slotFamily = slotFamily:gsub("%s+$", "") end
        end
        local titleFamily = nil
        local familyTitle = getFamilyTitleLabel()
        if familyTitle and familyTitle.Visible then
            local text = familyTitle.Text
            titleFamily = text:match("^([^%(]+)")
            if titleFamily then titleFamily = titleFamily:gsub("%s+$", "") end
        end
        if slotFamily and titleFamily and slotFamily ~= titleFamily then
            updateUIFamily(slotFamily)
        end
    end

    local function isCurrentFamilyTarget()
        local currentFamily = getCurrentFamilyFromUI()
        if not currentFamily or #selectedFamilies == 0 then return false end
        local lower = string.lower(currentFamily)
        for _, target in ipairs(selectedFamilies) do
            if string.find(lower, string.lower(target)) then return true end
        end
        return false
    end

    local function FormatFamilyDisplay(rawFamily)
        if not rawFamily or rawFamily == "" then return "Unknown" end
        local baseName = rawFamily:match("^([^%(]+)") or rawFamily
        baseName = baseName:gsub("%s+$", "")
        baseName = baseName:gsub("[()]", "")
        local rarity = GetFamilyRarity(rawFamily)
        return string.format("%s (%s)", baseName, rarity)
    end

    local function isTargetFamily(name, targetList)
        if not name or #targetList == 0 then return false end
        local lower = string.lower(name)
        for _, t in ipairs(targetList) do
            if string.find(lower, string.lower(t)) then return true end
        end
        return false
    end

    local FAMILY_LIST = {
        "--- Common ---","Reeves","Blouse","Inocenio","Munsell","Boyega","Ral","Bozado","Pikale","Hume","Iglehaut",
        "--- Rare ---","Braus","Kruger","Azumabito","Smith","Grice","Springer","Kirstein",
        "--- Epic ---","Galliard","Zoe","Leonhart","Tybur","Ksaver","Braun","Finger","Arlert",
        "--- Legendary ---","Yeager","Ackerman","Reiss",
        "--- Mythic ---","Fritz","Helos",
    }
    local function isHeader(name) return string.sub(name, 1, 3) == "---" end

    local function startAutoSpin()
        if spinTask then return end
        spinTask = task.spawn(function()
            local notifiedSpinFinished = false
            local notifiedSpinStop = false
            while autoActive do
                if not slotReady then
                    if not waitingForSlot then
                        waitingForSlot = true
                        Library:Notify("Waiting for Title_Slot A to Start...", 2)
                    end
                    task.wait(1)
                    continue
                end
                waitingForSlot = false
                syncUIFamilies()
                if isCurrentFamilyTarget() then
                    local currentFamily = getCurrentFamilyFromUI()
                    local display = FormatFamilyDisplay(currentFamily)
                    Library:Notify(string.format("Already have target: %s! Stopping.", display), 5)
                    break
                end

                local spinsLeft, familyGot = performRoll()
                if familyGot then
                    local display = FormatFamilyDisplay(familyGot)
                    Library:Notify(string.format("Roll: %s | Spins left: %d", display, spinsLeft), 2)
                    updateUIFamily(familyGot)
                    
                    if spinsLeft == 0 and not notifiedSpinFinished then
                        notifiedSpinFinished = true
                        SendSpinFinishedWebhook()
                        Library:Notify("Spins finished! Webhook sent.", 3)
                        break
                    end
                    
                    if stopAtSpinLimitEnabled and stopAtSpinLimitValue > 0 and spinsLeft <= stopAtSpinLimitValue and not notifiedSpinStop then
                        notifiedSpinStop = true
                        SendSpinStopWebhook(spinsLeft)
                        Library:Notify(string.format("Stopped at Spins left: %d", spinsLeft), 3)
                        break
                    end
                    
                    if isTargetFamily(familyGot, selectedFamilies) then
                        Library:Notify(string.format("Found! %s | Spins left: %d", display, spinsLeft), 10)
                        break
                    end
                else
                    task.wait(0.1)
                    continue
                end
                if spinsLeft == 0 then break end
                task.wait(rollDelay)
            end
            if Options and Options.AutoSpinToggle then
                Options.AutoSpinToggle:SetValue(false)
            end
            autoActive = false
            spinTask = nil
            waitingForSlot = false
        end)
    end

    SpinGroup:AddLabel("Slot A (only)")
    SpinGroup:AddDivider()

    SpinGroup:AddButton("Check Current Family", function()
        syncUIFamilies()
        local family = getCurrentFamilyFromUI() or "Unknown"
        local spinState = getgenv().SpinState
        local spinsText = (spinState and spinState.hasRolled) and tostring(spinState.storedSpins) or "??"
        Library:Notify(string.format("Slot A | Family: %s | Spins left: %s", family, spinsText), 3)
    end)

    SpinGroup:AddDivider()
    SpinGroup:AddDropdown("AutoSpinFamilies", {
        Text = "Select Target Families",
        Values = FAMILY_LIST,
        Multi = true,
        Default = {},
        Callback = function(v)
            selectedFamilies = {}
            for k, val in pairs(v) do
                if val and not isHeader(k) then table.insert(selectedFamilies, k) end
            end
        end
    })
    SpinGroup:AddDivider()
    SpinGroup:AddSlider("AutoSpinDelaySlider", {
        Text = "Roll Delay",
        Default = 0.01,
        Min = 0.001,
        Max = 1,
        Rounding = 3,
        Suffix = "s",
        Callback = function(v) rollDelay = v end
    })

    SpinGroup:AddToggle("AutoSpinToggle", {
        Text = "Auto Spin",
        Default = false,
        Callback = function(v)
            if v then
                if #selectedFamilies == 0 then
                    task.wait(0.5)
                    if #selectedFamilies == 0 and Options and Options.AutoSpinFamilies and Options.AutoSpinFamilies.Value then
                        local temp = {}
                        for k, val in pairs(Options.AutoSpinFamilies.Value) do
                            if val and not isHeader(k) then
                                table.insert(temp, k)
                            end
                        end
                        if #temp > 0 then
                            selectedFamilies = temp
                        end
                    end
                end

                if #selectedFamilies == 0 then
                    Library:Notify("Please select target families first!", 3)
                    Options.AutoSpinToggle:SetValue(false)
                    return
                end

                local spinState = getgenv().SpinState
                if stopAtSpinLimitEnabled and stopAtSpinLimitValue > 0 and spinState and spinState.hasRolled and spinState.storedSpins <= stopAtSpinLimitValue then
                    Library:Notify("Cannot Roll: spins already limit", 3)
                    Options.AutoSpinToggle:SetValue(false)
                    return
                end

                autoActive = true
                startAutoSpin()
            else
                autoActive = false
                if spinTask then task.cancel(spinTask); spinTask = nil end
                waitingForSlot = false
            end
        end
    })

    StopSpinGroup:AddToggle("StopAtSpinLimitToggle", {
        Text = "Enable Stop at Spin Left",
        Default = false,
        Callback = function(v)
            stopAtSpinLimitEnabled = v
        end
    })

    StopSpinGroup:AddInput("StopAtSpinLimitInput", {
        Text = "Stop when spins < Left",
        Default = "0",
        Numeric = true,
        Finished = true,
        Placeholder = "0 - 100000",
        Callback = function(v)
            local num = tonumber(v)
            if num then
                stopAtSpinLimitValue = math.clamp(num, 0, 100000)
            else
                stopAtSpinLimitValue = 0
            end
        end
    })

    if Options and Options.AutoSpinFamilies and Options.AutoSpinFamilies.Value then
        selectedFamilies = {}
        for k, val in pairs(Options.AutoSpinFamilies.Value) do
            if val and not isHeader(k) then
                table.insert(selectedFamilies, k)
            end
        end
    end

    task.spawn(function()
        repeat task.wait(0.1) until Window and Window.Holder
        repeat task.wait(0.1) until Options and Options.AutoSpinFamilies
        task.wait(0.5)

        if Options.AutoSpinToggle and Options.AutoSpinToggle.Value then
            local hasTarget = (#selectedFamilies > 0)
            if not hasTarget and Options.AutoSpinFamilies and Options.AutoSpinFamilies.Value then
                for k, v in pairs(Options.AutoSpinFamilies.Value) do
                    if v and not string.match(k, "^%-%-%-") then
                        hasTarget = true
                        break
                    end
                end
            end

            if not hasTarget then
                Options.AutoSpinToggle:SetValue(false)
                Library:Notify("Auto Spin disabled: No target families selected", 3)
            else
                Options.AutoSpinToggle:SetValue(true)
            end
        end

        if Options.AutoNotifyToggle and Options.AutoNotifyToggle.Value then
            Options.AutoNotifyToggle:SetValue(true)
        end
    end)
end

if IsMainmenuLobby() then
    while not Tabs.Webhook do task.wait(0.1) end

    local PopupGroup = Tabs.Webhook:AddLeftGroupbox("Show Family")
    local popupEnabled = false
    local popupGui = nil
    local updateConnection = nil
    local glowConnection = nil
    local rainbowConnection = nil
    local currentScale = 1.0
    local rainbowActive = false

    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local RunService = game:GetService("RunService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local GET = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("GET")

    local function getSlotAFamily()
        local success, label = pcall(function()
            return PlayerGui.Interface.Title_Screen.Slots.A.Details.Label
        end)
        if success and label and label:IsA("TextLabel") and label.Visible then
            local text = label.Text
            local family = text:match("^([^,]+)")
            if family then
                return family:gsub("%s+$", "")
            end
        end
        return nil
    end

    local function GetRarity(familyName)
        if not familyName then return "Common" end
        local commonList = {"Reeves","Blouse","Inocenio","Munsell","Boyega","Ral","Bozado","Pikale","Hume","Iglehaut"}
        local rareList = {"Braus","Kruger","Azumabito","Smith","Grice","Springer","Kirstein"}
        local epicList = {"Galliard","Zoe","Leonhart","Tybur","Ksaver","Braun","Finger","Arlert"}
        local legendaryList = {"Yeager","Ackerman","Reiss"}
        local mythicList = {"Fritz","Helos"}
        for _, name in ipairs(commonList) do if familyName:find(name) then return "Common" end end
        for _, name in ipairs(rareList) do if familyName:find(name) then return "Rare" end end
        for _, name in ipairs(epicList) do if familyName:find(name) then return "Epic" end end
        for _, name in ipairs(legendaryList) do if familyName:find(name) then return "Legendary" end end
        for _, name in ipairs(mythicList) do if familyName:find(name) then return "Mythic" end end
        return "Common"
    end

    local function GetBaseColor(rarity)
        if rarity == "Common" then return Color3.fromHex("#C0C0C0")
        elseif rarity == "Rare" then return Color3.fromHex("#00E5FF")
        elseif rarity == "Epic" then return Color3.fromHex("#CC33FF")
        elseif rarity == "Legendary" then return Color3.fromHex("#FFD700")
        elseif rarity == "Mythic" then return Color3.fromHex("#FF3366")
        else return Color3.fromHex("#FFFFFF") end
    end

    local function GetRainbowColor(offset)
        local hue = (offset % 1) * 360
        local r, g, b = Color3.fromHSV(hue / 360, 1.0, 1.0)
        return Color3.new(r, g, b)
    end

    local function StartRainbowBorder(innerBorder, outerGlow)
        if rainbowConnection then rainbowConnection:Disconnect() end
        rainbowActive = true
        local startTime = tick()
        local cycleDuration = 20
        rainbowConnection = RunService.RenderStepped:Connect(function()
            if not popupEnabled or not popupGui or not innerBorder or not outerGlow then return end
            local elapsed = (tick() - startTime) / cycleDuration
            local hue = elapsed % 1
            local color = GetRainbowColor(hue)
            innerBorder.Color = color
            outerGlow.Color = color
            innerBorder.Thickness = 3
            outerGlow.Thickness = 6
            outerGlow.Transparency = 0.3
        end)
    end

    local function StopRainbowBorder()
        if rainbowConnection then
            rainbowConnection:Disconnect()
            rainbowConnection = nil
        end
        rainbowActive = false
    end

    local function getBrightColor(baseColor)
        return Color3.new(
            math.min(baseColor.R + 0.35, 1),
            math.min(baseColor.G + 0.35, 1),
            math.min(baseColor.B + 0.35, 1)
        )
    end

    local function GetTotalSpins()
        local spinState = getgenv().SpinState
        if spinState and spinState.hasRolled then
            return tostring(spinState.storedSpins)
        else
            return "?"
        end
    end

    local function UpdateUIScale()
        if popupGui then
            local scaleObj = popupGui:FindFirstChild("UIScale")
            if scaleObj then scaleObj.Scale = currentScale end
        end
    end

    local function StartSmoothPulse(innerBorder, outerGlow, baseColor)
        if glowConnection then glowConnection:Disconnect() end
        local brightColor = getBrightColor(baseColor)
        local time = 0
        local pulseSpeed = 1.2
        glowConnection = RunService.RenderStepped:Connect(function(deltaTime)
            if not popupEnabled or not popupGui then return end
            local spins = GetTotalSpins()
            if spins == "0" then return end
            time = time + deltaTime * pulseSpeed
            local intensity = (math.sin(time) + 1) / 2
            local currentColor = Color3.new(
                baseColor.R + (brightColor.R - baseColor.R) * intensity,
                baseColor.G + (brightColor.G - baseColor.G) * intensity,
                baseColor.B + (brightColor.B - baseColor.B) * intensity
            )
            local thickness = 2 + intensity * 1.5
            local glowThickness = 5 + intensity * 3
            local glowTransparency = 0.55 - intensity * 0.25
            innerBorder.Color = currentColor
            outerGlow.Color = currentColor
            outerGlow.Thickness = glowThickness
            outerGlow.Transparency = glowTransparency
            innerBorder.Thickness = thickness
        end)
    end

    local function CreatePopupUI()
        if popupGui then popupGui:Destroy() end
        if glowConnection then glowConnection:Disconnect() end
        if rainbowConnection then rainbowConnection:Disconnect() end
        rainbowActive = false

        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "TownShipRealTimePopup"
        screenGui.ResetOnSpawn = false
        screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
        screenGui.DisplayOrder = 999
        screenGui.IgnoreGuiInset = true
        screenGui.Parent = LocalPlayer.PlayerGui
        popupGui = screenGui

        local uiScale = Instance.new("UIScale")
        uiScale.Scale = currentScale
        uiScale.Parent = screenGui

        local mainFrame = Instance.new("Frame")
        mainFrame.Size = UDim2.new(0, 300, 0, 130)
        mainFrame.Position = UDim2.new(0.5, -150, 0.5, -65)
        mainFrame.BackgroundColor3 = Color3.fromHex("#050505")
        mainFrame.BackgroundTransparency = 0.08
        mainFrame.BorderSizePixel = 0
        mainFrame.ClipsDescendants = true
        mainFrame.Parent = screenGui

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 14)
        corner.Parent = mainFrame

        local innerBorder = Instance.new("UIStroke")
        innerBorder.Thickness = 2.5
        innerBorder.Transparency = 0.1
        innerBorder.LineJoinMode = Enum.LineJoinMode.Round
        innerBorder.Parent = mainFrame

        local outerGlow = Instance.new("UIStroke")
        outerGlow.Thickness = 5
        outerGlow.Transparency = 0.55
        outerGlow.LineJoinMode = Enum.LineJoinMode.Round
        outerGlow.Parent = mainFrame

        local closeBtn = Instance.new("TextButton")
        closeBtn.Size = UDim2.new(0, 26, 0, 26)
        closeBtn.Position = UDim2.new(1, -34, 0, 6)
        closeBtn.BackgroundTransparency = 0.3
        closeBtn.Text = "X"
        closeBtn.TextColor3 = Color3.new(1,1,1)
        closeBtn.Font = Enum.Font.GothamBold
        closeBtn.TextSize = 14
        closeBtn.Parent = mainFrame
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 13)
        btnCorner.Parent = closeBtn
        
        closeBtn.MouseEnter:Connect(function()
            closeBtn.BackgroundTransparency = 0.1
        end)
        closeBtn.MouseLeave:Connect(function()
            closeBtn.BackgroundTransparency = 0.3
        end)
        closeBtn.MouseButton1Click:Connect(function()
            if popupGui then popupGui:Destroy() end
            if glowConnection then glowConnection:Disconnect() end
            if rainbowConnection then rainbowConnection:Disconnect() end
            if Options and Options.PopupRealTimeToggle then
                Options.PopupRealTimeToggle:SetValue(false)
            end
        end)

        local titleLabel = Instance.new("TextLabel")
        titleLabel.Size = UDim2.new(1, -40, 0, 24)
        titleLabel.Position = UDim2.new(0, 12, 0, 6)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = "CURRENT FAMILY"
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 12
        titleLabel.TextColor3 = Color3.new(1,1,1)
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.Parent = mainFrame

        local familyLabel = Instance.new("TextLabel")
        familyLabel.Size = UDim2.new(1, -50, 0, 46)
        familyLabel.Position = UDim2.new(0, 12, 0, 32)
        familyLabel.BackgroundTransparency = 1
        familyLabel.Text = "Loading..."
        familyLabel.Font = Enum.Font.GothamBlack
        familyLabel.TextSize = 24
        familyLabel.TextColor3 = Color3.new(1,1,1)
        familyLabel.TextXAlignment = Enum.TextXAlignment.Left
        familyLabel.TextScaled = true
        familyLabel.TextWrapped = true
        familyLabel.Parent = mainFrame

        local spinLabel = Instance.new("TextLabel")
        spinLabel.Size = UDim2.new(1, -40, 0, 18)
        spinLabel.Position = UDim2.new(0, 12, 0, 86)
        spinLabel.BackgroundTransparency = 1
        spinLabel.Text = "Total Spins: ?"
        spinLabel.Font = Enum.Font.GothamBold
        spinLabel.TextSize = 14
        spinLabel.TextColor3 = Color3.fromHex("#AAAAAA")
        spinLabel.TextXAlignment = Enum.TextXAlignment.Left
        spinLabel.Parent = mainFrame

        local footerLabel = Instance.new("TextLabel")
        footerLabel.Size = UDim2.new(1, -40, 0, 14)
        footerLabel.Position = UDim2.new(0, 12, 0, 110)
        footerLabel.BackgroundTransparency = 1
        footerLabel.Text = "TownShip"
        footerLabel.Font = Enum.Font.GothamMedium
        footerLabel.TextSize = 9
        footerLabel.TextColor3 = Color3.fromHex("#888888")
        footerLabel.TextXAlignment = Enum.TextXAlignment.Left
        footerLabel.Parent = mainFrame

        local currentRarity = nil
        local currentBaseColor = nil

        local function UpdateDisplay()
            if not popupGui or not popupEnabled then return end

            local family = getSlotAFamily() or "Unknown"
            local rarity = GetRarity(family)
            local baseColor = GetBaseColor(rarity)
            local spins = GetTotalSpins()

            familyLabel.Text = family
            familyLabel.TextColor3 = baseColor
            titleLabel.TextColor3 = baseColor
            closeBtn.BackgroundColor3 = baseColor
            closeBtn.TextColor3 = (rarity == "Legendary" or rarity == "Mythic") and Color3.fromHex("#111111") or Color3.new(1,1,1)

            if spins == "0" then
                spinLabel.Text = "No Spins Left"
                spinLabel.TextColor3 = Color3.fromHex("#FF6B6B")
                spinLabel.TextSize = 16
                if not rainbowActive then
                    StartRainbowBorder(innerBorder, outerGlow)
                end
                innerBorder.Thickness = 3
                outerGlow.Thickness = 6
            else
                spinLabel.Text = "Total Spins: " .. spins
                spinLabel.TextColor3 = Color3.fromHex("#AAAAAA")
                spinLabel.TextSize = 14
                if rainbowActive then
                    StopRainbowBorder()
                    innerBorder.Color = baseColor
                    outerGlow.Color = baseColor
                    innerBorder.Thickness = 2.5
                    outerGlow.Thickness = 5
                    outerGlow.Transparency = 0.55
                end
            end

            if spins ~= "0" then
                if currentRarity ~= rarity then
                    currentRarity = rarity
                    currentBaseColor = baseColor
                    StartSmoothPulse(innerBorder, outerGlow, baseColor)
                end
            else
                if glowConnection then
                    glowConnection:Disconnect()
                    glowConnection = nil
                end
            end
        end

        if updateConnection then updateConnection:Disconnect() end

        local popupAccumulator = 0
        updateConnection = RunService.Heartbeat:Connect(function(dt)
            if not popupEnabled or not popupGui then return end

            popupAccumulator = popupAccumulator + dt
            if popupAccumulator < 0.10 then return end
            popupAccumulator = 0

            UpdateDisplay()
        end)

        UpdateDisplay()
    end

    PopupGroup:AddSlider("PopupUIScale", {
        Text = "UI Scale (%)",
        Default = 100,
        Min = 10,
        Max = 200,
        Rounding = 0,
        Suffix = "%",
        Callback = function(v)
            currentScale = v / 100
            UpdateUIScale()
        end
    })

    PopupGroup:AddToggle("PopupRealTimeToggle", {
        Text = "Show Family",
        Default = false,
        Callback = function(v)
            popupEnabled = v
            if v then
                CreatePopupUI()
            else
                if updateConnection then updateConnection:Disconnect() end
                if glowConnection then glowConnection:Disconnect() end
                if rainbowConnection then rainbowConnection:Disconnect() end
                if popupGui then popupGui:Destroy() end
            end
        end
    })

    PopupGroup:AddButton("Deposit Family", function()
        local currentFamily = getSlotAFamily()
        if not currentFamily then
            Library:Notify("No family detected to deposit.", 3)
            return
        end

        local success, result, depositedFamily, newFamily = pcall(function()
            return GET:InvokeServer("Family", "Store")
        end)

        if success and result == true then
            local deposited = depositedFamily or "Unknown"
            local received = newFamily or "Unknown"
            local label = PlayerGui.Interface.Title_Screen.Slots.A.Details.Label
            if label and label:IsA("TextLabel") then
                label.Text = received
            end
            Library:Notify("Deposit successful! You deposited " .. deposited .. " and received " .. received, 5)
        else
            Library:Notify("Deposit failed! " .. currentFamily .. " could not be deposited", 3)
        end
    end)
end







if IsLobbyLobby() then
    task.defer(function()
        local Players = game:GetService("Players")
        local Player = Players.LocalPlayer
        local POST = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("POST")
        
        local file1, file2 = "TownShip/saved_players.txt", "TownShip/saved_players_2.txt"

        local function loadList(f) 
            local t={} 
            if isfile(f) then 
                for n in string.gmatch(readfile(f),"[^\r\n]+") do 
                    n=n:gsub("^%s+",""):gsub("%s+$","") 
                    if n~="" then table.insert(t,n) end 
                end 
            end 
            return t 
        end
        local function saveList(f,t) writefile(f,table.concat(t,"\n")) end
        local function addName(f,n) 
            n=n:gsub("^%s+",""):gsub("%s+$","") 
            if n=="" then return false end 
            local t=loadList(f) 
            for _,v in ipairs(t) do if v:lower()==n:lower() then return false end end 
            table.insert(t,n) 
            saveList(f,t) 
            return true 
        end
        local function addMulti(f,s) 
            local a=0 
            for n in string.gmatch(s,"[^,;\r\n%s]+") do if addName(f,n) then a=a+1 end end 
            return a,0 
        end
        local function removeName(f,n) 
            local t=loadList(f) 
            local r={} 
            for _,v in ipairs(t) do if v~=n then table.insert(r,v) end end 
            saveList(f,r) 
        end
        local function toList(v) 
            local r={} 
            if type(v)=="table" then for k,e in pairs(v) do if e then table.insert(r,k) end end end 
            return r 
        end
        local function inGame(n) 
            if n:lower()==Player.Name:lower() then return false end 
            for _,p in ipairs(Players:GetPlayers()) do if p~=Player and p.Name:lower()==n:lower() then return true end end 
            return false 
        end
        local function filterOnline(l) 
            local o={} 
            for _,n in ipairs(l) do if n~="No Players" and n:lower()~=Player.Name:lower() and inGame(n) then table.insert(o,n) end end 
            return o 
        end
        local function selectAllFromFile(file) 
            local all=loadList(file) 
            local new={} 
            for _,n in ipairs(all) do new[n]=true end 
            return new 
        end
        
        local function isTradeOpen() 
            local success, result = pcall(function() 
                return Player.PlayerGui.Interface.Trading.Prompt.Visible 
            end)
            return success and result or false
        end
        
        local sendCooldown, acceptCooldown = {}, {}
        local lastSend, lastAccept = 0, 0
        
        local trackedPlayers = {}
        
        local function clearCooldownForPlayer(name) 
            sendCooldown[name]=nil
            acceptCooldown[name]=nil 
        end
        
        task.spawn(function()
            while true do
                task.wait(2)
                pcall(function()
                    local currentPlayers = {}
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= Player then
                            currentPlayers[p.Name] = true
                            if not trackedPlayers[p.Name] then
                                trackedPlayers[p.Name] = true
                                clearCooldownForPlayer(p.Name)
                            end
                        end
                    end
                    for name in pairs(trackedPlayers) do
                        if not currentPlayers[name] then
                            trackedPlayers[name] = nil
                        end
                    end
                end)
            end
        end)
        
        local function sendTrade(n)
            if n:lower()==Player.Name:lower() or not inGame(n) then return end
            local now=tick()
            if sendCooldown[n] and now-sendCooldown[n]<1.5 then return end
            if now-lastSend<0.35 then return end
            lastSend, sendCooldown[n] = now, now
            
            local args = {"Invites", "Invite", n}
            pcall(function()
                POST:FireServer(unpack(args))
            end)
        end
        
        local function acceptTrade(n)
            if n:lower()==Player.Name:lower() or not inGame(n) then return end
            local now=tick()
            if acceptCooldown[n] and now-acceptCooldown[n]<1 then return end
            if now-lastAccept<0.25 then return end
            lastAccept, acceptCooldown[n] = now, now
            
            local args = {"Invites", "State", n, "Accept"}
            pcall(function()
                POST:FireServer(unpack(args))
            end)
        end
        
        local function buildSendLoop(getCache)
            return function(toggleRef)
                task.spawn(function()
                    while toggleRef.Enabled do
                        if isTradeOpen() then task.wait(0.3); continue end
                        local targets = filterOnline(toList(getCache()))
                        for _, n in ipairs(targets) do
                            if not toggleRef.Enabled then break end
                            if isTradeOpen() then break end
                            sendTrade(n)
                            task.wait(0.12)
                        end
                        task.wait(0.15)
                    end
                end)
            end
        end

        local function buildAcceptLoop(getCache)
            return function(toggleRef)
                task.spawn(function()
                    while toggleRef.Enabled do
                        if isTradeOpen() then task.wait(0.3); continue end
                        local targets = filterOnline(toList(getCache()))
                        for _, n in ipairs(targets) do
                            if not toggleRef.Enabled then break end
                            if isTradeOpen() then break end
                            acceptTrade(n)
                            task.wait(0.08)
                        end
                        task.wait(0.2)
                    end
                end)
            end
        end
        
        local function addToggles(box, cacheName, getCache)
            local sendToggle = { Enabled = false }
            local acceptToggle = { Enabled = false }
            
            box:AddToggle(cacheName.."_Send", {
                Text = "Send Trade", 
                Default = false, 
                Callback = function(v) 
                    sendToggle.Enabled = v
                    if v then buildSendLoop(getCache)(sendToggle) end 
                end
            })
            box:AddToggle(cacheName.."_Accept", {
                Text = "Auto Accept", 
                Default = false, 
                Callback = function(v) 
                    acceptToggle.Enabled = v
                    if v then buildAcceptLoop(getCache)(acceptToggle) end 
                end
            })
        end
        
        local function buildSavedBox(title, file, cacheName)
            local State = { Cache = {} }
            local box = Tabs.Trade:AddLeftGroupbox(title)
            local dd = box:AddDropdown(cacheName.."_Dropdown", {
                Text = "Players", 
                Values = loadList(file), 
                Multi = true, 
                Default = {}, 
                Callback = function(v) State.Cache = v end
            })
            box:AddInput(cacheName.."_Input", {
                Text = "Add Users", 
                Placeholder = "name1, name2", 
                Default = "", 
                Callback = function(v) State.Input = v end
            })
            box:AddButton("Save", function()
                local txt = State.Input or ""
                if txt ~= "" then
                    addMulti(file, txt)
                    dd:SetValues(loadList(file))
                    pcall(function() 
                        if Options and Options[cacheName.."_Input"] then 
                            Options[cacheName.."_Input"]:SetValue("") 
                        end 
                    end)
                    State.Input = ""
                end
            end)
            box:AddButton("Remove", function() 
                for _, n in ipairs(toList(State.Cache)) do 
                    removeName(file, n) 
                end 
                dd:SetValues(loadList(file)) 
            end)
            box:AddButton("Select All", function() 
                local all = selectAllFromFile(file) 
                dd:SetValue(all)
                State.Cache = all 
            end)
            box:AddButton("Deselect All", function() 
                dd:SetValue({})
                State.Cache = {} 
            end)
            box:AddButton("Refresh", function() 
                dd:SetValues(loadList(file)) 
            end)
            addToggles(box, cacheName, function() return State.Cache end)
        end
        
        local currentState = { Cache = nil }
        local g1 = Tabs.Trade:AddLeftGroupbox("Current Players")
        local cd = g1:AddDropdown("Trade_CurrentDropdown", {
            Text = "Online", 
            Values = {"No Players"}, 
            Multi = true, 
            Default = {}, 
            Callback = function(v) currentState.Cache = v end
        })
        
        g1:AddButton("Select All Online", function()
            local allOnline = {}
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= Player then allOnline[p.Name] = true end
            end
            cd:SetValue(allOnline)
            currentState.Cache = allOnline
        end)
        
        g1:AddButton("Deselect All", function()
            cd:SetValue({})
            currentState.Cache = {}
        end)
        
        addToggles(g1, "Trade_Current", function() return currentState.Cache end)
        
        buildSavedBox("Account 1", file1, "Trade_Acc1")
        buildSavedBox("Account 2", file2, "Trade_Acc2")
        
        task.spawn(function()
            while true do
                task.wait(1.5)
                pcall(function()
                    local onlineList = {}
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= Player then table.insert(onlineList, p.Name) end
                    end
                    cd:SetValues(#onlineList > 0 and onlineList or {"No Players"})
                end)
            end
        end)
    end)
end


if IsLobbyLobby() then
    local SettingBox = Tabs.Trade:AddLeftGroupbox("Setting Trading")
    
    local selectedOption = "On"
    
    local function setHistory(state)
        local args = {"Functions", "Settings", "History", state}
        return pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("Assets")
                :WaitForChild("Remotes"):WaitForChild("GET")
                :InvokeServer(unpack(args))
        end)
    end
    
    SettingBox:AddDropdown("HistoryOptionDropdown", {
        Text = "",
        Values = {"On", "Off"},
        Default = "On",
        Multi = false,
        Callback = function(v)
            selectedOption = v
        end
    })
    
    SettingBox:AddToggle("ApplyHistoryToggle", {
        Text = "Apply History",
        Default = false,
        Callback = function(v)
            if v then
                local success = setHistory(selectedOption)
                task.wait(0.1)
                pcall(function()
                    if Options and Options.ApplyHistoryToggle then
                        Options.ApplyHistoryToggle:SetValue(false)
                    end
                end)
            end
        end
    })
end


if IsLobbyLobby() then
    task.spawn(function()
        while not Tabs.Trade do task.wait(0.1) end

        local Alt2Box = Tabs.Trade:AddRightGroupbox("Auto Trade : Manual")

        local Alt2Enabled = false
        local Alt2Running = false
        local SelectAmount = 1
        local isWaitingForConfirm = false
        local pendingTargetChange = false
        local newTargetValue = 1

        local ClickInterval = 0.015
        local MainLoopDelay = 0.001
        local AddPanelOpenDelay = 0.08
        local CheckWait = 0.001
        local ReduceWait = 0.001
        local AddWait = 0
        local UIUpdateDelay = 0.03

        local Players = game:GetService("Players")
        local VIM = game:GetService("VirtualInputManager")
        local GS = game:GetService("GuiService")
        local player = Players.LocalPlayer
        local RunService = game:GetService("RunService")

        local lastHideNotifyTime = 0

        local autoDisableEnabled = false
        local autoDisableThreshold = 0

        local itemMapping = {
            ["Memory Scroll"] = "600_Memory Scroll",
            ["Emperor's Key"] = "500_Emperor's Key",
        }
        local SelectedItems = {"Memory Scroll"}

        local acceptTradeEnabled = false

        local autoTradeToggleRef = nil
        local acceptTradeToggleRef = nil

        local function isGuiAlive(obj)
            if not obj then return false end
            if typeof(obj) ~= "Instance" then return false end
            if not obj.Parent then return false end

            local ok = pcall(function() return obj.AbsoluteSize end)
            if not ok then return false end

            if obj:IsA("GuiObject") then
                if obj.AbsoluteSize.X <= 0 or obj.AbsoluteSize.Y <= 0 then
                    return false
                end
            end

            local current = obj
            while current do
                if current:IsA("GuiObject") and not current.Visible then
                    return false
                end
                if current:IsA("ScreenGui") and not current.Enabled then
                    return false
                end
                current = current.Parent
            end

            return true
        end

        local function clickWithMouse(target)
            if not isGuiAlive(target) then
                return false
            end

            local inset = GS:GetGuiInset()
            local x = target.AbsolutePosition.X + (target.AbsoluteSize.X / 2) + inset.X
            local y = target.AbsolutePosition.Y + (target.AbsoluteSize.Y / 2) + inset.Y

            VIM:SendMouseMoveEvent(x, y, game)
            VIM:SendMouseButtonEvent(x, y, 0, true, game, 1)
            VIM:SendMouseButtonEvent(x, y, 0, false, game, 1)

            return true
        end

        local function click(target)
            return clickWithMouse(target)
        end

        local _cachedYouBox = false
        local _lastYouBoxCheck = 0
        local function isYouBoxVisible()
            local now = tick()
            if now - _lastYouBoxCheck < 0.01 then return _cachedYouBox end
            _lastYouBoxCheck = now
            local success, box = pcall(function()
                return player.PlayerGui.Interface.Trading.Prompt.Tab.Display.You.Box
            end)
            if not success or not box then _cachedYouBox = false; return false end
            if not box.Visible then _cachedYouBox = false; return false end
            if box.AbsoluteSize.X <= 0 or box.AbsoluteSize.Y <= 0 then _cachedYouBox = false; return false end

            local obj = box
            while obj do
                if obj:IsA("GuiObject") and not obj.Visible then _cachedYouBox = false; return false end
                if obj:IsA("ScreenGui") and not obj.Enabled then _cachedYouBox = false; return false end
                obj = obj.Parent
            end
            _cachedYouBox = true
            return true
        end

        local function sendStateReady()
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Assets")
                    :WaitForChild("Remotes"):WaitForChild("GET")
                    :InvokeServer("S_Trade", "State", "Receiver", true)
            end)
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Assets")
                    :WaitForChild("Remotes"):WaitForChild("GET")
                    :InvokeServer("S_Trade", "State", "Sender", true)
            end)
        end

        local function getTradeItem(itemName)
            if not isYouBoxVisible() then return nil end
            local realName = itemMapping[itemName] or itemName
            local success, item = pcall(function()
                return player.PlayerGui.Interface.Trading.Prompt.List.Holder.Items[realName].Main.Interact
            end)
            return success and item or nil
        end

        local function getAddButton()
            if not isYouBoxVisible() then return nil end
            return pcall(function()
                return player.PlayerGui.Interface.Trading.Prompt.Tab.Display.You.Box.Items.Item_Add
            end) and player.PlayerGui.Interface.Trading.Prompt.Tab.Display.You.Box.Items.Item_Add or nil
        end

        local function getAddButtonTitle()
            if not isYouBoxVisible() then return nil end
            local btn = getAddButton()
            return btn and pcall(function() return btn.Add.Inner.Title.Text end) and btn.Add.Inner.Title.Text or nil
        end

        local function getConfirm()
            return pcall(function()
                return player.PlayerGui.Interface.Trading.Prompt.Review.Rate.Title
            end) and player.PlayerGui.Interface.Trading.Prompt.Review.Rate.Title or nil
        end

        local function getInventoryCount(itemName)
            if not isYouBoxVisible() then return 0 end
            local realName = itemMapping[itemName] or itemName
            local success, item = pcall(function()
                return player.PlayerGui.Interface.Trading.Prompt.List.Holder.Items[realName]
            end)
            if success and item then
                local label = item.Main and item.Main.Inner and item.Main.Inner.Quantity
                return label and tonumber(label.Text:match("%d+")) or 0
            end
            return 0
        end

        local function getMemoryScrollCount()
            local count = 0
            pcall(function()
                local GET = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("GET")
                local data = GET:InvokeServer("Data", "Copy")
                if data and data.Slots then
                    local slot = data.Current_Slot or "A"
                    local slotData = data.Slots[slot]
                    if slotData and slotData.Inventory and slotData.Inventory.Items then
                        count = slotData.Inventory.Items["600_Memory Scroll"] or 0
                    end
                end
            end)
            return count
        end

        local function getCurrentAddedCount(itemName)
            if not isYouBoxVisible() then return 0 end
            local realName = itemMapping[itemName] or itemName
            local success, item = pcall(function()
                return player.PlayerGui.Interface.Trading.Prompt.Tab.Display.You.Box.Items[realName]
            end)
            if success and item then
                local label = item.Main and item.Main.Inner and item.Main.Inner.Quantity
                return label and tonumber(label.Text:match("%d+")) or 0
            end
            return 0
        end

        local function allItemsMatchTarget(target)
            for _, itemName in ipairs(SelectedItems) do
                if getCurrentAddedCount(itemName) ~= target then
                    return false
                end
            end
            return true
        end

        local function waitForAddedStable(itemName, target, timeout)
            local start = tick()
            local lastAdded = getCurrentAddedCount(itemName)
            local stableTime = 0
            local requiredStable = 0.1
            
            while tick() - start < (timeout or 1.5) do
                if not isYouBoxVisible() then return false end
                local current = getCurrentAddedCount(itemName)
                if current == target then
                    if current == lastAdded then
                        stableTime = stableTime + CheckWait
                        if stableTime >= requiredStable then return true end
                    else 
                        stableTime = 0 
                    end
                else 
                    stableTime = 0 
                end
                lastAdded = current
                task.wait(CheckWait)
            end
            return false
        end

        Alt2Box:AddDropdown("Alt2_ItemSelectDropdown", {
            Text = "Select Items",
            Values = {"Memory Scroll", "Emperor's Key"},
            Default = {"Memory Scroll"},
            Multi = true,
            Callback = function(val)
                SelectedItems = {}
                for item, enabled in pairs(val) do
                    if enabled then table.insert(SelectedItems, item) end
                end
                if Alt2Enabled then
                    isWaitingForConfirm = false
                    Alt2Running = false
                    pendingTargetChange = true
                    newTargetValue = SelectAmount
                end
            end
        })

        Alt2Box:AddSlider("Alt2_SelectAmountSlider", {
            Text = "Amount Per Item",
            Default = 1, Min = 1, Max = 100, Rounding = 0,
            Callback = function(val)
                if SelectAmount ~= val then
                    SelectAmount = val
                    if Alt2Enabled then
                        isWaitingForConfirm = false
                        Alt2Running = false
                        pendingTargetChange = true
                        newTargetValue = val
                    end
                end
            end
        })

        autoTradeToggleRef = Alt2Box:AddToggle("Alt2_AutoTradeToggle", {
            Text = "Auto Trade [ Manual ]",
            Default = false,
            Callback = function(v)
                Alt2Enabled = v
                if not v then
                    isWaitingForConfirm = false
                    Alt2Running = false
                    pendingTargetChange = false
                end
            end
        })

        Alt2Box:AddDivider()
        acceptTradeToggleRef = Alt2Box:AddToggle("Alt2_AcceptTradeToggle", {
            Text = "Accept Trade",
            Default = false,
            Callback = function(v)
                acceptTradeEnabled = v
            end
        })

        Alt2Box:AddDivider()
        local autoDisableSlider = Alt2Box:AddSlider("AutoDisableThresholdSlider", {
            Text = "Disable if Memory Scroll ≤",
            Default = 0,
            Min = 0,
            Max = 1000,
            Rounding = 0,
            Suffix = " scrolls",
            Callback = function(v)
                autoDisableThreshold = v
            end
        })

        local autoDisableToggle = Alt2Box:AddToggle("AutoDisableToggle", {
            Text = "Auto Disable Trade",
            Default = false,
            Callback = function(v)
                autoDisableEnabled = v
            end
        })

        task.spawn(function()
            local lastConfirmClick = 0
            local confirmCooldown = 0.05
            while true do
                task.wait(0.01)
                pcall(function()
                    if not Alt2Enabled then return end
                    local confirmTitle = getConfirm()
                    if confirmTitle and confirmTitle:IsA("TextLabel") and string.lower(confirmTitle.Text) == "confirm" then
                        local visible = true
                        local obj = confirmTitle
                        while obj do
                            if obj:IsA("GuiObject") and not obj.Visible then visible = false; break end
                            if obj:IsA("ScreenGui") and not obj.Enabled then visible = false; break end
                            obj = obj.Parent
                        end
                        if visible and confirmTitle.AbsoluteSize.X > 0 then
                            if tick() - lastConfirmClick >= confirmCooldown then
                                click(confirmTitle)
                                lastConfirmClick = tick()
                                isWaitingForConfirm = false
                            end
                        end
                    end
                end)
            end
        end)

        task.spawn(function()
            local GET = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("GET")
            while true do
                task.wait(2)
                if acceptTradeEnabled then
                    pcall(function()
                        GET:InvokeServer("S_Trade", "State", "Receiver", true)
                        GET:InvokeServer("S_Trade", "State", "Sender", true)
                    end)
                end
            end
        end)

        local endTradeLoopRunning = false
        task.spawn(function()
            while true do
                task.wait(2)
                if autoDisableEnabled then
                    local addTitle = getAddButtonTitle()
                    if addTitle == "-" then
                        local scrollCount = getMemoryScrollCount()
                        if scrollCount <= autoDisableThreshold then
                            local shouldNotify = false
                            if Alt2Enabled then
                                Alt2Enabled = false
                                if autoTradeToggleRef then
                                    autoTradeToggleRef:SetValue(false)
                                end
                                shouldNotify = true
                            end
                            if acceptTradeEnabled then
                                acceptTradeEnabled = false
                                if acceptTradeToggleRef then
                                    acceptTradeToggleRef:SetValue(false)
                                end
                                shouldNotify = true
                            end
                            if shouldNotify then
                                local GET = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("GET")
                                pcall(function() GET:InvokeServer("S_Trade", "End") end)
                                Library:Notify(string.format("⚠️ Memory Scrolls low (%d ≤ %d). Trading disabled.", scrollCount, autoDisableThreshold), 5)
                                if not endTradeLoopRunning then
                                    endTradeLoopRunning = true
                                    task.spawn(function()
                                        while endTradeLoopRunning and isYouBoxVisible() do
                                            task.wait(5)
                                            if isYouBoxVisible() then
                                                pcall(function()
                                                    local GET = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("GET")
                                                    GET:InvokeServer("S_Trade", "End")
                                                end)
                                            else
                                                endTradeLoopRunning = false
                                            end
                                        end
                                        endTradeLoopRunning = false
                                    end)
                                end
                            end
                        end
                    end
                end
            end
        end)

        local function processItem(itemName, target)
            if not isYouBoxVisible() then return false end
            
            local added = getCurrentAddedCount(itemName)
            local inventoryCount = getInventoryCount(itemName)
            local needed = target - added

            if added == target then return true end

            if needed < 0 then
                local realName = itemMapping[itemName] or itemName
                local youItem = pcall(function()
                    return player.PlayerGui.Interface.Trading.Prompt.Tab.Display.You.Box.Items[realName]
                end) and player.PlayerGui.Interface.Trading.Prompt.Tab.Display.You.Box.Items[realName] or nil
                
                if not youItem then return false end
                
                local current = added
                local targetTotal = target
                local clicksNeeded = current - targetTotal
                
                for i = 1, clicksNeeded do
                    if not Alt2Enabled or not isYouBoxVisible() then break end
                    local clickTarget = youItem:FindFirstChild("Main") or youItem
                    if clickTarget then
                        click(clickTarget)
                        if getCurrentAddedCount(itemName) >= targetTotal then break end
                    end
                end
                return true
            end

            local addBtn = getAddButton()
            if not addBtn then return false end
            
            local addTitle = getAddButtonTitle()
            if addTitle == "+" then
                click(addBtn)
                task.wait(0.15)
                return false
            elseif addTitle ~= "-" then
                return false
            end

            local currentInv = getInventoryCount(itemName)
            if currentInv == 0 then return true end

            local actualNeeded = needed
            if currentInv < needed then
                actualNeeded = currentInv
                target = added + currentInv
            end
            
            if actualNeeded <= 0 then return true end

            local tradeItem = getTradeItem(itemName)
            if not tradeItem then return false end

            local current = added
            local targetTotal = target
            local clicksNeeded = targetTotal - current
            
            for i = 1, clicksNeeded do
                if not Alt2Enabled or not isYouBoxVisible() then break end
                click(tradeItem)
                if getCurrentAddedCount(itemName) >= targetTotal then break end
            end
            
            return true
        end

        task.spawn(function()
            while true do
                task.wait(MainLoopDelay)

                pcall(function()
                    if not Alt2Enabled then return end

                    if not isUIHiddenGlobal() then
                        Alt2Running = false
                        local now = tick()
                        if now - lastHideNotifyTime >= 10 then
                            Library:Notify("⚠️ Hide UI for Working Trading (press End)", 3)
                            lastHideNotifyTime = now
                        end
                        return
                    end

                    if not isYouBoxVisible() then
                        Alt2Running = false
                        return
                    end

                    if isWaitingForConfirm then
                        local confirm = getConfirm()
                        if confirm and confirm:IsA("TextLabel") and string.lower(confirm.Text) == "confirm" then
                            click(confirm)
                            isWaitingForConfirm = false
                        end
                        return
                    end

                    if pendingTargetChange then
                        pendingTargetChange = false
                    end

                    if Alt2Running then return end
                    if not isYouBoxVisible() then return end

                    local target = SelectAmount

                    if allItemsMatchTarget(target) then
                        local allStable = true
                        for _, itemName in ipairs(SelectedItems) do
                            if not waitForAddedStable(itemName, target, 1) then
                                allStable = false
                                break
                            end
                        end
                        
                        if allStable then
                            Alt2Running = true
                            sendStateReady()
                            task.wait(0.02)
                            isWaitingForConfirm = true
                            Alt2Running = false
                        end
                        return
                    end

                    Alt2Running = true
                    for _, itemName in ipairs(SelectedItems) do
                        if not Alt2Enabled or not isYouBoxVisible() then break end
                        processItem(itemName, target)
                    end
                    Alt2Running = false
                end)
            end
        end)
    end)
end


--[[
if IsLobbyLobby() then
    task.spawn(function()
        while not Tabs.Trade do task.wait(0.1) end
        task.wait(0.5)

        local MiscGroup = Tabs.Trade:AddRightGroupbox("Misc : Auto Save")

        local alreadyTeleported = false
        local hasChecked = false
        local panelWasOpen = false
        local holderCheckCount = 0
        local MAX_HOLDER_CHECKS = 30
        
        local LOBBY_ID = 14916516914
        local TeleportService = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local RunService = game:GetService("RunService")
        
        local CONFIG_FILE = "TownShip/teleport_config.json"
        local MonitorEnabled = false
        local minScrolls = 1
        
        if isfile(CONFIG_FILE) then
            pcall(function()
                local data = game:GetService("HttpService"):JSONDecode(readfile(CONFIG_FILE))
                MonitorEnabled = data.MonitorEnabled or false
                minScrolls = data.minScrolls or 1
            end)
        end
        
        local function saveConfig()
            local data = {
                MonitorEnabled = MonitorEnabled,
                minScrolls = minScrolls,
                lastSaved = os.date("%Y-%m-%d %H:%M:%S")
            }
            pcall(function()
                if not isfolder("TownShip") then makefolder("TownShip") end
                writefile(CONFIG_FILE, game:GetService("HttpService"):JSONEncode(data))
            end)
        end
        
        MiscGroup:AddSlider("AutoTeleport_MinScrollsSlider", {
            Text = "Teleport when <= (scrolls)",
            Default = minScrolls,
            Min = 0,
            Max = 100,
            Rounding = 0,
            Callback = function(v)
                minScrolls = v
                saveConfig()
            end
        })
        
        MiscGroup:AddDropdown("AutoTeleport_EnableDropdown", {
            Text = "Auto Teleport When Low",
            Values = {"Disabled", "Enabled"},
            Default = MonitorEnabled and "Enabled" or "Disabled",
            Multi = false,
            Callback = function(val)
                MonitorEnabled = (val == "Enabled")
                saveConfig()
                if MonitorEnabled then
                    hasChecked = false
                    alreadyTeleported = false
                    panelWasOpen = false
                    holderCheckCount = 0
                end
            end
        })

        MiscGroup:AddDivider()
        MiscGroup:AddLabel("Destination: Lobby")
        
        local function isAddPanelOpen()
            local success, title = pcall(function()
                return player.PlayerGui.Interface.Trading.Prompt.Tab.Display.You.Box.Items.Item_Add.Add.Inner.Title
            end)
            if success and title and title:IsA("TextLabel") then
                return title.Text == "-"
            end
            return false
        end
        
        local function isHolderFullyLoaded()
            local success, result = pcall(function()
                local holder = player.PlayerGui.Interface.Trading.Prompt.List.Holder
                if not holder then return false end
                if not holder.Visible then return false end
                local items = holder:FindFirstChild("Items")
                if not items then return false end
                if items:FindFirstChild("600_Memory Scroll") then
                    return true
                end
                return false
            end)
            return success and result or false
        end
        
        local function getInventoryCount()
            local success, count = pcall(function()
                local scroll = game:GetService("Players").LocalPlayer.PlayerGui.Interface.Trading.Prompt.List.Holder.Items["600_Memory Scroll"]
                if not scroll then return 0 end
                local main = scroll:FindFirstChild("Main")
                if not main then return 0 end
                local inner = main:FindFirstChild("Inner")
                if not inner then return 0 end
                local quantity = inner:FindFirstChild("Quantity")
                if quantity and quantity:IsA("TextLabel") and quantity.Text then
                    local num = tonumber(quantity.Text:match("%d+"))
                    return num or 0
                end
                return 0
            end)
            return (success and count) or 0
        end

        local function teleportToLobby()
            if alreadyTeleported then return end
            alreadyTeleported = true
            task.wait(0.1)
            pcall(function() TeleportService:Teleport(LOBBY_ID, player) end)
        end
        
        local function resetSessionState()
            hasChecked = false
            alreadyTeleported = false
            panelWasOpen = false
            holderCheckCount = 0
        end

        RunService.RenderStepped:Connect(function()
            if not MonitorEnabled then
                return
            end
            
            if alreadyTeleported then
                return
            end
            
            local tradeOpen = false
            pcall(function()
                local trading = player.PlayerGui:FindFirstChild("Interface")
                if trading then
                    trading = trading:FindFirstChild("Trading")
                    if trading then
                        tradeOpen = trading.Visible == true
                    end
                end
            end)
            
            if not tradeOpen then
                if hasChecked then resetSessionState() end
                return
            end
            
            local panelOpen = isAddPanelOpen()
            
            if panelOpen then
                if not panelWasOpen then
                    panelWasOpen = true
                    holderCheckCount = 0
                end
                
                if not hasChecked then
                    holderCheckCount = holderCheckCount + 1
                    
                    if isHolderFullyLoaded() then
                        hasChecked = true
                        local count = getInventoryCount()
                        if count <= minScrolls then
                            teleportToLobby()
                        end
                    elseif holderCheckCount >= MAX_HOLDER_CHECKS then
                        hasChecked = true
                    end
                end
            else
                if panelWasOpen then
                    panelWasOpen = false
                    holderCheckCount = 0
                end
            end
        end)
    end)
end

--]]
getgenv().scalemobile = false

local CONFIG_PRESETS = {
    mobile = { OFFSET_X = 500, OFFSET_Y = 250 },
    pc = { OFFSET_X = 1000, OFFSET_Y = 500 }
}

local isMobile = getgenv().scalemobile or false
local selectedConfig = isMobile and CONFIG_PRESETS.mobile or CONFIG_PRESETS.pc

local OFFSET_X = selectedConfig.OFFSET_X
local OFFSET_Y = selectedConfig.OFFSET_Y

local UISettingsTab = Window:AddTab("Settings")
local MenuGroup = UISettingsTab:AddLeftGroupbox("Menu")

local function IsUIVisible()
    return Window and Window.Holder and Window.Holder.Visible
end

local function HideUI()
    pcall(function()
        if IsUIVisible() then
            Library:Toggle()
        end
    end)
end

MenuGroup:AddToggle("HideUIToggle", {
    Text = "Auto Hide UI",
    Default = false,
    Callback = function(v)
    end
})

MenuGroup:AddToggle("EnableMobileUI", {
    Text = "Enable UI for Mobile",
    Default = getgenv().scalemobile or false,
    Callback = function(v)
        getgenv().scalemobile = v
        local isMobile = getgenv().scalemobile or false
        local selectedConfig = isMobile and CONFIG_PRESETS.mobile or CONFIG_PRESETS.pc
        OFFSET_X = selectedConfig.OFFSET_X
        OFFSET_Y = selectedConfig.OFFSET_Y
        
        if Window and Window.Holder then
            local holder = Window.Holder
            local basePos = holder.Position
            local baseX = basePos.X.Offset
            local baseY = basePos.Y.Offset
            local newX = baseX
            local newY = baseY
            
            if isMobile then
                newX = CONFIG_PRESETS.mobile.OFFSET_X
                newY = CONFIG_PRESETS.mobile.OFFSET_Y
            else
                newX = CONFIG_PRESETS.pc.OFFSET_X
                newY = CONFIG_PRESETS.pc.OFFSET_Y
            end
            
            holder.Position = UDim2.new(0, newX, 0, newY)
        end
    end
})

MenuGroup:AddButton("Unload", function()
    Library:Unload()
end)

MenuGroup:AddLabel("Menu Bind"):AddKeyPicker(
    "MenuKeybind",
    {
        Default = "End",
        NoUI = true,
        Text = "Menu Keybind",
        Callback = function(key)
            if Library and Options.MenuKeybind then
                Library.ToggleKeybind = Options.MenuKeybind
            end
        end
    }
)

task.defer(function()
    pcall(function()
        if Options and Options.MenuKeybind and Library then
            Library.ToggleKeybind = Options.MenuKeybind
        end
    end)
end)

local oldBuildConfigSection = SaveManager.BuildConfigSection
function SaveManager:BuildConfigSection(tab)
    if oldBuildConfigSection then
        oldBuildConfigSection(self, tab)
    end

    local section = tab:AddRightGroupbox("Configuration")
    section:AddButton("Delete config", function()
        if not Options or not Options.SaveManager_ConfigList then return end
        local name = Options.SaveManager_ConfigList.Value
        if not name then return end

        local filePath = self.Folder .. "/settings/" .. name .. ".json"
        if isfile(filePath) then
            delfile(filePath)
            Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList())
            Options.SaveManager_ConfigList:SetValue(nil)
        end
    end)
    
    section:AddButton("Reset Autoload", function()
        local autoloadPath = self.Folder .. "/settings/autoload.txt"
        if isfile(autoloadPath) then
            delfile(autoloadPath)
            if SaveManager.AutoloadLabel then
                SaveManager.AutoloadLabel:SetText("Current autoload config: none")
            end
            if Options and Options.SaveManager_ConfigList then
                Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList())
            end
            Library:Notify("Autoload config has been reset to none")
        else
            if SaveManager.AutoloadLabel then
                SaveManager.AutoloadLabel:SetText("Current autoload config: none")
            end
            Library:Notify("No autoload config found, reset to none")
        end
    end)
end

SaveManager:BuildConfigSection(UISettingsTab)

pcall(function()
    if ThemeManager and ThemeManager.BuiltInThemes and ThemeManager.BuiltInThemes["Jester"] then
        ThemeManager:ApplyTheme("Jester")
        ThemeManager:SaveDefault("Jester")
    elseif ThemeManager and ThemeManager.ApplyTheme then
        ThemeManager:ApplyTheme("Default")
    end
end)

task.spawn(function()
    local maxWait = 5
    local start = tick()
    while tick() - start < maxWait do
        if Window and Window.Holder then
            break
        end
        task.wait(0.1)
    end

    if Window and Window.Holder then
        local holder = Window.Holder
        local basePos = holder.Position
        local baseX = basePos.X.Offset
        local baseY = basePos.Y.Offset
        holder.Position = UDim2.new(0, baseX + OFFSET_X, 0, baseY + OFFSET_Y)
    end
end)

task.spawn(function()
    task.wait(0.25)
    pcall(function()
        SaveManager:LoadAutoloadConfig()
    end)

    for i = 1, 40 do
        if Window and Window.Holder then break end
        task.wait(0.05)
    end
    task.wait(0.15)

    if Toggles["HideUIToggle"] and Toggles["HideUIToggle"].Value and IsUIVisible() then
        HideUI()
    end
end)


if IsMainmenuLobby() then
    local g = Tabs.MainMenu:AddRightGroupbox("Start GaMe")

    local d, s, a = 1, false, "A"

    local Players = game:GetService("Players")
    local VIM = game:GetService("VirtualInputManager")
    local GS = game:GetService("GuiService")

    local p = Players.LocalPlayer
    local PlayerGui = p.PlayerGui

    local function GetSlots()
        local i = PlayerGui:FindFirstChild("Interface")
        if not i then return nil end
        local t = i:FindFirstChild("Title_Screen")
        if not t then return nil end
        return t:FindFirstChild("Slots")
    end

    local function GetLogo()
        local i = PlayerGui:FindFirstChild("Interface")
        if not i then return nil end
        local t = i:FindFirstChild("Title_Screen")
        if not t then return nil end
        return t:FindFirstChild("Logo")
    end

    local function IsVisible(obj)
        if not obj then return false end
        if obj:IsA("ScreenGui") then return obj.Enabled end
        if obj:IsA("GuiObject") then
            return obj.Visible and obj.AbsoluteSize.X > 1 and obj.AbsoluteSize.Y > 1
        end
        return false
    end

    local function IsLogoActuallyVisible(obj)
        if not obj then return false end
        if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            if obj.ImageTransparency < 0.95 and obj.AbsoluteSize.X > 5 and obj.AbsoluteSize.Y > 5 then
                return true
            end
        end
        for _, v in ipairs(obj:GetDescendants()) do
            if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                if v.Visible and v.ImageTransparency < 0.95 and v.AbsoluteSize.X > 5 and v.AbsoluteSize.Y > 5 then
                    return true
                end
            end
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                if v.Visible and v.TextTransparency < 0.95 and v.AbsoluteSize.X > 5 and v.AbsoluteSize.Y > 5 then
                    return true
                end
            end
        end
        return false
    end

    local function clickButton(target)
        if not target or not target.Visible then return false end
        
        local obj = target
        while obj and obj ~= p.PlayerGui do
            if obj:IsA("GuiObject") and not obj.Visible then return false end
            if obj:IsA("ScreenGui") and not obj.Enabled then return false end
            obj = obj.Parent
        end
        
        if target.AbsoluteSize.X <= 0 or target.AbsoluteSize.Y <= 0 then return false end
        
        GS.SelectedObject = target
        task.wait(0.05)
        VIM:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
        task.wait(0.05)
        VIM:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
        task.wait(0.1)
        GS.SelectedObject = nil
        
        return true
    end

    local function SelectSlot()
        if not s then return false end
        local map = {A = "Select_A", B = "Select_B", C = "Select_C"}
        local Slots = GetSlots()
        if not Slots then return false end
        local slot = Slots:FindFirstChild(a)
        if not slot then return false end
        local button = slot:FindFirstChild(map[a])
        if not button then return false end
        return clickButton(button)
    end

    g:AddDropdown("SlotSelectionDropdown", {
        Values = {"A","B","C"}, Default = "A", Multi = false,
        Text = "Select Slot", Callback = function(x) a = x end
    })
    g:AddDivider()
    g:AddSlider("SelectDelaySlider", {
        Text = "Delay", Default = d, Min = 0.1, Max = 10, Rounding = 1,
        Callback = function(x) d = x end
    })
    g:AddDivider()
    g:AddToggle("AutoClickSelectToggle", {
        Text = "Auto Slot [ SELECT ]", Default = false,
        Callback = function(x)
            s = x
            if not x then return end
            task.spawn(function()
                while s do
                    task.wait(0.15)
                    local Slots = GetSlots()
                    if IsLogoActuallyVisible(GetLogo()) then continue end
                    if not IsVisible(Slots) then continue end
                    SelectSlot()
                    task.wait(d)
                end
            end)
        end
    })

    
    local C = Tabs.MainMenu:AddRightGroupbox("Join Community")

    local autoJoinEnabled = false
    local autoNotNowEnabled = false

    -- ใช้ Path ใหม่ตามที่กำหนด
    local function IsJoinCommunityDialogVisible()
        local success, dialog = pcall(function()
            return game:GetService("CoreGui").RobloxGui.FocusNavigationCoreScriptsWrapper.Main.DialogContentWrapper.Folder.Dialog
        end)
        if not success or not dialog then return false end
        return dialog.Visible == true
    end

    local function getDialogButtons()
        local success, actionsContainer = pcall(function()
            return game:GetService("CoreGui").RobloxGui
                .FocusNavigationCoreScriptsWrapper.Main.DialogContentWrapper.Folder.Dialog.DialogInner.DialogBody.DialogActions.ActionsContainer
        end)
        if not success or not actionsContainer then return {} end
        
        local buttons = {}
        for _, child in ipairs(actionsContainer:GetChildren()) do
            if child:IsA("GuiButton") and child.Visible and child.AbsoluteSize.X > 0 and child.AbsoluteSize.Y > 0 then
                table.insert(buttons, child)
            end
        end
        return buttons
    end

    local function clickJoinButton()
        local buttons = getDialogButtons()
        if #buttons >= 1 then
            return clickButton(buttons[1])
        end
        return false
    end

    local function clickNotNowButton()
        local buttons = getDialogButtons()
        if #buttons >= 2 then
            return clickButton(buttons[2])
        end
        return false
    end

    C:AddToggle("AutoDialogClickerToggle", {
        Text = "Auto Click 'Join Community'", Default = false,
        Callback = function(v)
            autoJoinEnabled = v
        end
    })

    C:AddToggle("AutoNotNowClickerToggle", {
        Text = "Not Click 'Join Community'", Default = false,
        Callback = function(v)
            autoNotNowEnabled = v
        end
    })

    task.spawn(function()
        while true do
            task.wait(0.15)
            pcall(function()
                if IsJoinCommunityDialogVisible() then
                    if autoJoinEnabled then
                        clickJoinButton()
                    elseif autoNotNowEnabled then
                        clickNotNowButton()
                    end
                end
            end)
        end
    end)
end

if IsMainmenuLobby() then
    local J = Tabs.MainMenu:AddRightGroupbox("Auto Join")

    local D2 = 0
    local Dst = "Lobby"
    local E = false
    local R = false
    local Lf = 0

    local Players = game:GetService("Players")
    local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

    local function IsFollowFrameOpen()
        local ok, follow = pcall(function()
            return PlayerGui.Interface.Title_Screen.Follow
        end)
        if not ok or not follow then return false end
        return follow.Visible == true
    end

    local function TeleportTo(destination)
        local args = {"Functions", "Teleport", destination}
        pcall(function()
            GET:InvokeServer(unpack(args))
        end)
    end

    J:AddDropdown("JoinDestinationDropdown", {
        Values = {"Lobby","Trade"}, Default = "Lobby", Multi = false,
        Text = "Teleport To", Callback = function(x) Dst = x end
    })
    J:AddSlider("AutoJoinDelaySlider", {
        Text = "Delay (seconds)", Default = 0, Min = 0, Max = 120, Rounding = 0,
        Callback = function(x) D2 = x end
    })
    J:AddToggle("MyToggle", {
        Text = "Auto Join", Default = false,
        Callback = function(x)
            E = x
            if not x then R = false; return end
            if R then return end
            R = true
            task.spawn(function()
                while E do
                    task.wait(0.15)
                    
                    if not IsFollowFrameOpen() then
                        continue
                    end
                    
                    if tick() - Lf < 2 then continue end
                    if D2 > 0 then task.wait(D2) end
                    Lf = tick()
                    TeleportTo(Dst)
                end
                R = false
            end)
        end
    })
end
if IsMainmenuLobby() or IsLobbyLobby() then
    local tab = Tabs.MainMenu or Tabs.Lobby
    local g = tab:AddLeftGroupbox("Teleport Now")
    local l = g:AddLabel("")
    local function DoTP(id) pcall(function() TeleportService:Teleport(id, Player) end) end
    local function AddConfirm(name, id, time)
        local c = false
        g:AddButton(name, function()
            if c then DoTP(id)
            else
                c = true; l:SetText("Are you sure?")
                task.delay(time or 3, function() c = false; l:SetText("") end)
            end
        end)
    end
    AddConfirm("Teleport to Main Menu", MAIN_MENU_ID, 1.5)
    AddConfirm("Teleport to Lobby", LOBBY_ID)
    AddConfirm("Teleport to Trading", TRADE_LOBBY_ID)
    
        g:AddDivider()
    
    local autoTeleportEnabled = false
    local autoTeleportTime = 0
    local teleportAttempts = 0
    local maxAttempts = 5
    local isTeleporting = false
    local startTime = 0
    
    local function readAutoTeleportDelay()
        local delay = autoTeleportTime
        pcall(function()
            if Options and Options.AutoTeleportTimeSlider then
                local v = Options.AutoTeleportTimeSlider.Value
                if type(v) == "number" then
                    delay = v
                else
                    delay = tonumber(v) or delay
                end
            end
        end)
        if type(delay) ~= "number" or delay < 0 then delay = 0 end
        autoTeleportTime = delay
        return delay
    end
    
    g:AddSlider("AutoTeleportTimeSlider", {
        Text = "Teleport Main Menu After x Sec",
        Default = 0,
        Min = 0,
        Max = 600,
        Rounding = 0,
        Suffix = "sec",
        Callback = function(v)
            autoTeleportTime = tonumber(v) or 0
            if autoTeleportEnabled and not isTeleporting then
                startTime = tick()
            end
        end
    })
    
    local function tryLobbyMainFailsafeTP()
        pcall(function()
            local POST = ReplicatedStorage:FindFirstChild("Assets")
                and ReplicatedStorage.Assets:FindFirstChild("Remotes")
                and ReplicatedStorage.Assets.Remotes:FindFirstChild("POST")
            if POST then
                POST:FireServer("Functions", "Teleport", "Menu", nil)
            end
        end)
        pcall(function()
            local GET = ReplicatedStorage:FindFirstChild("Assets")
                and ReplicatedStorage.Assets:FindFirstChild("Remotes")
                and ReplicatedStorage.Assets.Remotes:FindFirstChild("GET")
            if GET then
                pcall(function() GET:InvokeServer("S_Missions", "Leave") end)
                pcall(function() GET:InvokeServer("Functions", "Teleport", "Menu") end)
            end
        end)
        task.wait(1)
        pcall(function() TeleportService:Teleport(MAIN_MENU_ID, Player) end)
    end
    
    g:AddToggle("AutoTeleportToggle", {
        Text = "Enable Auto Teleport",
        Default = false,
        Callback = function(v)
            autoTeleportEnabled = v
            if not v then
                teleportAttempts = 0
                isTeleporting = false
                startTime = 0
            else
                teleportAttempts = 0
                isTeleporting = false
                -- defer so Linoria/SaveManager slider Value is ready
                task.defer(function()
                    if not autoTeleportEnabled then return end
                    local delay = readAutoTeleportDelay()
                    startTime = tick()
                    Library:Notify(string.format("FailSafe started (%ds)", delay), 3)
                end)
            end
        end
    })
    
    g:AddButton("Test Auto Teleport NOW", function()
        Library:Notify("FailSafe: teleporting now...", 3)
        isTeleporting = true
        teleportAttempts = 0
        tryLobbyMainFailsafeTP()
    end)
    
    task.spawn(function()
        while true do
            task.wait(0.5)
            
            if not autoTeleportEnabled then
                isTeleporting = false
                continue
            end
            
            if not isTeleporting then
                local delay = readAutoTeleportDelay()
                local elapsed = tick() - startTime
                -- 0 = fire immediately; otherwise wait for delay
                if delay <= 0 or elapsed >= delay then
                    isTeleporting = true
                    teleportAttempts = 0
                    Library:Notify("FailSafe: time reached, teleporting...", 3)
                end
            end
            
            if autoTeleportEnabled and isTeleporting then
                teleportAttempts = teleportAttempts + 1
                tryLobbyMainFailsafeTP()
                
                if teleportAttempts >= maxAttempts then
                    pcall(function() game:Shutdown() end)
                end
                
                task.wait(4)
                
                if game.PlaceId == MAIN_MENU_ID then
                    isTeleporting = false
                    autoTeleportEnabled = false
                    pcall(function()
                        if Options and Options.AutoTeleportToggle then
                            Options.AutoTeleportToggle:SetValue(false)
                        end
                    end)
                end
            end
        end
    end)
end

if IsMainmenuLobby() then
    local CodeGroup = Tabs.MainMenu:AddLeftGroupbox("Code Redeem")

    local codesFile = "TownShip/codes.txt"
    local codeList = {}
    local selectedCodes = {}  
    local autoRedeemActive = false
    local autoRedeemTask = nil

    local function saveCodes()
        writefile(codesFile, table.concat(codeList, "\n"))
    end

    local function loadCodes()
        codeList = {}
        if isfile(codesFile) then
            local content = readfile(codesFile)
            for line in string.gmatch(content, "[^\r\n]+") do
                line = line:gsub("^%s+", ""):gsub("%s+$", "")
                if line ~= "" then
                    table.insert(codeList, line)
                end
            end
        end
    end

    local function addCode(newCode)
        newCode = newCode:gsub("^%s+", ""):gsub("%s+$", "")
        if newCode == "" then return false end
        for _, existing in ipairs(codeList) do
            if existing == newCode then return false end
        end
        table.insert(codeList, newCode)
        saveCodes()
        return true
    end

    local function removeSelectedCodes()
        local removed = false
        for code, isSelected in pairs(selectedCodes) do
            if isSelected then
                for i, existing in ipairs(codeList) do
                    if existing == code then
                        table.remove(codeList, i)
                        removed = true
                        break
                    end
                end
            end
        end
        if removed then
            saveCodes()
            refreshDropdown()
        end
        return removed
    end

    loadCodes()

    local codeDropdown = CodeGroup:AddDropdown("CodeListDropdown", {
        Text = "Stored Codes",
        Values = codeList,
        Default = {},
        Multi = true,
        Callback = function(v)
            selectedCodes = v
        end
    })

    local function refreshDropdown()
        codeDropdown:SetValues(codeList)
        selectedCodes = {}
        codeDropdown:SetValue(selectedCodes)
    end

    local newCodeInput = ""
    CodeGroup:AddInput("NewCodeInput", {
        Text = "New Code",
        Placeholder = "Enter code...",
        Numeric = false,
        Finished = true,
        Callback = function(v)
            newCodeInput = v
        end
    })

    CodeGroup:AddButton("Store Code", function()
        if newCodeInput ~= "" then
            if addCode(newCodeInput) then
                Library:Notify("Code '" .. newCodeInput .. "' added successfully!", 3)
                refreshDropdown()
                newCodeInput = ""
                if Options and Options.NewCodeInput then
                    Options.NewCodeInput:SetValue("")
                end
            else
                Library:Notify("Code already exists or invalid!", 3)
            end
        else
            Library:Notify("Please enter a code first!", 3)
        end
    end)

    CodeGroup:AddButton("Remove Selected Codes", function()
        local hasSelected = false
        for _, selected in pairs(selectedCodes) do
            if selected then hasSelected = true; break end
        end
        if hasSelected then
            if removeSelectedCodes() then
                Library:Notify("Selected codes removed.", 3)
            else
                Library:Notify("Failed to remove codes.", 3)
            end
        else
            Library:Notify("No code selected.", 3)
        end
    end)

    CodeGroup:AddDivider()

    local function IsActuallyVisible(gui)
        if not gui or not gui:IsA("GuiObject") then return false end
        if not gui.Visible then return false end
        local current = gui.Parent
        while current do
            if current:IsA("GuiObject") and not current.Visible then return false end
            if current:IsA("ScreenGui") and not current.Enabled then return false end
            current = current.Parent
        end
        return true
    end

    local function isRedeemPageVisible()
        local interface = PlayerGui:FindFirstChild("Interface")
        if not interface then return false end
        local followVisible = false
        local familyVisible = false
        local titleScreen = interface:FindFirstChild("Title_Screen")
        if titleScreen then
            local follow = titleScreen:FindFirstChild("Follow")
            if follow then followVisible = IsActuallyVisible(follow) end
        end
        local customisation = interface:FindFirstChild("Customisation")
        if customisation then
            local categories = customisation:FindFirstChild("Categories")
            if categories then
                local family = categories:FindFirstChild("Family")
                if family then familyVisible = IsActuallyVisible(family) end
            end
        end
        return followVisible or familyVisible
    end

    local function redeemCode(code)
        if not code or code == "" then return false, "No code provided!" end
        local GET = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("GET")
        local success, result = pcall(function()
            return GET:InvokeServer("Functions", "Redeem", code)
        end)
        if not success then return false, tostring(result) end
        local resultStr = tostring(result)
        if resultStr:find("SUCCESSFUL") then
            return true, "✅ Redeemed successfully! (" .. code .. ")"
        elseif resultStr:find("USED") then
            return false, "⚠️ Code already used! (" .. code .. ")"
        elseif resultStr:find("EXPIRED") then
            return false, "❌ Code expired! (" .. code .. ")"
        elseif resultStr:find("INVALID") then
            return false, "❌ Invalid code! (" .. code .. ")"
        else
            return false, "Redeem result: " .. resultStr
        end
    end

    local function getSelectedCodeList()
        local list = {}
        for code, isSelected in pairs(selectedCodes) do
            if isSelected then table.insert(list, code) end
        end
        return list
    end

    local function startAutoRedeem()
        if autoRedeemTask then return end
        autoRedeemTask = task.spawn(function()
            -- รอให้หน้า redeem พร้อม (เช็คทุก 0.5 วินาที)
            local waitingNotified = false
            while autoRedeemActive and not isRedeemPageVisible() do
                if not waitingNotified then
                    Library:Notify("Waiting for redeem...", 3)
                    waitingNotified = true
                end
                task.wait(0.5)
            end
            
            if not autoRedeemActive then return end
            
            local selectedList = getSelectedCodeList()
            if #selectedList == 0 then
                Library:Notify("No codes selected to redeem.", 3)
                autoRedeemActive = false
                if Options and Options.AutoRedeemToggle then
                    Options.AutoRedeemToggle:SetValue(false)
                end
                autoRedeemTask = nil
                return
            end
            
            local successCount = 0
            local failCount = 0
            for i, code in ipairs(selectedList) do
                if not autoRedeemActive then break end
                -- ก่อน redeem แต่ละครั้ง เช็ค visibility อีกครั้ง
                while autoRedeemActive and not isRedeemPageVisible() do
                    task.wait(0.5)
                end
                if not autoRedeemActive then break end
                
                local success, message = redeemCode(code)
                print("[Code Redeemer] " .. message)
                if success then
                    successCount = successCount + 1
                else
                    failCount = failCount + 1
                end
                if i < #selectedList then task.wait(1) end
            end
            Library:Notify(string.format("Auto Redeem finished. Success: %d, Failed: %d", successCount, failCount), 5)
            
            autoRedeemActive = false
            if Options and Options.AutoRedeemToggle then
                Options.AutoRedeemToggle:SetValue(false)
            end
            autoRedeemTask = nil
        end)
    end

    CodeGroup:AddToggle("AutoRedeemToggle", {
        Text = "Auto Redeem Selected Codes",
        Default = false,
        Callback = function(v)
            if v then
                -- ✅ รอ 1 วินาทีให้ UI, Dropdown และ Config โหลดเสร็จ
                task.wait(1)
                
                -- ✅ ดึงค่าที่เลือกจาก Dropdown โดยตรง เพื่อให้แน่ใจว่าได้ค่าล่าสุด
                local dropdownValue = Options and Options.CodeListDropdown and Options.CodeListDropdown.Value or {}
                local selectedList = {}
                for code, isSelected in pairs(dropdownValue) do
                    if isSelected then
                        table.insert(selectedList, code)
                    end
                end
                
                -- ✅ ถ้าจาก dropdown ยังไม่มี ให้ใช้ selectedCodes แทน
                if #selectedList == 0 then
                    selectedList = getSelectedCodeList()
                end
                
                if #selectedList == 0 then
                    pcall(function()
                        if Options and Options.AutoRedeemToggle then
                            Options.AutoRedeemToggle:SetValue(false)
                        end
                    end)
                    Library:Notify("Please select at least one code first!", 3)
                    return
                end
                if #codeList == 0 then
                    pcall(function()
                        if Options and Options.AutoRedeemToggle then
                            Options.AutoRedeemToggle:SetValue(false)
                        end
                    end)
                    Library:Notify("No codes stored. Please add codes first!", 3)
                    return
                end
                autoRedeemActive = true
                startAutoRedeem()
            else
                autoRedeemActive = false
                if autoRedeemTask then
                    task.cancel(autoRedeemTask)
                    autoRedeemTask = nil
                end
            end
        end
    })
end



local function findMissionRemote()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local remotesFolder = ReplicatedStorage:FindFirstChild("Assets") 
        and ReplicatedStorage.Assets:FindFirstChild("Remotes")
        or ReplicatedStorage:FindFirstChild("Remotes")
        or ReplicatedStorage:FindFirstChild("Network")
        or ReplicatedStorage:FindFirstChild("RemoteEvents")
    
    if not remotesFolder then
        for _, child in ipairs(ReplicatedStorage:GetChildren()) do
            if child:IsA("Folder") and (child.Name:lower():find("remote") or child.Name:lower():find("network")) then
                remotesFolder = child
                break
            end
        end
    end
    
    local getRemote = remotesFolder and remotesFolder:FindFirstChild("GET") 
        or ReplicatedStorage:FindFirstChild("GET")
        or ReplicatedStorage:FindFirstChild("GetRemote")
        or ReplicatedStorage:FindFirstChild("RequestData")
    
    return getRemote
end

local MissionGET = findMissionRemote()
if not MissionGET then
    local waited = 0
    while not MissionGET and waited < 5 do
        task.wait(0.5)
        MissionGET = findMissionRemote()
        waited = waited + 0.5
    end
end

local function SafeMissionCall(...)
    if not MissionGET then return false, nil end
    local args = {...}
    local success, result = pcall(function()
        return MissionGET:InvokeServer(unpack(args, 1, table.getn(args)))
    end)
    return success, result
end

if Tabs.Lobby then
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local Player = player

    local function IsActuallyVisible(gui)
        if not gui or not gui:IsA("GuiObject") then return false end
        if not gui.Visible then return false end
        local current = gui.Parent
        while current do
            if current:IsA("GuiObject") and not current.Visible then return false end
            if current:IsA("ScreenGui") and not current.Enabled then return false end
            current = current.Parent
        end
        return true
    end

    local function isUIActive()
        if _G.LobbyUILoaded then
            local ok = false
            pcall(function()
                local gear = player.PlayerGui.Interface.Gear_Up
                if gear then ok = true end
            end)
            if ok then return true end
        end
        local interface = player.PlayerGui:FindFirstChild("Interface")
        if not interface then return false end
        local gearUp = interface:FindFirstChild("Gear_Up")
        if not gearUp then return false end
        local lobby = gearUp:FindFirstChild("Lobby")
        if lobby then
            local key = lobby:FindFirstChild("Key")
            if key and IsActuallyVisible(key) then return true end
            local backing = lobby:FindFirstChild("Backing")
            if backing and IsActuallyVisible(backing) then return true end
            if IsActuallyVisible(lobby) then return true end
        end
        local hud = gearUp:FindFirstChild("HUD")
        if hud and IsActuallyVisible(hud) then return true end
        local invGui = interface:FindFirstChild("Topbar")
        if invGui then
            invGui = invGui:FindFirstChild("Main")
            if invGui then
                invGui = invGui:FindFirstChild("Categories")
                if invGui then
                    invGui = invGui:FindFirstChild("Inventory")
                    if invGui and IsActuallyVisible(invGui) then return true end
                end
            end
        end
        return false
    end
  
    local AutoMissionTabbox = Tabs.Lobby:AddLeftTabbox("Auto Content")
    local MissionTab = AutoMissionTabbox:AddTab("Mission")
    print("[Mission] ORIGINAL MODIFIER SYSTEM RESTORED + MAP FIX BUILD")

    local MissionObjectives = {
        ["Shiganshina"] = {"Skirmish","Breach","Random"},
        ["Trost"]       = {"Skirmish","Protect","Random"},
        ["Outskirts"]   = {"Skirmish","Escort","Random"},
        ["Forest"]      = {"Skirmish","Guard","Random"},
        ["Utgard"]      = {"Skirmish","Defend","Random"},
        ["Chapel"]      = {"Skirmish"},
        ["Docks"]       = {"Skirmish","Stall","Random"},
        ["Stohess"]     = {"Skirmish","Random"}
    }

    local ModifiersList = {
        "No Perks", "No Skills", "No Memories", "Nightmare", "Oddball",
        "Injury Prone", "Chronic Injuries", "Fog", "Glass Cannon", "Time Trial", "Boring", "Simple"
    }

    local State_Mission = {
        Name = "Shiganshina",
        Objective = "Skirmish",
        Difficulty = "Hardest"
    }

    local MissionDelay = 0
    local missionRunning = false
    local missionBusy = false
    local missionSessionId = 0
    local missionPendingStart = false
    local missionStartTask = nil
    local missionSelectionVersion = 0

    pcall(function()
        if Options and Options.MissionDropdown and Options.MissionDropdown.Value then
            State_Mission.Name = Options.MissionDropdown.Value
        end
        if Options and Options.MissionObjectiveDropdown and Options.MissionObjectiveDropdown.Value then
            State_Mission.Objective = Options.MissionObjectiveDropdown.Value
        end
        if Options and Options.MissionDifficultyDropdown and Options.MissionDifficultyDropdown.Value then
            State_Mission.Difficulty = Options.MissionDifficultyDropdown.Value
        end
        if Options and Options.MissionDelaySlider and Options.MissionDelaySlider.Value then
            MissionDelay = tonumber(Options.MissionDelaySlider.Value) or 0
        end
    end)

    -- ═══════════════════════════════════════════════════════════
    -- Helpers
    -- ═══════════════════════════════════════════════════════════

    local function GetPlayerLevel()
        local success, level = pcall(function()
            local playerGui = player:FindFirstChild("PlayerGui")
            if not playerGui then return 1 end
            local interface = playerGui:FindFirstChild("Interface")
            if not interface then return 1 end
            local gearUp = interface:FindFirstChild("Gear_Up")
            if not gearUp then return 1 end
            local hud = gearUp:FindFirstChild("HUD")
            if not hud then return 1 end
            local levelFrame = hud:FindFirstChild("Level")
            if not levelFrame then return 1 end
            local title = levelFrame:FindFirstChild("Title")
            if not title then return 1 end
            return tonumber(tostring(title.Text):match("%d+")) or 1
        end)
        return success and level or 1
    end

    local KNOWN_MISSION_MAPS = {
        Shiganshina = true,
        Trost = true,
        Outskirts = true,
        Forest = true,
        Utgard = true,
        Docks = true,
        Stohess = true,
        Chapel = true,
    }

    local function GetMyMission(timeout)
        timeout = timeout or 1.5
        local startTime = tick()

        while tick() - startTime < timeout do
            local missions = game:GetService("ReplicatedStorage"):FindFirstChild("Missions")

            if missions then
                for _, mission in ipairs(missions:GetChildren()) do
                    local leader = mission:FindFirstChild("Leader")

                    if leader and leader.Value == player.Name then
                        return mission
                    end
                end
            end

            task.wait(0.03)
        end

        return nil
    end

    -- Try to discover the replicated map name without depending on one
    -- exact game structure.  We only reject the mission when the replicated
    -- data clearly identifies a DIFFERENT known map.
    local function GetReplicatedMissionMap(mission)
        if not mission then return nil end

        local candidates = {
            mission:GetAttribute("Map"),
            mission:GetAttribute("MapName"),
            mission:GetAttribute("Mission"),
            mission:GetAttribute("MissionName"),
        }

        for _, value in ipairs(candidates) do
            if type(value) == "string" and KNOWN_MISSION_MAPS[value] then
                return value
            end
        end

        for _, obj in ipairs(mission:GetDescendants()) do
            if obj:IsA("StringValue") then
                local value = tostring(obj.Value)

                if KNOWN_MISSION_MAPS[value] then
                    return value
                end
            end
        end

        return nil
    end

    local function MissionMatchesTarget(mission, targetName)
        if not mission then return false end

        local replicatedMap = GetReplicatedMissionMap(mission)

        -- If the game does not replicate the map name here, do not falsely
        -- reject it.  The important stale-mission protection is that the
        -- previous mission must disappear BEFORE Create is sent.
        if not replicatedMap then
            return true
        end

        if replicatedMap ~= targetName then
            warn(
                "[Mission] Wrong mission detected:",
                replicatedMap,
                "wanted:",
                targetName
            )
            return false
        end

        return true
    end

    local function LeaveMission(waitForGone)
        SafeMissionCall("S_Missions", "Leave")

        if waitForGone == false then
            return true
        end

        local started = tick()

        while tick() - started < 2.5 do
            if not GetMyMission(0.05) then
                return true
            end

            -- Re-send Leave while a stale mission still exists.
            SafeMissionCall("S_Missions", "Leave")
            task.wait(0.06)
        end

        return GetMyMission(0.05) == nil
    end

    local function EnsureNoMission()
        local current = GetMyMission(0.08)

        if not current then
            return true
        end

        print("[Mission] Removing stale mission before Create...")

        for attempt = 1, 5 do
            SafeMissionCall("S_Missions", "Leave")

            local started = tick()
            while tick() - started < 0.45 do
                if not GetMyMission(0.03) then
                    return true
                end
                task.wait(0.03)
            end
        end

        return GetMyMission(0.05) == nil
    end

    local function CreateMission(missionName, objective, difficulty)
        for attempt = 1, 4 do
            if not missionRunning then
                return false
            end

            -- CRITICAL:
            -- Do not send Create while an older Chapel/other mission is still
            -- owned by this player. The old build could see that stale mission
            -- after Create and incorrectly count creation as successful.
            if not EnsureNoMission() then
                warn(
                    "[Mission] Could not clear previous mission - retrying",
                    attempt
                )
                task.wait(0.12)
                continue
            end

            print(
                string.format(
                    "[Mission] Creating EXACT map=%s | obj=%s | diff=%s | attempt=%d",
                    tostring(missionName),
                    tostring(objective),
                    tostring(difficulty),
                    attempt
                )
            )

            local callOk, result = SafeMissionCall(
                "S_Missions",
                "Create",
                {
                    Difficulty = difficulty,
                    Type = "Missions",
                    Name = missionName,
                    Objective = objective,
                }
            )

            if not callOk then
                warn("[Mission] Create remote failed on attempt", attempt)
                task.wait(0.10)
                continue
            end

            -- Wait only for a mission that appeared AFTER stale cleanup.
            local createdMission = GetMyMission(0.9)

            if createdMission then
                if MissionMatchesTarget(createdMission, missionName) then
                    print(
                        "[Mission] Create verified:",
                        missionName,
                        objective,
                        difficulty
                    )
                    return true, createdMission
                end

                -- A clearly wrong map appeared. Never start it.
                warn("[Mission] Rejecting wrong created mission")
                LeaveMission(true)
            end

            if attempt < 4 then
                task.wait(0.10)
            end
        end

        return false
    end

    -- ═══════════════════════════════════════════════════════════
    -- Modifiers (محسّن)
    -- ═══════════════════════════════════════════════════════════

    local function ClearMissionModifiers()
        if not missionRunning then return end
        for _ = 1, 3 do
            if not missionRunning then break end
            SafeMissionCall("S_Missions", "ClearModifiers")
            task.wait(0.18)
        end
        task.wait(0.35)
    end

    local function ApplyModifier(mod)
        local names = {mod}
        local noSpace = mod:gsub("%s+", "")
        if noSpace ~= mod then
            table.insert(names, noSpace)
        end

        for _, name in ipairs(names) do
            for attempt = 1, 4 do
                if not missionRunning then return false end

                local success, result = SafeMissionCall("S_Missions", "Modify", name)

                if success then
                    if result == true or result == "true" or result == 1 then
                        return true
                    end
                    if type(result) == "table" and (result.Success == true or result.success == true) then
                        return true
                    end
                end

                task.wait(0.18 + (attempt * 0.05))
            end
        end
        return false
    end

    local function ApplyMissionModifiers()
        if not missionRunning then return end

        local selected = {}
        pcall(function()
            if Options and Options.MissionModifiersDropdown and Options.MissionModifiersDropdown.Value then
                local value = Options.MissionModifiersDropdown.Value
                if type(value) == "table" then
                    for mod, enabled in pairs(value) do
                        if enabled then
                            table.insert(selected, mod)
                        end
                    end
                end
            end
        end)

        if #selected == 0 then
            Library:Notify("No modifiers selected", 2)
            return
        end

        -- ترتيب ثابت
        local ordered = {}
        for _, mod in ipairs(ModifiersList) do
            for _, sel in ipairs(selected) do
                if sel == mod then
                    table.insert(ordered, mod)
                    break
                end
            end
        end
        for _, sel in ipairs(selected) do
            local found = false
            for _, o in ipairs(ordered) do
                if o == sel then found = true break end
            end
            if not found then
                table.insert(ordered, sel)
            end
        end

        ClearMissionModifiers()
        if not missionRunning then return end

        local applied = 0
        local failed = {}

        for _, mod in ipairs(ordered) do
            if not missionRunning then break end

            local success = ApplyModifier(mod)
            if success then
                applied += 1
                print("[Mission] ✓ Modifier applied:", mod)
            else
                table.insert(failed, mod)
                warn("[Mission] ✗ Failed modifier:", mod)
            end
            task.wait(0.16)
        end

        -- Retry قوي للفاشلين
        if #failed > 0 and missionRunning then
            task.wait(0.5)
            Library:Notify("Retrying failed modifiers...", 2)

            local stillFailed = {}
            for _, mod in ipairs(failed) do
                if not missionRunning then break end

                local success = false
                for _ = 1, 3 do
                    success = ApplyModifier(mod)
                    if success then break end
                    task.wait(0.22)
                end

                if success then
                    applied += 1
                    print("[Mission] ✓ Retry success:", mod)
                else
                    table.insert(stillFailed, mod)
                end
                task.wait(0.18)
            end
            failed = stillFailed
        end

        task.wait(0.4)

        if #failed == 0 then
            Library:Notify(string.format("Applied %d/%d modifiers", applied, #selected), 3)
        else
            Library:Notify(string.format("Applied %d/%d (failed: %s)", applied, #selected, table.concat(failed, ", ")), 4)
        end
    end

    local function StartMission()
        if not missionRunning then return false end

        for attempt = 1, 4 do
            if not missionRunning then return false end

            local success = SafeMissionCall("S_Missions", "Start")
            task.wait(0.3)

            if not GetMyMission(0.8) then
                print("[Mission] Started successfully on attempt", attempt)
                return true
            end

            if attempt < 4 then
                warn("[Mission] Start attempt", attempt, "— mission still in lobby, retrying...")
                task.wait(0.25)
            end
        end
        return false
    end

    local function WaitForLobbyUI(timeout)
        timeout = timeout or 15
        if _G.LobbyUILoaded then return true end
        local started = tick()
        while not _G.LobbyUILoaded do
            if tick() - started >= timeout then return false end
            task.wait(0.2)
        end
        return true
    end

    -- ═══════════════════════════════════════════════════════════
    -- Main Cycle
    -- ═══════════════════════════════════════════════════════════

    local function RunMissionCycle(mySession)
        if not missionRunning or missionSessionId ~= mySession then return end

        if _G.LobbyUILoaded ~= true then
            pcall(function() WaitForLobbyUI(12) end)
        end

        if MissionDelay > 0 then
            task.wait(MissionDelay)
        end

        if not missionRunning or missionSessionId ~= mySession then return end

        local selectionVersion = missionSelectionVersion

        -- Headless build: CONFIG is authoritative.
        -- This prevents a stale dropdown/control value from falling back to
        -- Chapel even though CONFIG.Lobby.Mission.Name is Shiganshina.
        local configMission = CONFIG
            and CONFIG.Lobby
            and CONFIG.Lobby.Mission
            or nil

        local currentMission =
            (configMission and configMission.Name)
            or State_Mission.Name

        local objective =
            (configMission and configMission.Objective)
            or State_Mission.Objective

        local selectedDifficulty =
            (configMission and configMission.Difficulty)
            or State_Mission.Difficulty

        if not MissionObjectives[currentMission] then
            currentMission = State_Mission.Name
        end

        local validObjectives = MissionObjectives[currentMission] or {"Skirmish"}
        local objectiveIsValid = false
        for _, allowed in ipairs(validObjectives) do
            if allowed == objective then
                objectiveIsValid = true
                break
            end
        end
        if not objectiveIsValid then
            objective = validObjectives[1] or "Skirmish"
        end

        if objective == "Random" then
            local filtered = {}
            for _, v in ipairs(validObjectives) do
                if v ~= "Random" then table.insert(filtered, v) end
            end
            objective = (#filtered > 0) and filtered[math.random(1, #filtered)] or "Skirmish"
        end

        local function SelectionStillCurrent()
            local liveConfig = CONFIG
                and CONFIG.Lobby
                and CONFIG.Lobby.Mission
                or nil

            local liveMission =
                (liveConfig and liveConfig.Name)
                or State_Mission.Name

            local liveObjective =
                (liveConfig and liveConfig.Objective)
                or State_Mission.Objective

            local liveDifficulty =
                (liveConfig and liveConfig.Difficulty)
                or State_Mission.Difficulty

            return missionSelectionVersion == selectionVersion
                and liveMission == currentMission
                and liveObjective == objective
                and liveDifficulty == selectedDifficulty
        end

        print(string.format("[Mission] Cycle => Map=%s | Obj=%s | Diff=%s", currentMission, objective, selectedDifficulty))

        if GetMyMission(0.2) then
            LeaveMission(true)
        end

        local targetDifficulty = selectedDifficulty
        local created = false

        if selectedDifficulty == "Hardest" then
            local level = GetPlayerLevel()
            local difficultyCycle
            if level >= 100 then
                difficultyCycle = {"Aberrant"}
            elseif level >= 60 then
                difficultyCycle = {"Aberrant", "Severe", "Hard", "Normal", "Easy"}
            elseif level >= 40 then
                difficultyCycle = {"Severe", "Hard", "Normal", "Easy"}
            else
                difficultyCycle = {"Hard", "Normal", "Easy"}
            end

            for _, diff in ipairs(difficultyCycle) do
                if not missionRunning or missionSessionId ~= mySession then return end
                if not SelectionStillCurrent() then return end

                created = CreateMission(currentMission, objective, diff)
                if created then
                    targetDifficulty = diff
                    Library:Notify("Found difficulty: " .. diff, 3)
                    break
                end
                LeaveMission(true)
                task.wait(0.15)
            end
        else
            created = CreateMission(currentMission, objective, targetDifficulty)
        end

        if not created then
            Library:Notify("Mission creation failed", 3)
            LeaveMission(true)
            return
        end

        if not missionRunning or missionSessionId ~= mySession or not SelectionStillCurrent() then
            LeaveMission(true)
            return
        end

        Library:Notify("Applying modifiers...", 2)
        ApplyMissionModifiers()

        if not missionRunning or missionSessionId ~= mySession or not SelectionStillCurrent() then
            LeaveMission(true)
            return
        end

        task.wait(0.3)

        if not missionRunning or missionSessionId ~= mySession or not SelectionStillCurrent() then
            LeaveMission(true)
            return
        end

        Library:Notify("Starting: " .. currentMission .. " (" .. targetDifficulty .. ")", 2)
        local started = StartMission()

        if started then
            Library:Notify("Mission started!", 3)
        else
            Library:Notify("Start failed after retries", 4)
            LeaveMission(true)
        end
    end

    local function MissionLoop(mySession)
        while missionRunning and missionSessionId == mySession do
            if missionBusy then
                task.wait(0.05)
                continue
            end
            missionBusy = true

            local ok, err = pcall(function()
                RunMissionCycle(mySession)
            end)

            if not ok then
                warn("[Mission] Error:", err)
                Library:Notify("Mission error - retrying", 3)
                pcall(function() LeaveMission(true) end)
            end

            missionBusy = false

            if missionRunning and missionSessionId == mySession then
                task.wait(1.5)
            end
        end
    end

    -- ═══════════════════════════════════════════════════════════
    -- UI
    -- ═══════════════════════════════════════════════════════════

    MissionTab:AddDropdown("MissionDropdown", {
        Values = {"Shiganshina","Trost","Outskirts","Forest","Utgard","Docks","Stohess","Chapel"},
        Default = State_Mission.Name,
        Text = "Mission",
        Callback = function(val)
            missionSelectionVersion += 1
            State_Mission.Name = val
            print("[Mission] Map selected:", val)
            local newObjs = MissionObjectives[val] or {"Skirmish"}
            State_Mission.Objective = newObjs[1]
            if Options and Options.MissionObjectiveDropdown then
                Options.MissionObjectiveDropdown:SetValues(newObjs)
                Options.MissionObjectiveDropdown:SetValue(newObjs[1])
            end
        end
    })

    MissionTab:AddDropdown("MissionObjectiveDropdown", {
        Values = MissionObjectives[State_Mission.Name] or {"Skirmish"},
        Default = State_Mission.Objective,
        Text = "Objective",
        Callback = function(val)
            State_Mission.Objective = val
        end
    })

    MissionTab:AddDropdown("MissionDifficultyDropdown", {
        Values = {"Easy","Normal","Hard","Severe","Aberrant","Hardest"},
        Default = State_Mission.Difficulty,
        Text = "Mode",
        Callback = function(val)
            State_Mission.Difficulty = val
        end
    })

    MissionTab:AddDropdown("MissionModifiersDropdown", {
        Values = ModifiersList,
        Default = {},
        Multi = true,
        Text = "Modifiers",
        Callback = function() end
    })

    MissionTab:AddSlider("MissionDelaySlider", {
        Text = "Delay",
        Default = MissionDelay,
        Min = 0,
        Max = 60,
        Rounding = 0,
        Callback = function(v)
            MissionDelay = v
        end
    })

    local activeAutoContent = nil

    local missionToggle = MissionTab:AddToggle("AutoStartMissionToggle", {
        Text = "Start Mission",
        Default = false,
        Callback = function(v)
            if v then
                if missionRunning or missionPendingStart then return end
                if activeAutoContent ~= nil then
                    Library:Notify("Select one Toggle", 2)
                    pcall(function()
                        if Options and Options.AutoStartMissionToggle then
                            Options.AutoStartMissionToggle:SetValue(false)
                        end
                    end)
                    return
                end

                print("[Mission] START TOGGLE = ON")
                getgenv().MissionStarting = true
                Library:Notify("Starting Mission Auto...", 2)
                activeAutoContent = "mission"
                missionPendingStart = true

                missionStartTask = task.spawn(function()
                    if not missionPendingStart then return end

                    missionRunning = true
                    getgenv().MissionStarting = true
                    missionBusy = false
                    missionSessionId += 1
                    local session = missionSessionId

                    print("[Mission] missionRunning = true | session =", session)

                    task.spawn(function()
                        local ok, err = pcall(function()
                            MissionLoop(session)
                        end)
                        if not ok then
                            warn("[Mission] MissionLoop Error:", err)
                        end
                    end)

                    missionPendingStart = false
                end)
            else
                missionPendingStart = false
                if missionStartTask then
                    pcall(function() task.cancel(missionStartTask) end)
                    missionStartTask = nil
                end
                missionRunning = false
                getgenv().MissionStarting = false
                missionBusy = false
                missionSessionId += 1
                pcall(function() LeaveMission(true) end)
                if activeAutoContent == "mission" then
                    activeAutoContent = nil
                end
            end
        end
    })

        local WavesTab = AutoMissionTabbox:AddTab("Waves")

    local wavesRunning = false
    local wavesBusy = false
    local wavesSessionId = 0
    local wavesDelay = 0
    local wavesCooldownUntil = 0  
        local function CreateWaveWithRetry()
        local maxRetries = 3
        for attempt = 1, maxRetries do
            if not wavesRunning then return false end
            local success, _ = SafeMissionCall("S_Missions", "Create", {
                Difficulty = "Easy",
                Type = "Waves",
                Name = "Trost",
                Objective = "Waves"
            })
            if success then
                task.wait(0.05)
                return true
            end
            if attempt < maxRetries then
                Library:Notify(string.format("Wave creation failed, retry %d/%d in 3s", attempt, maxRetries), 2)
                task.wait(3)
            else
                Library:Notify("Wave creation failed after 3 attempts, stopping", 3)
                return false
            end
        end
        return false
    end

        local function CreateWave()
        return CreateWaveWithRetry()
    end

    local function StartWave()
        if not wavesRunning then return end
        task.wait(0.1)
        SafeMissionCall("S_Missions", "Start")
    end

    local function LeaveWave()
        SafeMissionCall("S_Missions", "Leave")
    end

    local function WavesLoop(mySession)
        task.wait(1)
        
        while wavesRunning and wavesSessionId == mySession do
                        local now = tick()
            if now < wavesCooldownUntil then
                local remaining = math.ceil(wavesCooldownUntil - now)
                if remaining > 0 then
                    task.wait(remaining)
                end
                continue
            end
            
            if wavesBusy then
                task.wait(0.05)
                continue
            end
            wavesBusy = true

            CreateWave()
            task.wait(0.2)

            if not wavesRunning then 
                wavesBusy = false
                break 
            end

            Library:Notify("Creating wave", 2)
            Library:Notify("Starting wave", 2)
            StartWave()

            local startTick = tick()
            repeat
                task.wait(0.05)
                if not wavesRunning or wavesSessionId ~= mySession then break end
            until tick() - startTick >= 0.45

                        if wavesDelay > 0 then
                wavesCooldownUntil = tick() + wavesDelay
            end

            wavesBusy = false
        end
    end

        WavesTab:AddSlider("WavesDelaySlider", {
        Text = "Wave Delay",
        Default = 0,
        Min = 0,
        Max = 60,
        Rounding = 0,
        Suffix = " sec",
        Callback = function(v)
            wavesDelay = v
        end
    })

        local wavesPendingStart = false
    local wavesStartTask = nil

    local wavesToggle = WavesTab:AddToggle("AutoWavesToggle", {
        Text = "Start Waves",
        Default = false,
        Callback = function(v)
            if v then
                if wavesRunning or wavesPendingStart then return end
                if activeAutoContent ~= nil then
                    Library:Notify("Select one Toggle", 2)
                    pcall(function()
                        if Options and Options.AutoWavesToggle then
                            Options.AutoWavesToggle:SetValue(false)
                        end
                    end)
                    return
                end
                activeAutoContent = "waves"
                wavesPendingStart = true
                wavesStartTask = task.spawn(function()
                    while wavesPendingStart do
                        if isUIActive() then
                            Library:Notify("Content Ready (Waves)", 2)
                            break
                        end
                        task.wait(0.5)
                    end
                    if wavesPendingStart then
                                                if wavesDelay > 0 then
                            wavesCooldownUntil = tick() + wavesDelay
                            Library:Notify(string.format("Wave cooldown started: %d seconds", wavesDelay), 2)
                        end
                        wavesRunning = true
                        wavesBusy = false
                        wavesSessionId = wavesSessionId + 1
                        local mySession = wavesSessionId
                        task.spawn(function()
                            WavesLoop(mySession)
                        end)
                    end
                    wavesPendingStart = false
                end)
            else
                wavesPendingStart = false
                if wavesStartTask then task.cancel(wavesStartTask) end
                wavesRunning = false
                wavesBusy = false
                wavesSessionId = wavesSessionId + 1
                wavesCooldownUntil = 0                  LeaveWave()
                if activeAutoContent == "waves" then activeAutoContent = nil end
            end
        end
    })

end
if IsLobbyLobby() then
    local UpgradeTabbox = Tabs.Session:AddLeftTabbox("Auto Upgrade")

        local activeUpgradeType = nil 

        local function switchToBlades()
        local Event = game:GetService("ReplicatedStorage").Assets.Remotes.GET
        local Result = Event:InvokeServer(
            "S_Equipment",
            "Weapon",
            "Blades"
        )
                return true
    end

    local function switchToSpears()
        local Event = game:GetService("ReplicatedStorage").Assets.Remotes.GET
        local Result = Event:InvokeServer(
            "S_Equipment",
            "Weapon",
            "Spears"
        )
                return true
    end

        local function parseCurrencyText(text)
        if not text or text == "" then return 0 end
        local t = tostring(text):gsub(",", ""):upper():gsub("%s+", "")
        local num = tonumber(t:match("[%d%.]+")) or 0
        if t:find("B") then
            num = num * 1e9
        elseif t:find("M") then
            num = num * 1e6
        elseif t:find("K") then
            num = num * 1e3
        end
        return math.floor(num)
    end

    local function getGoldAmount()
        -- Prefer server data (reliable)
        local gold = 0
        pcall(function()
            local data = GET:InvokeServer("Data", "Copy")
            if data and data.Slots then
                local slotKey = data.Current_Slot or "A"
                local slot = data.Slots[slotKey]
                if slot and slot.Currency and type(slot.Currency.Gold) == "number" then
                    gold = slot.Currency.Gold
                    return
                end
            end
        end)
        if gold > 0 then return gold end

        -- Fallback: UI scrape with proper M/K/B parsing
        pcall(function()
            local player = game:GetService("Players").LocalPlayer
            local topbar = player.PlayerGui.Interface.Topbar.Main.Currencies
            if topbar then
                local goldLabel = topbar.Gold and topbar.Gold:FindFirstChild("Amount")
                if goldLabel and goldLabel.Text then
                    gold = parseCurrencyText(goldLabel.Text)
                end
            end
        end)
        return gold
    end

        local function isUpgradeReady()
        local player = game:GetService("Players").LocalPlayer
        local ready = false
        pcall(function()
            local equipment = player.PlayerGui.Interface:FindFirstChild("Equipment")
            if equipment then
                local statusLabel = equipment:FindFirstChild("Status") 
                                    or equipment:FindFirstChild("ReadyLabel")
                if statusLabel and statusLabel:IsA("TextLabel") then
                    if statusLabel.Text and statusLabel.Text:find("Ready") then
                        ready = true
                    end
                else
                    ready = true
                end
            else
                ready = true
            end
        end)
        return ready
    end

        local BladeTab = UpgradeTabbox:AddTab("Blade")

    getgenv().AutoUpgradeBlade = false
    getgenv().UpgradeRunning = false
    getgenv().BladeUpgradeDelay = 0

    local ALL_BLADE_STATS = {
        "ODM_Gas", "ODM_Speed", "ODM_Range", "ODM_Control",
        "Crit_Damage", "ODM_Damage", "Crit_Chance", "Blade_Durability"
    }

    local function batchUpgradeBlade()
        if not GET then return false end
        local args = { "S_Equipment", "Upgrade", ALL_BLADE_STATS }
        local success = pcall(function()
            GET:InvokeServer(unpack(args))
        end)
        return success
    end

    BladeTab:AddSlider("BladeUpgradeDelaySlider", {
        Text = "Upgrade Delay (seconds)",
        Default = 0,
        Min = 0,
        Max = 60,
        Rounding = 0,
        Callback = function(v)
            getgenv().BladeUpgradeDelay = v
        end
    })

    BladeTab:AddToggle("AutoUpgradeBladeToggle", {
        Text = "Auto Upgrade Blade",
        Default = false,
        Callback = function(state)
            if state then
                if activeUpgradeType == "spear" then
                    Library:Notify("Cannot enable Blade upgrade because Thunder Spear upgrade is already running. Please disable Thunder Spear upgrade first.", 4)
                    pcall(function()
                        if Options and Options.AutoUpgradeBladeToggle then
                            Options.AutoUpgradeBladeToggle:SetValue(false)
                        end
                    end)
                    return
                end
                                local success = switchToBlades()
                if not success then
                    Library:Notify("Failed to switch weapon to Blades. Upgrade may not work properly.", 4)
                else
                    Library:Notify("Switched weapon to Blades. Starting auto upgrade.", 3)
                end
                activeUpgradeType = "blade"
                getgenv().AutoUpgradeBlade = true
            else
                getgenv().AutoUpgradeBlade = false
                if activeUpgradeType == "blade" then
                    activeUpgradeType = nil
                end
            end

            if state and not getgenv().UpgradeRunning then
                getgenv().UpgradeRunning = true
                task.spawn(function()
                    while getgenv().AutoUpgradeBlade do
                        local ready = isUpgradeReady()
                        local gold = getGoldAmount()
                        local delay = getgenv().BladeUpgradeDelay

                        if ready and gold >= 1000 then
                            batchUpgradeBlade()
                            if delay > 0 then
                                task.wait(delay)
                            else
                                task.wait()
                            end
                        else
                            task.wait(2)
                        end
                    end
                    getgenv().UpgradeRunning = false
                end)
            end
        end
    })

        local SpearTab = UpgradeTabbox:AddTab("Thunder Spear")

    getgenv().AutoUpgradeSpear = false
    getgenv().SpearUpgradeRunning = false
    getgenv().SpearUpgradeDelay = 0

    local ALL_SPEAR_STATS = {
        "Blast_Radius",
        "TS_Damage",
        "TS_Gas",
        "TS_Range",
        "TS_Control",
        "Crit_Chance",
        "Crit_Damage",
        "TS_Speed"
    }

    local function batchUpgradeSpear()
        if not GET then return false end
        local args = { "S_Equipment", "Upgrade", ALL_SPEAR_STATS }
        local success = pcall(function()
            GET:InvokeServer(unpack(args))
        end)
        return success
    end

    SpearTab:AddSlider("SpearUpgradeDelaySlider", {
        Text = "Upgrade Delay (seconds)",
        Default = 0,
        Min = 0,
        Max = 60,
        Rounding = 0,
        Callback = function(v)
            getgenv().SpearUpgradeDelay = v
        end
    })

    SpearTab:AddToggle("AutoUpgradeSpearToggle", {
        Text = "Auto Upgrade Thunder Spear",
        Default = false,
        Callback = function(state)
            if state then
                if activeUpgradeType == "blade" then
                    Library:Notify("Cannot enable Thunder Spear upgrade because Blade upgrade is already running. Please disable Blade upgrade first.", 4)
                    pcall(function()
                        if Options and Options.AutoUpgradeSpearToggle then
                            Options.AutoUpgradeSpearToggle:SetValue(false)
                        end
                    end)
                    return
                end
                                local success = switchToSpears()
                if not success then
                    Library:Notify("Failed to switch weapon to Thunder Spear. Upgrade may not work properly.", 4)
                else
                    Library:Notify("Switched weapon to Thunder Spear. Starting auto upgrade.", 3)
                end
                activeUpgradeType = "spear"
                getgenv().AutoUpgradeSpear = true
            else
                getgenv().AutoUpgradeSpear = false
                if activeUpgradeType == "spear" then
                    activeUpgradeType = nil
                end
            end

            if state and not getgenv().SpearUpgradeRunning then
                getgenv().SpearUpgradeRunning = true
                task.spawn(function()
                    while getgenv().AutoUpgradeSpear do
                        local ready = isUpgradeReady()
                        local gold = getGoldAmount()
                        local delay = getgenv().SpearUpgradeDelay

                        if ready and gold >= 1000 then
                            batchUpgradeSpear()
                            if delay > 0 then
                                task.wait(delay)
                            else
                                task.wait()
                            end
                        else
                            task.wait(2)
                        end
                    end
                    getgenv().SpearUpgradeRunning = false
                end)
            end
        end
    })
end

if IsLobbyLobby() then
    local UnlockGroupLeft = Tabs.Session:AddLeftGroupbox("Unlock Skills")

    local branches = {
        ["Support Left"] = {
            ids = {
                "70","71","72","73","74","75","76","77","78","79",
                "80","81","82","83","84","85","86","87","88","89"
            }
        },
        ["Support Right"] = {
            ids = {
                "70","71","72","73","74","75","76","77","78","79",
                "80","90","91","92","93","94","95","96","97","98"
            }
        },
        ["Offense Left"] = {
            ids = {
                "1","2","3","4","5","6","7","8","9","10","11","12","13",
                "26","27","28","29","30","31","32","33","34","35","36","37"
            }
        },
        ["Offense Right"] = {
            ids = {
                "1","2","3","4","5","6","7","8","9","10","11","12","13",
                "14","15","16","17","18","19","20","21","22","23","24","25"
            }
        },
        ["Defense Left"] = {
            ids = {
                "38","39","40","41","42","43","44","45",
                "58","59","60","61","62","63","64","65","66","67","68","69"
            }
        },
        ["Defense Right"] = {
            ids = {
                "38","39","40","41","42","43","44","45",
                "46","47","48","49","50","51","52","53","54","55","56","57"
            }
        }
    }

    local selected = { Support = nil, Offense = nil, Defense = nil }
    local isUnlocking = false
    local unlockDelay = 0.08

    local function createDropdown(category, text)
        local dropdown = UnlockGroupLeft:AddDropdown(category .. "SideDropdown", {
            Text = text,
            Values = {"None", "Left", "Right"},
            Default = "None",
            Multi = false,
            Callback = function(v)
                if v == "None" then 
                    selected[category] = nil 
                else 
                    selected[category] = v 
                end
            end
        })
        return dropdown
    end

    local supportDropdown = createDropdown("Support", "Support Side")
    local offenseDropdown = createDropdown("Offense", "Offense Side")
    local defenseDropdown = createDropdown("Defense", "Defense Side")

    UnlockGroupLeft:AddSlider("UnlockDelaySlider", {
        Text = "Unlock Delay (sec)",
        Default = 0.08,
        Min = 0.01,
        Max = 1,
        Rounding = 2,
        Callback = function(v) unlockDelay = v end
    })

    UnlockGroupLeft:AddDivider()

    local function unlockSingleId(id, retryCount)
        retryCount = retryCount or 0
        local success, err = pcall(function()
            GET:InvokeServer("S_Equipment", "Unlock", { id })
        end)
        if not success and retryCount < 3 then
            task.wait(0.2)
            return unlockSingleId(id, retryCount + 1)
        end
        return success, err
    end

    local function unlockBranch(ids)
        for _, id in ipairs(ids) do
            unlockSingleId(id)
            task.wait(unlockDelay)
        end
    end

    local function showGoldAndWait()
        while not (Window and Window.Holder) do
            task.wait(0.1)
        end
        local goldAmount = 0
        -- Prefer server data
        pcall(function()
            local data = GET:InvokeServer("Data", "Copy")
            if data and data.Slots then
                local slotKey = data.Current_Slot or "A"
                local slot = data.Slots[slotKey]
                if slot and slot.Currency and type(slot.Currency.Gold) == "number" then
                    goldAmount = slot.Currency.Gold
                end
            end
        end)
        -- Fallback UI if still 0
        if goldAmount == 0 then
            pcall(function()
                local player = game:GetService("Players").LocalPlayer
                local goldLabel = player.PlayerGui.Interface.Topbar.Main.Currencies.Gold.Amount
                if goldLabel and goldLabel.Text then
                    local t = goldLabel.Text:gsub(",", ""):upper()
                    local num = tonumber(t:match("[%d%.]+")) or 0
                    if t:find("B") then num = num * 1e9
                    elseif t:find("M") then num = num * 1e6
                    elseif t:find("K") then num = num * 1e3 end
                    goldAmount = math.floor(num)
                end
            end)
        end
        Library:Notify(string.format("💰 Gold: %s", tostring(goldAmount)), 3)
        task.wait(0.2)
    end

    UnlockGroupLeft:AddToggle("UnlockSkillsToggle", {
        Text = "Start Unlock Skills Blades",
        Default = false,
        Callback = function(v)
            if not v then return end
            if isUnlocking then
                pcall(function()
                    if Options and Options.UnlockSkillsToggle then
                        Options.UnlockSkillsToggle:SetValue(false)
                    end
                end)
                return
            end

            showGoldAndWait()

            local queue = {}
            if selected.Defense then
                local side = selected.Defense
                local branchName = "Defense " .. side
                table.insert(queue, branches[branchName].ids)
            end
            if selected.Offense then
                local side = selected.Offense
                local branchName = "Offense " .. side
                table.insert(queue, branches[branchName].ids)
            end
            if selected.Support then
                local side = selected.Support
                local branchName = "Support " .. side
                table.insert(queue, branches[branchName].ids)
            end

            if #queue == 0 then
                pcall(function()
                    if Options and Options.UnlockSkillsToggle then
                        Options.UnlockSkillsToggle:SetValue(false)
                    end
                end)
                return
            end

            isUnlocking = true
            task.spawn(function()
                for i, ids in ipairs(queue) do
                    unlockBranch(ids)
                    if i < #queue then
                        task.wait(unlockDelay)
                    end
                end
                isUnlocking = false
                pcall(function()
                    if Options and Options.UnlockSkillsToggle then
                        Options.UnlockSkillsToggle:SetValue(false)
                    end
                end)
            end)
        end
    })

    -- ============================================================
    -- Auto Equip Skills
    -- Cobalt: GET "S_Equipment","Skill_State", slot(1-5), skillId(string)
    -- Only nodes with ID/Cooldown are bar skills (abilities).
    -- ============================================================
    local EquipSkillsGroup = Tabs.Session:AddLeftGroupbox("Auto Equip Skills")

    -- Load skill names from Modules.Storage.Skills
    local SkillIdToName = {}
    pcall(function()
        local mod = require(game:GetService("ReplicatedStorage").Modules.Storage.Skills)
        if type(mod) == "table" then
            for id, data in pairs(mod) do
                if type(data) == "table" and type(data.Tag) == "string" then
                    SkillIdToName[tostring(id)] = data.Tag
                    -- only real bar abilities have asset ID + cooldown
                    if data.ID and data.Cooldown then
                        SkillIdToName[tostring(id) .. "_ability"] = true
                    end
                end
            end
        end
    end)

    getgenv().SkillSlots = getgenv().SkillSlots or {
        [1] = "76", -- Red Flare
        [2] = "95", -- Black Flare
        [3] = "26", -- Rising Slash
        [4] = "7",  -- Blade Dance
        [5] = "3",  -- Hand Grinder
    }
    getgenv().AutoEquipSkills = getgenv().AutoEquipSkills or false
    getgenv().SkillEquipDelay = getgenv().SkillEquipDelay or 1.0

    for i = 1, 5 do
        local id = tostring(getgenv().SkillSlots[i] or "")
        local tag = SkillIdToName[id]
        local label = tag and string.format("Slot %d (%s)", i, tag) or ("Slot " .. i .. " Skill ID")
        EquipSkillsGroup:AddInput("SkillSlot" .. i, {
            Default = id,
            Numeric = false,
            Finished = true,
            Text = label,
            Placeholder = "e.g. 76",
            Callback = function(v)
                getgenv().SkillSlots[i] = tostring(v or ""):gsub("%s+", "")
            end
        })
    end

    EquipSkillsGroup:AddSlider("SkillEquipDelay", {
        Text = "Delay between slots (s)",
        Default = 1.0,
        Min = 0.3,
        Max = 2.5,
        Rounding = 2,
        Callback = function(v) getgenv().SkillEquipDelay = v end
    })

    local function equipAllSkills()
        local Event = game:GetService("ReplicatedStorage").Assets.Remotes.GET
        local delay = math.max(getgenv().SkillEquipDelay or 1.0, 0.5)

        Library:Notify("Equipping skills one-by-one...", 2)
        print("[Skills] ===== equip start =====")

        pcall(function()
            Event:InvokeServer("S_Equipment", "Skills")
        end)
        task.wait(0.6)

        local function equipSlot(slot, id)
            id = tostring(id)
            local name = SkillIdToName[id] or "?"
            local ok, res = pcall(function()
                return Event:InvokeServer("S_Equipment", "Skill_State", slot, id)
            end)
            print(string.format("[Skills] Slot %d → %s (%s) ok=%s res=%s",
                slot, id, name, tostring(ok), tostring(res)))
            return ok
        end

        local sent = 0
        for slot = 1, 5 do
            local id = getgenv().SkillSlots and getgenv().SkillSlots[slot]
            id = id and tostring(id):gsub("%s+", "") or ""
            if id ~= "" and id ~= "0" then
                for attempt = 1, 3 do
                    local ok = equipSlot(slot, id)
                    task.wait(delay)
                    if ok then break end
                    print(string.format("[Skills] retry slot %d attempt %d", slot, attempt + 1))
                    task.wait(0.4)
                end
                sent = sent + 1
                task.wait(0.5)
            end
        end

        Library:Notify(string.format("Finished %d slots — check skill bar", sent), 4)
        print("[Skills] ===== equip done =====")
    end

    EquipSkillsGroup:AddButton("Equip Skills Now", function()
        task.spawn(equipAllSkills)
    end)

    EquipSkillsGroup:AddToggle("AutoEquipSkillsToggle", {
        Text = "Auto Equip when Lobby loads",
        Default = false,
        Callback = function(v)
            getgenv().AutoEquipSkills = v
            if v then
                task.spawn(function()
                    task.wait(2.5)
                    if getgenv().AutoEquipSkills and IsLobbyLobby() then
                        equipAllSkills()
                    end
                end)
            end
        end
    })
end

if IsLobbyLobby() then

    local BoostGroup = Tabs.Lobby:AddRightGroupbox("Boost Selection")


-- ============================================================
-- Shadow Ban Checker (Attribute Auto Check)
-- ============================================================

local shadowBanWebhookURL = ""
local ShadowHttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local shadowBanEnabled = false
local shadowBanWebhookSent = false
local shadowBanChecking = false


local ShadowBanGroup = Tabs.Lobby:AddRightGroupbox("Shadow Ban Checker")


ShadowBanGroup:AddInput("ShadowBanWebhookURL", {
    Default = "",
    Numeric = false,
    Finished = true,
    Text = "Discord Webhook",
    Placeholder = "https://discord.com/api/webhooks/...",
    Callback = function(value)
        shadowBanWebhookURL = tostring(value or "")
    end
})


ShadowBanGroup:AddToggle("EnableShadowChecker", {
    Text = "Enable Shadow Checker",
    Default = false,
    Callback = function(value)
        shadowBanEnabled = value
    end
})


local function SendShadowBanWebhook(reason)

    if shadowBanWebhookURL == "" then
        warn("[Shadow Ban] Webhook not configured")
        return false
    end

    if shadowBanWebhookSent then
        return false
    end


    local requestFunction =
        (syn and syn.request)
        or (http and http.request)
        or http_request
        or request


    if not requestFunction then
        warn("[Shadow Ban] No request function")
        return false
    end


    local player = Players.LocalPlayer


    local body = ShadowHttpService:JSONEncode({
        content = "THIS ACCOUNT IS SHADOW BANNED !!",
        embeds = {{
            title = "🥀 Shadow Ban Detected",
            description = "**THIS ACCOUNT IS SHADOW BANNED !!**",
            fields = {
                {
                    name = "Username",
                    value = tostring(player.Name),
                    inline = true
                },
                {
                    name = "UserId",
                    value = tostring(player.UserId),
                    inline = true
                },
                {
                    name = "Reason",
                    value = tostring(reason),
                    inline = false
                }
            },
            footer = {
                text = "Shadow Ban Checker"
            },
            timestamp = DateTime.now():ToIsoDate()
        }}
    })


    local success, err = pcall(function()
        requestFunction({
            Url = shadowBanWebhookURL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = body
        })
    end)


    if success then
        shadowBanWebhookSent = true
    else
        warn("[Shadow Ban] Webhook failed:", err)
    end


    return success
end



local function CheckShadowBanAttributes()

    local player = Players.LocalPlayer


    local blacklisted =
        player:GetAttribute("Blacklisted") == true


    local exploiter =
        player:GetAttribute("Exploiter") == true



    if blacklisted then
        return true, "Blacklisted Attribute"
    end


    if exploiter then
        return true, "Exploiter Attribute"
    end


    return false, "Safe"

end




ShadowBanGroup:AddButton("Test Shadow Ban Webhook", function()

    if shadowBanWebhookURL == "" then
        Library:Notify("Enter webhook first.", 3)
        return
    end


    local requestFunction =
        (syn and syn.request)
        or (http and http.request)
        or http_request
        or request


    if not requestFunction then
        Library:Notify("No HTTP request available.", 3)
        return
    end


    local player = Players.LocalPlayer


    local body = ShadowHttpService:JSONEncode({
        content = "Shadow Ban Webhook Test",
        embeds = {{
            title = "Shadow Ban Webhook Test",
            fields = {{
                name = "Account",
                value = player.Name,
                inline = true
            }}
        }}
    })


    local success = pcall(function()

        requestFunction({
            Url = shadowBanWebhookURL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = body
        })

    end)


    if success then
        Library:Notify("Shadow webhook test sent.", 3)
    else
        Library:Notify("Webhook failed.", 3)
    end

end)




ShadowBanGroup:AddButton("Check Current Account", function()

    local banned, reason = CheckShadowBanAttributes()


    if banned then

        Library:Notify(
            "THIS ACCOUNT IS SHADOW BANNED !!",
            5
        )


        SendShadowBanWebhook(reason)


        pcall(function()
            StarterGui:SetCore("SendNotification", {
                Title = "Shadowban Checker",
                Text = "bratha u are NOT safe 🥀",
                Duration = 7
            })
        end)


    else

        Library:Notify(
            "Account is NOT Shadow Banned.",
            3
        )


    end

end)




task.spawn(function()

    task.wait(3)


    while Players.LocalPlayer do


        if shadowBanEnabled and not shadowBanChecking then

            shadowBanChecking = true


            local banned, reason =
                CheckShadowBanAttributes()



            if banned then


                Library:Notify(
                    "Shadow Ban Detected 🥀",
                    5
                )


                SendShadowBanWebhook(reason)


                pcall(function()
                    StarterGui:SetCore("SendNotification", {
                        Title = "Shadowban Checker",
                        Text = "bratha u are NOT safe 🥀",
                        Duration = 7
                    })
                end)


            end


            shadowBanChecking = false

        end


        task.wait(10)

    end

end)

    local purchaseAmount = 1
    local purchaseDelay = 0
    local isReady = false
    local pendingUseAfterPurchase = false
    local autoUseActive = false
    local autoUseTask = nil

    local ALL_BOOSTS = {
        "2X XP Boost [30M]", "2X Luck [30M]", "2X Gold [30M]",
        "2X XP Boost [1H]", "2X Luck [1H]", "2X Gold [1H]",
        "2X XP Boost [2H]", "2X Luck [2H]", "2X Gold [2H]"
    }

    local PRICE_MAP = {
        ["30M"] = 4499,
        ["1H"] = 7999,
        ["2H"] = 13999,
    }

    local function getBoostPrice(boostName)
        for duration, price in pairs(PRICE_MAP) do
            if boostName:find(duration) then
                return price
            end
        end
        return 0
    end

    local function formatNumberWithComma(num)
        local formatted = tostring(num)
        local k = 0
        for i = #formatted - 2, 1, -3 do
            k = k + 1
            formatted = formatted:sub(1, i) .. "," .. formatted:sub(i + 1)
        end
        return formatted
    end

    local BOOST_MAP = {
        ["2X XP Boost [30M]"] = {type = "xp", duration = "30M", id = 1},
        ["2X XP Boost [1H]"] = {type = "xp", duration = "1H", id = 2},
        ["2X XP Boost [2H]"] = {type = "xp", duration = "2H", id = 3},
        ["2X Luck [30M]"] = {type = "luck", duration = "30M", id = 4},
        ["2X Luck [1H]"] = {type = "luck", duration = "1H", id = 5},
        ["2X Luck [2H]"] = {type = "luck", duration = "2H", id = 6},
        ["2X Gold [30M]"] = {type = "gold", duration = "30M", id = 7},
        ["2X Gold [1H]"] = {type = "gold", duration = "1H", id = 8},
        ["2X Gold [2H]"] = {type = "gold", duration = "2H", id = 9},
    }

    local GET = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("GET")

    local function waitForUIMenu()
        while not (Window and Window.Holder) do
            task.wait(0.05)
        end
    end

    local function waitForTopbar()
        local player = game:GetService("Players").LocalPlayer
        local playerGui = player:WaitForChild("PlayerGui", 10)
        local interface = playerGui:WaitForChild("Interface", 10)
        local topbar = interface:WaitForChild("Topbar", 10)
        return topbar
    end

    local function checkCurrencies()
        local gemsAmount = 0
        local goldAmount = 0

        -- Prefer server data
        pcall(function()
            local data = GET:InvokeServer("Data", "Copy")
            if data and data.Slots then
                local slotKey = data.Current_Slot or "A"
                local slot = data.Slots[slotKey]
                if slot and slot.Currency then
                    if type(slot.Currency.Gold) == "number" then goldAmount = slot.Currency.Gold end
                    if type(slot.Currency.Gems) == "number" then gemsAmount = slot.Currency.Gems end
                end
            end
        end)

        if goldAmount > 0 or gemsAmount > 0 then
            return gemsAmount, goldAmount
        end

        -- Fallback UI with proper parsing
        pcall(function()
            local topbar = waitForTopbar()
            local main = topbar:FindFirstChild("Main")
            if main then
                local currencies = main:FindFirstChild("Currencies")
                if currencies then
                    local gemsLabel = currencies:FindFirstChild("Gems") and currencies.Gems:FindFirstChild("Amount")
                    local goldLabel = currencies:FindFirstChild("Gold") and currencies.Gold:FindFirstChild("Amount")
                    local function parse(t)
                        if not t then return 0 end
                        t = tostring(t):gsub(",", ""):upper()
                        local num = tonumber(t:match("[%d%.]+")) or 0
                        if t:find("B") then num = num * 1e9
                        elseif t:find("M") then num = num * 1e6
                        elseif t:find("K") then num = num * 1e3 end
                        return math.floor(num)
                    end
                    if gemsLabel and gemsLabel.Text then gemsAmount = parse(gemsLabel.Text) end
                    if goldLabel and goldLabel.Text then goldAmount = parse(goldLabel.Text) end
                end
            end
        end)
        return gemsAmount, goldAmount
    end

    local function startReadyCheck()
        task.spawn(function()
            waitForUIMenu()
            waitForTopbar()
            while true do
                local gemsAmount, goldAmount = checkCurrencies()
                if gemsAmount > 1 or goldAmount > 1 then
                    isReady = true
                else
                    isReady = false
                end
                task.wait(2)
            end
        end)
    end

    startReadyCheck()

    local function purchaseBoost(boostName)
        local data = BOOST_MAP[boostName]
        if not data then return false end
        if not isReady then return false end
        local args = {"S_Market", "Buy", "1_Boosts", data.id, purchaseAmount}
        return pcall(function() GET:InvokeServer(unpack(args)) end)
    end

    local function useBoost(boostName)
        local args = {"S_Inventory", "Item", boostName}
        return pcall(function() GET:InvokeServer(unpack(args)) end)
    end

    local function IsActuallyVisible(gui)
        if not gui or not gui:IsA("GuiObject") then return false end
        if not gui.Visible then return false end
        local current = gui.Parent
        while current do
            if current:IsA("GuiObject") and not current.Visible then return false end
            if current:IsA("ScreenGui") and not current.Enabled then return false end
            current = current.Parent
        end
        return true
    end

    local function isLobbyUIVisible()
        local interface = PlayerGui:FindFirstChild("Interface")
        if not interface then return false end
        local keyVisible = false
        local categoriesVisible = false
        local gearUp = interface:FindFirstChild("Gear_Up")
        if gearUp then
            local lobby = gearUp:FindFirstChild("Lobby")
            if lobby then
                local key = lobby:FindFirstChild("Key")
                if key then keyVisible = IsActuallyVisible(key) end
            end
        end
        local topbar = interface:FindFirstChild("Topbar")
        if topbar then
            local main = topbar:FindFirstChild("Main")
            if main then
                local categories = main:FindFirstChild("Categories")
                if categories then categoriesVisible = IsActuallyVisible(categories) end
            end
        end
        return keyVisible or categoriesVisible
    end

    local function startAutoUse()
        if autoUseTask then return end
        autoUseActive = true
        autoUseTask = task.spawn(function()
            while autoUseActive do
                if not isLobbyUIVisible() then
                    task.wait(0.1)
                    continue
                end

                if pendingUseAfterPurchase then
                    pendingUseAfterPurchase = false
                    local purchaseSelection = {}
                    pcall(function()
                        if Options and Options.Boost_ListDropdown and Options.Boost_ListDropdown.Value then
                            purchaseSelection = Options.Boost_ListDropdown.Value
                        end
                    end)
                    for boostName, enabled in pairs(purchaseSelection) do
                        if enabled and not autoUseActive then break end
                        if not isReady then 
                            task.wait(0.05)
                            break
                        end
                        useBoost(boostName)
                        task.wait(0.15)
                    end
                    if not autoUseActive then break end
                end

                local durations = {"2h", "1h", "30m"}
                local roundsPerDuration = 5
                for _, dur in ipairs(durations) do
                    if not autoUseActive then break end
                    for round = 1, roundsPerDuration do
                        if not autoUseActive then break end
                        if not isReady then
                            task.wait(0.05)
                            break
                        end
                        -- GOLD ONLY
                        local goldName = "2x Gold Boost [" .. dur .. "]"
                        useBoost(goldName)
                        task.wait()
                    end
                    if not autoUseActive then break end
                end
                break
            end
            autoUseActive = false
            pcall(function()
                if Options and Options.Boost_AutoUseToggle then
                    Options.Boost_AutoUseToggle:SetValue(false)
                end
            end)
            autoUseTask = nil
        end)
    end

    BoostGroup:AddDropdown("Boost_ListDropdown", {
        Text = " --- Select Boosts ---",
        Values = ALL_BOOSTS,
        Default = {},
        Multi = true,
        Callback = function() end
    })

    BoostGroup:AddSlider("Boost_AmountSlider", {
        Text = "Amount",
        Default = 1, Min = 1, Max = 50, Rounding = 0,
        Callback = function(v) purchaseAmount = v end
    })

    BoostGroup:AddSlider("Boost_DelaySlider", {
        Text = "Purchase Delay (seconds)",
        Default = 0, Min = 0, Max = 60, Rounding = 0,
        Callback = function(v) purchaseDelay = v end
    })

    BoostGroup:AddToggle("Boost_PurchaseToggle", {
        Text = "Purchase",
        Default = false,
        Callback = function(v)
            if v then
                task.wait(1)

                local purchaseSelection = {}
                pcall(function()
                    if Options and Options.Boost_ListDropdown and Options.Boost_ListDropdown.Value then
                        purchaseSelection = Options.Boost_ListDropdown.Value
                    end
                end)

                local selectedNames = {}
                for boostName, enabled in pairs(purchaseSelection) do
                    if enabled then
                        table.insert(selectedNames, boostName)
                    end
                end

                if #selectedNames == 0 then
                    pcall(function()
                        if Options and Options.Boost_PurchaseToggle then
                            Options.Boost_PurchaseToggle:SetValue(false)
                        end
                    end)
                    Library:Notify("Please select at least one boost to purchase!", 3)
                    return
                end

                if not isReady then
                    pcall(function()
                        if Options and Options.Boost_PurchaseToggle then
                            Options.Boost_PurchaseToggle:SetValue(false)
                        end
                    end)
                    Library:Notify("Currency not ready yet. Please wait.", 3)
                    return
                end

                task.spawn(function()
                    local successCount = 0
                    for boostName, enabled in pairs(purchaseSelection) do
                        if enabled then
                            if not isReady then break end
                            local ok = purchaseBoost(boostName)
                            if ok then successCount = successCount + 1 end
                            if purchaseDelay > 0 then task.wait(purchaseDelay) else task.wait(0.15) end
                        end
                    end
                    Library:Notify(string.format("Purchased %d boost(s).", successCount), 3)

                    if Options and Options.Boost_AutoUseToggle and Options.Boost_AutoUseToggle.Value then
                        pendingUseAfterPurchase = true
                        if not autoUseActive then
                            startAutoUse()
                        end
                    end

                    pcall(function()
                        if Options and Options.Boost_PurchaseToggle then
                            Options.Boost_PurchaseToggle:SetValue(false)
                        end
                    end)
                end)
            else
                
            end
        end
    })

    BoostGroup:AddToggle("Boost_AutoUseToggle", {
        Text = "Auto Use All Boosts",
        Default = false,
        Callback = function(v)
            if v then
                task.wait(1)

                if autoUseActive then 
                    return 
                end

                local purchaseEnabled = false
                pcall(function()
                    if Options and Options.Boost_PurchaseToggle then
                        purchaseEnabled = Options.Boost_PurchaseToggle.Value
                    end
                end)

                if purchaseEnabled then
                    pendingUseAfterPurchase = true
                else
                    startAutoUse()
                end
            else
                autoUseActive = false
                pendingUseAfterPurchase = false
                if autoUseTask then
                    task.cancel(autoUseTask)
                    autoUseTask = nil
                end
            end
        end
    })
end
if IsLobbyLobby() then
    local PrestigeGroup = Tabs.Session:AddRightGroupbox("Prestige")

        getgenv().PrestigeEnabled = false
    getgenv().SelectedBoost = "Gold Boost"
    getgenv().ForceGoldRequirement = false

        local DEFAULT_GOLD_REQUIREMENTS_M = {200, 400, 600, 800, 1000}
    getgenv().PrestigeGoldRequirement = {200, 400, 600, 800, 1000}
    
        local SLIDER_RANGES = {
        {min = 0,   max = 200}, 
        {min = 0,   max = 400}, 
        {min = 0,   max = 600},   
        {min = 0,   max = 800},  
        {min = 0,   max = 1000}, 
    }
    
        local function syncFromOptions()
        if Options then
            for i = 1, 5 do
                local optName = "GoldReq_"..(i-1).."to"..i
                if Options[optName] and Options[optName].Value ~= nil then
                    getgenv().PrestigeGoldRequirement[i] = Options[optName].Value
                else
                    getgenv().PrestigeGoldRequirement[i] = DEFAULT_GOLD_REQUIREMENTS_M[i]
                end
            end
            if Options.BoostDropdown and Options.BoostDropdown.Value then
                getgenv().SelectedBoost = Options.BoostDropdown.Value
            end
            if Options.ForceGoldToggle ~= nil then
                getgenv().ForceGoldRequirement = Options.ForceGoldToggle.Value or false
            end
            if Options.PrestigeToggle ~= nil then
                getgenv().PrestigeEnabled = Options.PrestigeToggle.Value or false
            end
        end
    end

    syncFromOptions()

    local MAX_LEVEL_FOR_PRESTIGE = {100, 125, 150, 175, 200}

    -- REAL talent IDs from ReplicatedStorage.Modules.Storage.Memories
    local TalentIdToName = {
        -- Offense
        [1] = "Blitzblade",
        [2] = "Crescendo",
        [3] = "Swiftshot",
        [30] = "Surgeshot",
        [4] = "Stalwart",
        [18] = "Stormcharged",
        [5] = "Furyforge",
        [6] = "Quakestrike",
        [19] = "Assassin",
        [20] = "Amputation",
        [31] = "Supernova",
        [21] = "Gambler",
        [29] = "Overslash",
        [32] = "Afterimages",
        -- Defense
        [7] = "Guardian",
        [8] = "Deflectra",
        [9] = "Aegisurge",
        [22] = "Riposte",
        [10] = "Vengeflare",
        [11] = "Resilience",
        [33] = "Steel Frame",
        [23] = "Necromantic",
        [24] = "Thanatophobia",
        -- Support
        [12] = "Mendmaster",
        [13] = "Cooldown Blitz",
        [14] = "Lifefeed",
        [15] = "Vitalize",
        [26] = "Gem Fiend",
        [16] = "Flashstep",
        [17] = "Omnirange",
        [25] = "Tactician",
        [27] = "Apotheosis",
        [28] = "Bloodthief",
    }

    -- also load live from module (stays correct if game adds talents)
    pcall(function()
        local mem = require(game:GetService("ReplicatedStorage").Modules.Storage.Memories)
        if type(mem) == "table" and type(mem.Talents) == "table" then
            for _, cat in pairs(mem.Talents) do
                if type(cat) == "table" then
                    for id, data in pairs(cat) do
                        if type(data) == "table" and type(data.Tag) == "string" then
                            local n = tonumber(id) or id
                            TalentIdToName[n] = data.Tag
                            TalentIdToName[tostring(id)] = data.Tag
                        end
                    end
                end
            end
        end
    end)

    -- string keys for every numeric entry
    for k, v in pairs(table.clone and table.clone(TalentIdToName) or TalentIdToName) do
        if type(k) == "number" then
            TalentIdToName[tostring(k)] = v
        end
    end
    -- safe string-key fill without table.clone dependency
    do
        local extra = {}
        for k, v in pairs(TalentIdToName) do
            if type(k) == "number" then extra[tostring(k)] = v end
        end
        for k, v in pairs(extra) do TalentIdToName[k] = v end
    end

    local AllTalents = {}
    local TalentByIndex = {} -- name lower -> name
    for id, name in pairs(TalentIdToName) do
        if type(id) == "number" then
            table.insert(AllTalents, name)
            TalentByIndex[string.lower(name)] = name
            TalentByIndex[id] = name
            TalentByIndex[tostring(id)] = name
        end
    end
    table.sort(AllTalents)

    local RemainingTalents = {}
    local function resetTalentPool()
        RemainingTalents = {}
        for _, t in ipairs(AllTalents) do table.insert(RemainingTalents, t) end
    end
    resetTalentPool()

    local function getRandomTalent()
        if #RemainingTalents == 0 then return nil end
        local idx = math.random(1, #RemainingTalents)
        local talent = RemainingTalents[idx]
        table.remove(RemainingTalents, idx)
        return talent
    end

    local PrestigeCooldown = 8
    local PrestigeRunning = false
    local lastPrestigeAttempt = 0
    local MIN_PRESTIGE_GAP = 12 -- hard min seconds between prestige remotes
    local lastProbedTalents = {} -- names from last successful Probe / fetch
    local lastProbedIds = {}     -- raw ids "26","1","12"
    local lastProbedTime = 0
    -- Send talent as ID (default) — names can be wrong vs game IDs and drain scrolls
    getgenv().PrestigeSendAs = getgenv().PrestigeSendAs or "Name"

        local lastGoldNotifyStep = -1
    local lastGoldNotifyStatus = nil

        local function parseCurrencyText(text)
        if not text or text == "" then return 0 end
        local t = tostring(text):gsub(",", ""):upper():gsub("%s+", "")
        local num = tonumber(t:match("[%d%.]+")) or 0
        if t:find("B") then
            num = num * 1e9
        elseif t:find("M") then
            num = num * 1e6
        elseif t:find("K") then
            num = num * 1e3
        end
        return math.floor(num)
    end

    -- Cache Data.Copy so we don't spam the server every 0.3s
    local slotCache = { slot = nil, data = nil, time = 0 }
    local SLOT_CACHE_TTL = 2.0 -- seconds

    local function getSlotData(forceRefresh)
        local now = tick()
        if not forceRefresh and slotCache.slot and (now - slotCache.time) < SLOT_CACHE_TTL then
            return slotCache.slot, slotCache.data
        end
        local ok, data = pcall(function()
            return GET:InvokeServer("Data", "Copy")
        end)
        if ok and data and type(data) == "table" and data.Slots then
            local slotKey = data.Current_Slot or Player:GetAttribute("Slot") or "A"
            local slot = data.Slots[slotKey]
            if slot then
                slotCache.slot = slot
                slotCache.data = data
                slotCache.time = now
                return slot, data
            end
        end
        -- keep old cache if fetch failed
        if slotCache.slot then
            return slotCache.slot, slotCache.data
        end
        return nil, nil
    end

    local function getGoldFromUI()
        local gold = 0
        pcall(function()
            local topbar = Player.PlayerGui.Interface.Topbar.Main.Currencies
            local goldLabel = topbar and topbar.Gold and topbar.Gold:FindFirstChild("Amount")
            if goldLabel and goldLabel.Text then
                gold = parseCurrencyText(goldLabel.Text)
            end
        end)
        return gold
    end

    local function getGold()
        local slot = getSlotData()
        if slot and slot.Currency and type(slot.Currency.Gold) == "number" then
            return slot.Currency.Gold
        end
        return getGoldFromUI()
    end

    local function getLevel()
        local slot = getSlotData()
        if slot and slot.Progression and type(slot.Progression.Level) == "number" then
            return slot.Progression.Level
        end
        local level = 0
        pcall(function()
            local levelLabel = Player.PlayerGui.Interface.Gear_Up.HUD.Level.Title
            if levelLabel and levelLabel.Text then
                level = tonumber(levelLabel.Text:match("%d+")) or 0
            end
        end)
        return level
    end

    local function getXPPercent()
        local slot = getSlotData()
        if slot and slot.Progression then
            local xp = slot.Progression.XP or 0
            local maxXp = slot.Progression.Max_XP or slot.Progression.MaxXP or 0
            if maxXp > 0 then
                return math.floor((xp / maxXp) * 100)
            end
            if slot.Progression.XPPercent then
                return tonumber(slot.Progression.XPPercent) or 0
            end
        end
        local percent = 0
        pcall(function()
            local xpLabel = Player.PlayerGui.Interface.Gear_Up.XP.Percentage
            if xpLabel and xpLabel.Text then
                percent = tonumber(xpLabel.Text:match("(%d+)%%")) or 0
            end
        end)
        return percent
    end

    local function getCurrentPrestige()
        local slot = getSlotData()
        if slot and slot.Progression and type(slot.Progression.Prestige) == "number" then
            return slot.Progression.Prestige
        end
        local attr = Player:GetAttribute("Prestige")
        if type(attr) == "number" then return attr end
        return 0
    end

    PrestigeGroup:AddSlider("GoldReq_0to1", { 
        Text = "       0 → 1  (200M)", 
        Default = getgenv().PrestigeGoldRequirement[1], 
        Min = SLIDER_RANGES[1].min, 
        Max = SLIDER_RANGES[1].max, 
        Rounding = 0, 
        Suffix = "M", 
        Callback = function(v) getgenv().PrestigeGoldRequirement[1] = math.floor(v) end 
    })
    PrestigeGroup:AddSlider("GoldReq_1to2", { 
        Text = "       1 → 2  (400M)", 
        Default = getgenv().PrestigeGoldRequirement[2], 
        Min = SLIDER_RANGES[2].min, 
        Max = SLIDER_RANGES[2].max, 
        Rounding = 0, 
        Suffix = "M", 
        Callback = function(v) getgenv().PrestigeGoldRequirement[2] = math.floor(v) end 
    })
    PrestigeGroup:AddSlider("GoldReq_2to3", { 
        Text = "       2 → 3  (600M)", 
        Default = getgenv().PrestigeGoldRequirement[3], 
        Min = SLIDER_RANGES[3].min, 
        Max = SLIDER_RANGES[3].max, 
        Rounding = 0, 
        Suffix = "M", 
        Callback = function(v) getgenv().PrestigeGoldRequirement[3] = math.floor(v) end 
    })
    PrestigeGroup:AddSlider("GoldReq_3to4", { 
        Text = "       3 → 4  (800M)", 
        Default = getgenv().PrestigeGoldRequirement[4], 
        Min = SLIDER_RANGES[4].min, 
        Max = SLIDER_RANGES[4].max, 
        Rounding = 0, 
        Suffix = "M", 
        Callback = function(v) getgenv().PrestigeGoldRequirement[4] = math.floor(v) end 
    })
    PrestigeGroup:AddSlider("GoldReq_4to5", { 
        Text = "       4 → 5  (1000M)", 
        Default = getgenv().PrestigeGoldRequirement[5], 
        Min = SLIDER_RANGES[5].min, 
        Max = SLIDER_RANGES[5].max, 
        Rounding = 0, 
        Suffix = "M", 
        Callback = function(v) getgenv().PrestigeGoldRequirement[5] = math.floor(v) end 
    })

    PrestigeGroup:AddDropdown("BoostDropdown", { 
        Values = {"Luck Boost","EXP Boost","Gold Boost"}, 
        Default = getgenv().SelectedBoost, 
        Text = "Boost", 
        Callback = function(v) getgenv().SelectedBoost = v end 
    })
    PrestigeGroup:AddDropdown("PrestigeSendAsDropdown", {
        Values = {"Name", "ID"},
        Default = getgenv().PrestigeSendAs or "Name",
        Text = "Send talent as",
        Callback = function(v) getgenv().PrestigeSendAs = v end
    })
    PrestigeGroup:AddSlider("PrestigeCooldownSlider", { 
        Text = "Delay (min 12s enforced)", 
        Default = PrestigeCooldown, 
        Min = 8, 
        Max = 30, 
        Rounding = 0, 
        Suffix = "s", 
        Callback = function(v) PrestigeCooldown = v end 
    })
    PrestigeGroup:AddToggle("ForceGoldToggle", { 
        Text = "Force Gold Requirement", 
        Default = getgenv().ForceGoldRequirement, 
        Callback = function(v) 
            getgenv().ForceGoldRequirement = v
            lastGoldNotifyStep = -1
            lastGoldNotifyStatus = nil
        end 
    })
    PrestigeGroup:AddToggle("PrestigeToggle", { 
        Text = "Auto Prestige", 
        Default = getgenv().PrestigeEnabled, 
        Callback = function(v) 
            getgenv().PrestigeEnabled = v
            if not v then
                lastGoldNotifyStep = -1
                lastGoldNotifyStatus = nil
            end
        end 
    })

        local lastStatusNotify = 0
    local lastStatusReason = nil

    local function canPrestige(currentPrestige, currentLevel, currentXP, currentGold)
        if currentPrestige >= 5 then return false, "max" end
        local requiredLevel = MAX_LEVEL_FOR_PRESTIGE[currentPrestige + 1] or 999
        if currentLevel < requiredLevel then return false, "level" end
        -- Only block on XP if we actually got a real % reading
        if currentXP > 0 and currentXP < 100 then return false, "xp" end
        if getgenv().ForceGoldRequirement then
            local requiredGoldM = getgenv().PrestigeGoldRequirement[currentPrestige + 1] or 0
            local requiredGold = requiredGoldM * 1000000
            if currentGold < requiredGold then return false, "gold" end
        end
        return true, "ok"
    end

    local function notifyStatus(reason, currentPrestige, currentLevel, currentXP, currentGold, force)
        local now = tick()
        if not force and reason == lastStatusReason and (now - lastStatusNotify) < 8 then
            return
        end
        lastStatusNotify = now
        lastStatusReason = reason

        local requiredLevel = MAX_LEVEL_FOR_PRESTIGE[currentPrestige + 1] or "?"
        local goldM = math.floor((currentGold or 0) / 1000000)
        local needM = getgenv().PrestigeGoldRequirement[currentPrestige + 1] or 0

        if reason == "max" then
            Library:Notify("Prestige already max (5). Auto Prestige off.", 4)
        elseif reason == "level" then
            Library:Notify(string.format("⏳ Need Lvl %s (have %d) | P%d→%d | XP %d%% | Gold %dM",
                tostring(requiredLevel), currentLevel, currentPrestige, currentPrestige + 1, currentXP, goldM), 5)
        elseif reason == "xp" then
            Library:Notify(string.format("⏳ Need XP 100%% (have %d%%) | Lvl %d | P%d→%d | Gold %dM",
                currentXP, currentLevel, currentPrestige, currentPrestige + 1, goldM), 5)
        elseif reason == "gold" then
            Library:Notify(string.format("💰 Need %dM gold (have %dM) | P%d→%d | Lvl %d | XP %d%%",
                needM, goldM, currentPrestige, currentPrestige + 1, currentLevel, currentXP), 5)
        elseif reason == "ok" then
            Library:Notify(string.format("✅ Ready P%d→%d | Lvl %d | XP %d%% | Gold %dM",
                currentPrestige, currentPrestige + 1, currentLevel, currentXP, goldM), 4)
        end
    end

    local function doPrestige(force)
        if not force and not getgenv().PrestigeEnabled then return false end

        -- One forced refresh, then all getters use the same cache
        getSlotData(true)
        local currentPrestige = getCurrentPrestige()
        local currentLevel = getLevel()
        local currentXP = getXPPercent()
        local currentGold = getGold()

        local can, reason = canPrestige(currentPrestige, currentLevel, currentXP, currentGold)

        if not can then
            notifyStatus(reason, currentPrestige, currentLevel, currentXP, currentGold, force)
            if reason == "max" and getgenv().PrestigeEnabled then
                getgenv().PrestigeEnabled = false
                pcall(function()
                    if Options and Options.PrestigeToggle then Options.PrestigeToggle:SetValue(false) end
                end)
            end
            return false
        end

        notifyStatus("ok", currentPrestige, currentLevel, currentXP, currentGold, true)

        -- Hard rate-limit: never spam Prestige remote
        local now = tick()
        if not force and (now - lastPrestigeAttempt) < MIN_PRESTIGE_GAP then
            return false
        end

        local Event = game:GetService("ReplicatedStorage").Assets.Remotes.GET

        ----------------------------------------------------------------
        local Event = game:GetService("ReplicatedStorage").Assets.Remotes.GET

        -- Fetch Next_Talents ids and map via Memories TalentIdToName
        local function fetchNextTalentIds()
            local ids = {}
            local ok, res = pcall(function()
                return Event:InvokeServer("S_Equipment", "Talents")
            end)
            if not ok or type(res) ~= "table" or type(res.Slots) ~= "table" then return ids end
            local key = res.Current_Slot or res.CurrentSlot or "A"
            local slot = res.Slots[key] or res.Slots["A"]
            local nextT = slot and slot.Next_Talents
            if type(nextT) ~= "table" then return ids end
            for _, id in pairs(nextT) do
                table.insert(ids, tostring(id))
            end
            return ids
        end

        local nextIds = fetchNextTalentIds()
        if #nextIds == 0 and #lastProbedIds > 0 and (tick() - lastProbedTime) < 90 then
            for _, id in ipairs(lastProbedIds) do table.insert(nextIds, id) end
        end
        if #nextIds == 0 then
            Library:Notify("No Next_Talents from server", 5)
            return false
        end

        lastProbedIds = {}
        for _, id in ipairs(nextIds) do table.insert(lastProbedIds, id) end
        lastProbedTime = tick()

        local parts = {}
        local talentName = nil
        for _, id in ipairs(nextIds) do
            local nm = TalentIdToName[tonumber(id)] or TalentIdToName[id] or TalentIdToName[tostring(id)]
            table.insert(parts, nm and (id .. "=" .. nm) or (id .. "=?"))
            if not talentName and nm then
                talentName = nm
            end
        end
        Library:Notify("Next_Talents: " .. table.concat(parts, ", "), 5)
        print("[Prestige] Next_Talents:", table.concat(parts, ", "))

        if not talentName then
            Library:Notify("Unknown talent ids [" .. table.concat(nextIds, ",") .. "] — not sending", 6)
            return false
        end

        local boostArg = getgenv().SelectedBoost or "Gold Boost"
        -- Cobalt: Boosts = "Gold Boost", Talents = "Furyforge"
        lastPrestigeAttempt = tick()
        task.wait(0.25)

        local ok, err = pcall(function()
            Event:InvokeServer("S_Equipment", "Prestige", {
                Boosts = boostArg,
                Talents = talentName,
            })
        end)

        if not ok then
            Library:Notify("Prestige remote error: " .. tostring(err), 5)
            return false
        end

        Library:Notify(string.format("Prestige sent once → %s | %s (waiting...)", talentName, boostArg), 5)

        -- Verify prestige actually increased
        task.wait(2.5)
        slotCache.time = 0
        getSlotData(true)
        local after = getCurrentPrestige()
        if after > currentPrestige then
            Library:Notify(string.format("✅ Prestige success P%d → P%d", currentPrestige, after), 5)
            if after >= 5 and getgenv().PrestigeEnabled then
                getgenv().PrestigeEnabled = false
                pcall(function()
                    if Options and Options.PrestigeToggle then Options.PrestigeToggle:SetValue(false) end
                end)
            end
        else
            Library:Notify(string.format("⚠️ Prestige did not apply (still P%d). Stopping auto to save scrolls.", after), 6)
            if getgenv().PrestigeEnabled then
                getgenv().PrestigeEnabled = false
                pcall(function()
                    if Options and Options.PrestigeToggle then Options.PrestigeToggle:SetValue(false) end
                end)
            end
        end

        lastStatusReason = nil
        lastGoldNotifyStep = -1
        lastGoldNotifyStatus = nil
        return after > currentPrestige
    end

    PrestigeGroup:AddButton("Check Prestige Status", function()
        task.spawn(function()
            getSlotData(true)
            local currentPrestige = getCurrentPrestige()
            local currentLevel = getLevel()
            local currentXP = getXPPercent()
            local currentGold = getGold()
            local can, reason = canPrestige(currentPrestige, currentLevel, currentXP, currentGold)
            lastStatusReason = nil
            notifyStatus(can and "ok" or reason, currentPrestige, currentLevel, currentXP, currentGold, true)
        end)
    end)

    PrestigeGroup:AddButton("Probe Next_Talents", function()
        task.spawn(function()
            local Event = game:GetService("ReplicatedStorage").Assets.Remotes.GET
            local ok, res = pcall(function()
                return Event:InvokeServer("S_Equipment", "Talents")
            end)
            if not ok or type(res) ~= "table" then
                Library:Notify("Talents fetch failed", 4)
                return
            end
            local key = res.Current_Slot or "A"
            local slot = res.Slots and (res.Slots[key] or res.Slots["A"])
            local nextT = slot and slot.Next_Talents
            local owned = slot and slot.Talents
            local function resolveList(arr)
                local parts = {}
                if type(arr) ~= "table" then return "?" end
                for _, id in pairs(arr) do
                    local nm = TalentIdToName[tonumber(id)] or TalentIdToName[tostring(id)]
                    table.insert(parts, nm and (tostring(id) .. "=" .. nm) or (tostring(id) .. "=?"))
                end
                return table.concat(parts, ", ")
            end
            local nextStr = resolveList(nextT)
            local ownedStr = resolveList(owned)
            print("[Probe] Next_Talents:", nextStr)
            print("[Probe] Owned:", ownedStr)
            Library:Notify("Next: " .. nextStr, 8)
            Library:Notify("Owned: " .. ownedStr, 6)
            lastProbedIds = {}
            if type(nextT) == "table" then
                for _, id in pairs(nextT) do table.insert(lastProbedIds, tostring(id)) end
                lastProbedTime = tick()
            end
        end)
    end)

    PrestigeGroup:AddButton("Force Prestige Now", function()
        Library:Notify("Forcing prestige (1 attempt)...", 2)
        task.spawn(function()
            doPrestige(true)
        end)
    end)

    task.spawn(function()
        while true do
            if not getgenv().PrestigeEnabled then
                PrestigeRunning = false
                task.wait(1)
                continue
            end

            if not PrestigeRunning then
                PrestigeRunning = true
                pcall(function() doPrestige(false) end)
                PrestigeRunning = false
            end

            -- slow loop: never faster than 12s hard gap
            local waitTime = math.max(PrestigeCooldown or 8, MIN_PRESTIGE_GAP)
            task.wait(waitTime)
        end
    end)
end
if IsLobbyLobby() then
    local AutoClaimGroup = Tabs.Session:AddLeftGroupbox("Auto Claims")
    
    getgenv().ClaimQuestEnabled = false
    getgenv().ClaimQuestRunning = false
    getgenv().ClaimAchievementEnabled = false
    getgenv().ClaimAchievementRunning = false
    getgenv().ClaimDelay = 0
    
    local statusLabel = AutoClaimGroup:AddLabel("Status: Checking...", true)
    
        local function parseCurrencyText(text)
        if not text or text == "" then return 0 end
        local t = tostring(text):gsub(",", ""):upper():gsub("%s+", "")
        local num = tonumber(t:match("[%d%.]+")) or 0
        if t:find("B") then num = num * 1e9
        elseif t:find("M") then num = num * 1e6
        elseif t:find("K") then num = num * 1e3 end
        return math.floor(num)
    end

    local function getCurrencyValues()
        local goldAmount = 0
        local gemsAmount = 0

        -- Prefer server data
        pcall(function()
            local data = GET:InvokeServer("Data", "Copy")
            if data and data.Slots then
                local slotKey = data.Current_Slot or "A"
                local slot = data.Slots[slotKey]
                if slot and slot.Currency then
                    if type(slot.Currency.Gold) == "number" then goldAmount = slot.Currency.Gold end
                    if type(slot.Currency.Gems) == "number" then gemsAmount = slot.Currency.Gems end
                end
            end
        end)

        if goldAmount > 0 or gemsAmount > 0 then
            return goldAmount, gemsAmount
        end

        -- Fallback UI
        pcall(function()
            local player = game:GetService("Players").LocalPlayer
            local topbar = player.PlayerGui.Interface.Topbar.Main.Currencies
            if topbar then
                local goldLabel = topbar.Gold and topbar.Gold:FindFirstChild("Amount")
                local gemsLabel = topbar.Gems and topbar.Gems:FindFirstChild("Amount")
                if goldLabel and goldLabel.Text then
                    goldAmount = parseCurrencyText(goldLabel.Text)
                end
                if gemsLabel and gemsLabel.Text then
                    gemsAmount = parseCurrencyText(gemsLabel.Text)
                end
            end
        end)
        return goldAmount, gemsAmount
    end
    
    local function isCurrenciesReady()
        local gold, gems = getCurrencyValues()
        return (gold > 0 or gems > 0)
    end
    
        task.spawn(function()
        while true do
            task.wait(1)
            pcall(function()
                local ready = isCurrenciesReady()
                if ready then
                    statusLabel:SetText("Status: Ready")
                else
                    statusLabel:SetText("Status: Not Ready (Waiting for Gold/Gems)")
                end
            end)
        end
    end)
    
    local QuestList = {
        {name="Novice Adventurer", category="Main"},{name="Seasoned Operative", category="Main"},{name="Master Of Missions", category="Main"},{name="Elite Taskmaster", category="Main"},{name="Legendary Quester", category="Main"},{name="Completionist", category="Main"},{name="Rookie Raider", category="Main"},{name="Raid Veteran", category="Main"},{name="Raid Commander", category="Main"},{name="Raid Warlord", category="Main"},{name="Raid Conqueror", category="Main"},{name="Precise Striker", category="Main"},{name="Critical Sniper", category="Main"},{name="Devastating Precision", category="Main"},{name="Critical Master", category="Main"},{name="Critical Legend", category="Main"},{name="Critical Demigod", category="Main"},{name="Novice Wrecker", category="Main"},{name="Demolition Expert", category="Main"},{name="Destruction Maestro", category="Main"},{name="Damage Dynamo", category="Main"},{name="Cataclysmic Force", category="Main"},{name="Devastation Virtuoso", category="Main"},{name="Titan Hunter", category="Main"},{name="Titan Slayer", category="Main"},{name="Titan Executioner", category="Main"},{name="Titan Butcher", category="Main"},{name="Titan Dominator", category="Main"},{name="Titan Conqueror", category="Main"},{name="Rookie Adventurer", category="Main"},{name="Seasoned Warrior", category="Main"},{name="Master Of Experience", category="Main"},{name="Legendary Ascendant", category="Main"},{name="Divine Prestige", category="Main"},{name="Ultimate Champion", category="Main"},{name="Prestige Aspirant", category="Main"},{name="Prestige Challenger", category="Main"},{name="Prestige Enthusiast", category="Main"},{name="Prestige Expert", category="Main"},
        {name="Casual Explorer", category="Side"},{name="Guardian Angel", category="Side"},{name="Penny Pincher", category="Side"},{name="Eye Of The Storm", category="Side"},{name="Shifting Apprentice", category="Side"},{name="Skill Novice", category="Side"},{name="Team Player", category="Side"},{name="Wealth Accumulator", category="Side"},{name="Rescuer Extraordinaire", category="Side"},{name="Teamwork Enthusiast", category="Side"},{name="Dedicated Adventurer", category="Side"},{name="Skill Practitioner", category="Side"},{name="Shifting Adept", category="Side"},{name="Leg Lacerator", category="Side"},{name="Treasure Hunter", category="Side"},{name="Seasoned Gamer", category="Side"},{name="Cooperative Expert", category="Side"},{name="Skill Expert", category="Side"},{name="Lifesaver Pro", category="Side"},{name="Shifting Expert", category="Side"},{name="Arm Annihilator", category="Side"},{name="Skill Master", category="Side"},{name="Titan Torturer", category="Side"},{name="Teamwork Specialist", category="Side"},{name="Fortune Hoarder", category="Side"},{name="Saving Supreme", category="Side"},{name="Endurance Champion", category="Side"},{name="Shifting Master", category="Side"},{name="Shifting Guru", category="Side"},{name="Titan Annihilator", category="Side"},{name="Teamwork Virtuoso", category="Side"},{name="Timeless Immortal", category="Side"},{name="Money Magician", category="Side"},{name="Skill Virtuoso", category="Side"},{name="Player's Champion", category="Side"},{name="Teamwork Maestro", category="Side"},{name="Skill Prodigy", category="Side"},{name="Legendary Superior", category="Side"},{name="Titan's Nightmare", category="Side"},{name="Ultimate Protector", category="Side"},{name="Ultimate Victor", category="Side"},{name="Shifting Virtuoso", category="Side"},
        {name="Daily 1", category="Daily"},{name="Daily 2", category="Daily"},{name="Daily 3", category="Daily"},
        {name="Weekly 1", category="Weekly"},{name="Weekly 2", category="Weekly"},{name="Weekly 3", category="Weekly"},{name="Weekly 4", category="Weekly"},
        {name="Towers", category="Spears"},{name="Escort", category="Spears"},{name="Ice Burst Stones", category="Spears"},{name="Retrieve Missing Supplies", category="Spears"},{name="Defend Missing Supplies", category="Spears"}
    }
    
        local function waitForCurrency()
        while not (Window and Window.Holder) do
            task.wait(0.2)
        end
        
        local gold, gems = 0, 0
        repeat
            task.wait(0.1)
            gold, gems = getCurrencyValues()
        until gold > 0 or gems > 0
    end
    
    local function claimAllQuests()
        while getgenv().ClaimQuestEnabled do
            for i, quest in ipairs(QuestList) do
                if not getgenv().ClaimQuestEnabled then break end
                pcall(function() SafeInvoke(GET, "Functions", "Quest", quest.name, quest.category) end)
                task.wait(0.1 + math.random()*0.03 + getgenv().ClaimDelay)
            end
        end
        getgenv().ClaimQuestRunning = false
    end
    
    local function claimAllAchievements()
                pcall(function()
            local GET = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("GET")
            GET:InvokeServer("S_Achievements", "Category", 5)
        end)
        task.wait(0.3)
        
        for id = 1, 71 do
            if not getgenv().ClaimAchievementEnabled then break end
            pcall(function() SafeInvoke(GET, "S_Achievements", "Claim", id) end)
            task.wait(0.1 + math.random()*0.03 + getgenv().ClaimDelay)
        end
        getgenv().ClaimAchievementEnabled = false
        getgenv().ClaimAchievementRunning = false
        pcall(function()
            if Options and Options.ClaimAchievementToggle then
                Options.ClaimAchievementToggle:SetValue(false)
            end
        end)
    end
    
    AutoClaimGroup:AddToggle("ClaimQuestToggle", {
        Text = "Claim Quest",
        Default = false,
        Callback = function(v)
            getgenv().ClaimQuestEnabled = v
            if v and not getgenv().ClaimQuestRunning then
                task.spawn(function()
                    task.wait(2)
                    waitForCurrency()
                    getgenv().ClaimQuestRunning = true
                    claimAllQuests()
                end)
            end
        end
    })
    
    AutoClaimGroup:AddToggle("ClaimAchievementToggle", {
        Text = "Claim Achievement",
        Default = false,
        Callback = function(v)
            getgenv().ClaimAchievementEnabled = v
            if v and not getgenv().ClaimAchievementRunning then
                task.spawn(function()
                    task.wait(2)
                    waitForCurrency()
                    getgenv().ClaimAchievementRunning = true
                    claimAllAchievements()
                end)
            end
        end
    })
    
    AutoClaimGroup:AddSlider("ClaimDelaySlider", {
        Text = "Claim Delay (sec)",
        Default = 0,
        Min = 0,
        Max = 60,
        Rounding = 1,
        Compact = false,
        Callback = function(v)
            getgenv().ClaimDelay = v
        end
    })
end
do
    local DETECTED_WEAPON = "Unknown"
    local detectionComplete = false
    
    task.spawn(function()
        while not detectionComplete do
            local success, weapon = pcall(function()
                local GET = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("GET")
                local data = GET:InvokeServer("Data", "Copy")
                local slot = data.Current_Slot or "A"
                return data.Slots[slot].Weapon or "Unknown"
            end)
            
            if success and weapon and weapon ~= "Unknown" then
                DETECTED_WEAPON = weapon
                
                local weaponLower = string.lower(tostring(weapon))
                
                if weaponLower:find("blade") or weaponLower:find("aottg") then
                    DETECTED_WEAPON = "Blade"
                elseif weaponLower:find("spear") or weaponLower:find("thunder") then
                    DETECTED_WEAPON = "Thunder Spear"
                end
                
                detectionComplete = true
            else
                task.wait(1)
            end
        end
    end)
    
    getgenv().GetDetectedWeapon = function()
        return DETECTED_WEAPON
    end
end

if IsIngameLobby() and Tabs.AutoFarm then
    local MiscGroup = Tabs.AutoFarm:AddLeftGroupbox("Misc")

        local StatsGui = nil
    local StatsEnabled = false
    local scaleFactor = 1

    local JESTER = {
        Background = Color3.fromHex("1c1c1c"),
        Accent = Color3.fromHex("db4467"),
        Font = Color3.fromHex("ffffff"),
        Outline = Color3.fromHex("373737")
    }

        getgenv().FarmTimerStarted = getgenv().FarmTimerStarted or false
    getgenv().FarmStartTime = getgenv().FarmStartTime or nil
    getgenv().FarmLastOnTime = getgenv().FarmLastOnTime or 0   
        local function IsActuallyVisible(gui)
        if not gui or not gui:IsA("GuiObject") then return false end
        if not gui.Visible then return false end
        local current = gui.Parent
        while current do
            if current:IsA("GuiObject") and not current.Visible then return false end
            if current:IsA("ScreenGui") and not current.Enabled then return false end
            current = current.Parent
        end
        return true
    end

        local function isObjectivesVisible()
        local player = game:GetService("Players").LocalPlayer
        local playerGui = player:FindFirstChild("PlayerGui")
        if not playerGui then return false end
        for _, v in ipairs(playerGui:GetDescendants()) do
            if v.Name == "Objectives" and IsActuallyVisible(v) then
                return true
            end
        end
        return false
    end

        local function waitForStableOn()
        local onCount = 0
        local startTime = tick()
        local maxDuration = 2
        local requiredCount = 10
        while tick() - startTime < maxDuration do
            if isObjectivesVisible() then
                onCount = onCount + 1
            else
                onCount = 0
            end
            if onCount >= requiredCount then
                return true
            end
            task.wait(0.05)
        end
        return false
    end

        local function startFarmTimerIfNeeded()
        if getgenv().FarmTimerStarted then return end
        if waitForStableOn() then
            getgenv().FarmTimerStarted = true
            getgenv().FarmStartTime = tick()
            getgenv().FarmLastOnTime = tick()
        end
    end

        local function getFarmElapsedTime()
        if getgenv().FarmTimerStarted and getgenv().FarmStartTime then
            return tick() - getgenv().FarmStartTime
        else
            return 0
        end
    end

        task.spawn(function()
        while true do
                        startFarmTimerIfNeeded()

                        if getgenv().FarmTimerStarted then
                if isObjectivesVisible() then
                    getgenv().FarmLastOnTime = tick()
                end
            end

            task.wait(0.5)
        end
    end)

        MiscGroup:AddSlider("UIScaleSlider", {
        Text = "UI Scale (%)",
        Default = 100,
        Min = 50,
        Max = 200,
        Rounding = 0,
        Suffix = "%",
        Callback = function(v)
            scaleFactor = v / 100
            if StatsEnabled and StatsGui then
                local scaleObj = StatsGui:FindFirstChild("UIScale")
                if scaleObj then
                    scaleObj.Scale = scaleFactor
                end
            end
        end
    })

    local function CreatePlayerStatsHUD()
        if StatsGui then
            StatsGui:Destroy()
            StatsGui = nil
        end

        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local LocalPlayer = Players.LocalPlayer
        local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

        local Gui = Instance.new("ScreenGui")
        Gui.Name = "TownShipPlayerStats"
        Gui.IgnoreGuiInset = true
        Gui.ResetOnSpawn = false
        Gui.Parent = PlayerGui
        StatsGui = Gui

        local uiScale = Instance.new("UIScale")
        uiScale.Scale = scaleFactor
        uiScale.Parent = Gui

        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(0, 520, 0, 116)
        Frame.Position = UDim2.new(0.5, -260, 0, 12)
        Frame.BackgroundColor3 = JESTER.Background
        Frame.BackgroundTransparency = 0.05
        Frame.BorderSizePixel = 0
        Frame.Parent = Gui

        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 10)
        Corner.Parent = Frame

        local Gradient = Instance.new("UIGradient")
        Gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, JESTER.Background),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(22, 22, 22))
        })
        Gradient.Rotation = 90
        Gradient.Parent = Frame

        local Stroke = Instance.new("UIStroke")
        Stroke.Color = JESTER.Accent
        Stroke.Thickness = 1.2
        Stroke.Transparency = 0.55
        Stroke.Parent = Frame

        local TimerTitle = Instance.new("TextLabel")
        TimerTitle.Size = UDim2.new(0, 170, 0, 20)
        TimerTitle.Position = UDim2.new(0, 14, 0, 10)
        TimerTitle.BackgroundTransparency = 1
        TimerTitle.Text = "FARM TIMER"
        TimerTitle.Font = Enum.Font.GothamSemibold
        TimerTitle.TextSize = 12
        TimerTitle.TextColor3 = JESTER.Font
        TimerTitle.TextXAlignment = Enum.TextXAlignment.Left
        TimerTitle.Parent = Frame

        local TimerValue = Instance.new("TextLabel")
        TimerValue.Size = UDim2.new(0, 200, 0, 42)
        TimerValue.Position = UDim2.new(0, 14, 0, 32)
        TimerValue.BackgroundTransparency = 1
        TimerValue.Text = "00:00:00"
        TimerValue.Font = Enum.Font.GothamBold
        TimerValue.TextSize = 34
        TimerValue.TextColor3 = JESTER.Font
        TimerValue.TextXAlignment = Enum.TextXAlignment.Left
        TimerValue.Parent = Frame

        local StatusTitle = Instance.new("TextLabel")
        StatusTitle.Size = UDim2.new(0, 170, 0, 16)
        StatusTitle.Position = UDim2.new(0, 14, 0, 80)
        StatusTitle.BackgroundTransparency = 1
        StatusTitle.Text = "STATUS:"
        StatusTitle.Font = Enum.Font.GothamMedium
        StatusTitle.TextSize = 10
        StatusTitle.TextColor3 = JESTER.Font
        StatusTitle.TextXAlignment = Enum.TextXAlignment.Left
        StatusTitle.Parent = Frame

        local StatusValue = Instance.new("TextLabel")
        StatusValue.Size = UDim2.new(0, 150, 0, 16)
        StatusValue.Position = UDim2.new(0, 65, 0, 80)
        StatusValue.BackgroundTransparency = 1
        StatusValue.Text = "OFF"
        StatusValue.Font = Enum.Font.GothamBold
        StatusValue.TextSize = 11
        StatusValue.TextColor3 = Color3.fromRGB(255, 100, 100)
        StatusValue.TextXAlignment = Enum.TextXAlignment.Left
        StatusValue.Parent = Frame

        local Divider = Instance.new("Frame")
        Divider.Size = UDim2.new(0, 1, 0, 90)
        Divider.Position = UDim2.new(0.5, -1, 0, 13)
        Divider.BackgroundColor3 = JESTER.Accent
        Divider.BackgroundTransparency = 0.65
        Divider.BorderSizePixel = 0
        Divider.Parent = Frame

        local StatsContainer = Instance.new("Frame")
        StatsContainer.Size = UDim2.new(0, 230, 0, 72)
        StatsContainer.Position = UDim2.new(1, -245, 0, 12)
        StatsContainer.BackgroundTransparency = 1
        StatsContainer.Parent = Frame

        local StatsTitle = Instance.new("TextLabel")
        StatsTitle.Size = UDim2.new(1, 0, 0, 20)
        StatsTitle.Position = UDim2.new(0, 0, 0, 0)
        StatsTitle.BackgroundTransparency = 1
        StatsTitle.Text = "PLAYER STATS"
        StatsTitle.Font = Enum.Font.GothamSemibold
        StatsTitle.TextSize = 12
        StatsTitle.TextColor3 = JESTER.Font
        StatsTitle.TextXAlignment = Enum.TextXAlignment.Right
        StatsTitle.Parent = StatsContainer

        local function MakeStatRow(name, xPos, yPos)
            local Holder = Instance.new("Frame")
            Holder.Size = UDim2.new(0, 105, 0, 18)
            Holder.Position = UDim2.new(0, xPos, 0, yPos)
            Holder.BackgroundTransparency = 1
            Holder.Parent = StatsContainer

            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(0, 45, 1, 0)
            Label.Position = UDim2.new(0, 0, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Text = name
            Label.Font = Enum.Font.GothamMedium
            Label.TextSize = 11
            Label.TextColor3 = JESTER.Font
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = Holder

            local Value = Instance.new("TextLabel")
            Value.Size = UDim2.new(0, 60, 1, 0)
            Value.Position = UDim2.new(0, 45, 0, 0)
            Value.BackgroundTransparency = 1
            Value.Text = "0"
            Value.Font = Enum.Font.GothamBold
            Value.TextSize = 13
            Value.TextColor3 = JESTER.Accent
            Value.TextXAlignment = Enum.TextXAlignment.Left
            Value.Parent = Holder

            return Value
        end

        local LevelVal = MakeStatRow("Level", 0, 28)
        local GemsVal  = MakeStatRow("Gems", 120, 28)
        local GoldVal  = MakeStatRow("Gold", 0, 52)

        local function FormatTime(sec)
            return string.format("%02d:%02d:%02d",
                math.floor(sec / 3600),
                math.floor((sec % 3600) / 60),
                math.floor(sec % 60))
        end

        task.spawn(function()
            while StatsEnabled and Gui.Parent do
                task.wait(0.15)
                
                local objectivesVisible = isObjectivesVisible()
                local elapsed = getFarmElapsedTime()
                TimerValue.Text = FormatTime(elapsed)
                
                if objectivesVisible then
                    StatusValue.Text = "ON"
                    StatusValue.TextColor3 = Color3.fromRGB(0, 255, 0)
                else
                    StatusValue.Text = "OFF"
                    StatusValue.TextColor3 = Color3.fromRGB(255, 100, 100)
                end
            end
        end)

        local function FormatNumber(num)
            if num >= 1e6 then
                return string.format("%.2fM", num / 1e6)
            elseif num >= 1e3 then
                return string.format("%.1fK", num / 1e3)
            else
                return tostring(num)
            end
        end

        local function UpdateStats(data)
            pcall(function()
                if data and data.Slots then
                    local slot = data.Current_Slot or "A"
                    local slotData = data.Slots[slot]

                    if slotData then
                        if slotData.Progression and slotData.Progression.Level then
                            LevelVal.Text = tostring(slotData.Progression.Level)
                        end

                        if slotData.Currency then
                            if slotData.Currency.Gold then
                                GoldVal.Text = FormatNumber(slotData.Currency.Gold)
                            end
                            if slotData.Currency.Gems then
                                GemsVal.Text = FormatNumber(slotData.Currency.Gems)
                            end
                        end
                    end
                end
            end)
        end

        local function FetchAndUpdate()
            task.spawn(function()
                pcall(function()
                    local remoteGET = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("GET")
                    local data = remoteGET:InvokeServer("Data", "Copy", LocalPlayer.UserId)
                    if data and type(data) == "table" then
                        UpdateStats(data)
                    end
                end)
            end)
        end

        task.spawn(function()
            while StatsEnabled and Gui.Parent do
                task.wait(5)
                FetchAndUpdate()
            end
        end)

        FetchAndUpdate()
    end

    MiscGroup:AddToggle("PlayerStatsToggle", {
        Text = "Player Stats",
        Default = false,
        Callback = function(v)
            StatsEnabled = v
            if v then
                CreatePlayerStatsHUD()
            else
                if StatsGui then
                    StatsGui:Destroy()
                    StatsGui = nil
                end
            end
        end
    })

        MiscGroup:AddDropdown("RenderModeDropdown", {
        Text = "FPS Performance",
        Values = {"Low Graphic", "Delete Map", "Disable 3D Render", "Disable Text DMG"},
        Default = {},
        Multi = true,
        Callback = function(v)
                        if v["Low Graphic"] then
                pcall(function()
                    game:GetService("Lighting").Brightness = 0
                    game:GetService("Lighting").GlobalShadows = false
                    game:GetService("Lighting").FogEnd = 0
                    settings().Rendering.QualityLevel = 1
                    game:GetService("Workspace").TintColor = Color3.new(0, 0, 0)
                    if sethiddenproperty then
                        sethiddenproperty(game:GetService("Workspace"), "Terrain", nil)
                    end
                end)
            else
                pcall(function()
                    game:GetService("Lighting").Brightness = 1
                    game:GetService("Lighting").GlobalShadows = true
                    game:GetService("Lighting").FogEnd = 100000
                    -- removed forced max graphics
                    game:GetService("Workspace").TintColor = Color3.new(1, 1, 1)
                end)
            end

                        if v["Delete Map"] then
                local climbable = workspace:FindFirstChild("Climbable")
                local unclimbable = workspace:FindFirstChild("Unclimbable")
                if climbable or unclimbable then
                    if climbable then
                        for _, child in ipairs(climbable:GetChildren()) do
                            pcall(function() child:Destroy() end)
                        end
                    end
                    if unclimbable then
                        local preserve = {Reloads = true, Objective = true, Cutscene = true}
                        for _, child in ipairs(unclimbable:GetChildren()) do
                            if not preserve[child.Name] then
                                pcall(function() child:Destroy() end)
                            end
                        end
                    end
                end
            end

                        if v["Disable 3D Render"] then
                pcall(function()
                    game:GetService("RunService"):Set3dRenderingEnabled(false)
                    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
                    for _, part in ipairs(workspace:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Material = Enum.Material.Plastic
                            part.Reflectance = 0
                        end
                    end
                end)
            else
                pcall(function()
                    game:GetService("RunService"):Set3dRenderingEnabled(true)
                    -- removed forced max graphics
                end)
            end

                        if v["Disable Text DMG"] then
                for i = 1, 5 do
                    pcall(function()
                        local args = {
                            "Functions",
                            "Settings",
                            "Damage_Indicator",
                            "Off"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("GET"):InvokeServer(unpack(args))
                    end)
                    task.wait(0.1)
                end
            else
                for i = 1, 5 do
                    pcall(function()
                        local args = {
                            "Functions",
                            "Settings",
                            "Damage_Indicator",
                            "On"
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("GET"):InvokeServer(unpack(args))
                    end)
                    task.wait(0.1)
                end
            end
        end
    })

        MiscGroup:AddSlider("FPSLimitSlider", {
        Text = "Set FPS",
        Default = 60,
        Min = 5,
        Max = 120,
        Rounding = 0,
        Suffix = " FPS",
        Callback = function(v)
            pcall(function()
                if setfpscap then
                    setfpscap(v)
                else
                    local fpsCap = syn and syn.set_fps_cap or (setfpscap and setfpscap)
                    if fpsCap then
                        fpsCap(v)
                    end
                end
            end)
        end
    })
end

if Tabs.AutoFarm then
    local SafetyGroup = Tabs.AutoFarm:AddRightGroupbox("Safety Settings")
    SafetyGroup:AddLabel(" -- 60s is safe! --")
    SafetyGroup:AddSlider("SafetyTimeSlider", {
        Text="--- End Missions ---", Default=60, Min=0, Max=60, Rounding=0,
        Callback=function(val)
            getgenv().SafetyTime = math.floor(val)
        end,
        Drag = true
    })
    
    getgenv().StopAtTitansLeft = getgenv().StopAtTitansLeft or 10
    
    SafetyGroup:AddSlider("StopAtTitansLeftSlider", {
        Text="Stop attacking when .. titans Left",
        Default = getgenv().StopAtTitansLeft,
        Min = 0,
        Max = 25,
        Rounding = 0,
        Callback = function(val)
            getgenv().StopAtTitansLeft = math.floor(val)
        end
    })
end
local PendingFarmStart = false
local syncingWeapon = false  
local function isObjectivesVisibleForFarm()
    local player = game:GetService("Players").LocalPlayer
    local playerGui = player:FindFirstChild("PlayerGui")
    if not playerGui then return false end
    
    local function IsActuallyVisible(gui)
        if not gui or not gui:IsA("GuiObject") then return false end
        if not gui.Visible then return false end
        local current = gui.Parent
        while current do
            if current:IsA("GuiObject") and not current.Visible then return false end
            if current:IsA("ScreenGui") and not current.Enabled then return false end
            current = current.Parent
        end
        return true
    end
    
    for _, v in ipairs(playerGui:GetDescendants()) do
        if v.Name == "Objectives" then
            if IsActuallyVisible(v) then
                return true
            end
        end
    end
    return false
end

local farmObjectivesReady = false
local lastObjectivesCheck = 0

local function updateFarmObjectivesStatus()
    if tick() - lastObjectivesCheck >= 0.5 then
        lastObjectivesCheck = tick()
        farmObjectivesReady = isObjectivesVisibleForFarm()
    end
    return farmObjectivesReady
end

---------- :farm tab: ----------
if Tabs.AutoFarm then
    local AutoFarmTabbox = Tabs.AutoFarm:AddLeftTabbox("Auto Farm")
    local G = getgenv()

    G.Farm = false
    G.AutoFarmBlade = false
    G.AutoReloadBlade = false
    G.AutoThunderSpear = false
    G.StartRejoin = false
    G.FarmMode = nil
    G.HoverSpeed = 120
    G.HoverHeight = 120
    G.SafetyTime = G.SafetyTime or 60
    G.LeaveMinimum = 1
    G.AttackInterval = 0.15
    G.KillHits = 9
    G.HitDistance = G.HitDistance or 80          -- hitbox expand size (studs)
    G.HitDistanceEnabled = G.HitDistanceEnabled ~= false  -- default ON

    G.ThunderSpearFarmMode = "Tween"
    G.ThunderSpearHoverSpeed = 120
    G.ThunderSpearHoverHeight = 120
    G.ThunderSpearFirePower = 8
    G.ThunderSpearExplodeRadius = 0.13

    local FarmConn = nil
    local SpearFarmConn = nil

    task.spawn(function()
        while true do
            task.wait(5)
            pcall(function()
                if G.GetDetectedWeapon then
                    local oldWeapon = G.GetDetectedWeapon()
                    G.GetDetectedWeapon()
                    local newWeapon = G.GetDetectedWeapon()
                    
                    if oldWeapon ~= newWeapon and not syncingWeapon then
                        syncingWeapon = true
                        
                        if newWeapon == "Blade" then
                            if G.AutoThunderSpear then
                                if Options and Options.AutoThunderSpearToggle then
                                    pcall(function() Options.AutoThunderSpearToggle:SetValue(false) end)
                                end
                                if Options and Options.AutoFarmBlade then
                                    pcall(function() Options.AutoFarmBlade:SetValue(true) end)
                                end
                            end
                        elseif newWeapon == "Thunder Spear" then
                            if G.AutoFarmBlade then
                                if Options and Options.AutoFarmBlade then
                                    pcall(function() Options.AutoFarmBlade:SetValue(false) end)
                                end
                                if Options and Options.AutoThunderSpearToggle then
                                    pcall(function() Options.AutoThunderSpearToggle:SetValue(true) end)
                                end
                            end
                        end
                        
                        syncingWeapon = false
                    end
                end
            end)
        end
    end)
    
    local function getCurrentWeapon()
        return G.GetDetectedWeapon and G.GetDetectedWeapon() or "Unknown"
    end
    
    local function isBlade()
        return getCurrentWeapon() == "Blade"
    end
    
    local function isThunderSpear()
        return getCurrentWeapon() == "Thunder Spear"
    end

    local function resolveConflictingToggles()
        if syncingWeapon then return end
        if G.AutoFarmBlade and G.AutoThunderSpear then
            if isBlade() then
                G.AutoThunderSpear = false
                pcall(function()
                    if Options and Options.AutoThunderSpearToggle then
                        Options.AutoThunderSpearToggle:SetValue(false)
                    end
                end)
            elseif isThunderSpear() then
                G.AutoFarmBlade = false
                G.Farm = false
                PendingFarmStart = false
                pcall(function()
                    if Options and Options.AutoFarmBlade then
                        Options.AutoFarmBlade:SetValue(false)
                    end
                end)
            else
                G.AutoFarmBlade = false
                G.AutoThunderSpear = false
                G.Farm = false
                PendingFarmStart = false
                pcall(function()
                    if Options and Options.AutoFarmBlade then
                        Options.AutoFarmBlade:SetValue(false)
                    end
                    if Options and Options.AutoThunderSpearToggle then
                        Options.AutoThunderSpearToggle:SetValue(false)
                    end
                end)
            end
        end
    end

    local function waitForUI()
        local waited = 0
        while not (Window and Window.Holder) and waited < 1 do
            task.wait(0.05)
            waited = waited + 0.05
        end
    end

    local BladeTab = AutoFarmTabbox:AddTab("Blade")

    BladeTab:AddDropdown("FarmModeDropdown", {
        Values = {"Tween","Teleport","No Movement"}, 
        Default = "",
        Multi = false, 
        Text = "Farm Select",
        Callback = function(val)
            if syncingWeapon then return end
            G.FarmMode = val

            if val == "No Movement" then
                CleanupSmoothMovement()

                local char = Player.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")

                if hrp then
                    pcall(function()
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        hrp.AssemblyAngularVelocity = Vector3.zero
                    end)
                end
            end
        end
    })

    BladeTab:AddSlider("HoverSpeedSlider", {
        Text="Hover Speed", Default=G.HoverSpeed, Min=50, Max=1000, Rounding=0,
        Callback=function(val) if not syncingWeapon then G.HoverSpeed = val end end
    })
    
    BladeTab:AddSlider("HoverHeightSlider", {
        Text="Hover Height", Default=G.HoverHeight, Min=0, Max=400, Rounding=0,
        Callback=function(val) if not syncingWeapon then G.HoverHeight = val end end
    })

    BladeTab:AddSlider("KillHitsSlider", {
        Text="Kill Hits", Default=9, Min=9, Max=9, Rounding=0,
        Callback=function(val)
            if not syncingWeapon then G.KillHits = val end
        end
    })

    BladeTab:AddToggle("AutoFarmBlade", {
        Text="Auto Farm Blade", Default=false,
        Callback=function(v)
            if syncingWeapon then return end
            if v then
                task.wait(0.5)
                
                if G.AutoThunderSpear then
                    if isThunderSpear() then
                        pcall(function()
                            if Options and Options.AutoThunderSpearToggle then
                                Options.AutoThunderSpearToggle:SetValue(false)
                            end
                        end)
                        pcall(function()
                            if Options and Options.AutoFarmBlade then
                                Options.AutoFarmBlade:SetValue(false)
                            end
                        end)
                        Library:Notify("⚠️ Cannot enable Blade because Thunder Spear is active!", 3)
                        return
                    else
                        G.AutoThunderSpear = false
                        pcall(function()
                            if Options and Options.AutoThunderSpearToggle then
                                Options.AutoThunderSpearToggle:SetValue(false)
                            end
                        end)
                    end
                end
                
                if not G.FarmMode
                    or (G.FarmMode ~= "Tween"
                        and G.FarmMode ~= "Teleport"
                        and G.FarmMode ~= "No Movement") then

                    pcall(function()
                        if Options and Options.AutoFarmBlade then
                            Options.AutoFarmBlade:SetValue(false)
                        end
                    end)

                    Library:Notify("⚠️ Please select Farm Mode (Tween/Teleport/No Movement) first!", 3)
                    return
                end
                
                G.AutoFarmBlade = true
                G.Farm = true
                G.FarmStartTime = tick()
                PendingFarmStart = false
                CurrentEntry = nil
                LastAttackTime = tick()
                
                if not FarmConn then
                    CreateFarmLoop()
                end
            else
                G.AutoFarmBlade = false
                G.Farm = false
                PendingFarmStart = false
                CurrentEntry = nil
                if FarmConn then
                    FarmConn:Disconnect()
                    FarmConn = nil
                end
                CleanupSmoothMovement()
                if CharRef then
                    for _, part in ipairs(CharParts) do
                        if part and part.Parent then
                            pcall(function()
                                part.CanCollide = true
                            end)
                        end
                    end
                    CharParts = {}
                    CharRef = nil
                end
                NapeCache = setmetatable({}, {__mode = "k"})
                LastTitanPosition = nil
                local char = Player.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        pcall(function()
                            hrp.AssemblyLinearVelocity = Vector3.zero
                            hrp.AssemblyAngularVelocity = Vector3.zero
                        end)
                    end
                end
                pcall(function()
                    if Options and Options.AutoFarmBlade then
                        Options.AutoFarmBlade:SetValue(false)
                    end
                end)
            end
        end
    })

    BladeTab:AddToggle("AutoReloadBlade", {
        Text="Auto Reload Blade", Default=false,
        Callback=function(v)
            if syncingWeapon then return end

            -- Enable immediately. The old version waited a full second here.
            G.AutoReloadBlade = v

            if not v then
                getgenv().IsReloading = false
                getgenv().IsRefilling = false
                reloadInProgress = false
                refillInProgress = false
                refillStage = 0
            end
        end
    })
    
    BladeTab:AddToggle("StartRejoin", {
        Text="Auto Retry", Default=false,
        Callback=function(v) 
            if syncingWeapon then return end
            if v then task.wait(1) end
            G.StartRejoin = v 
        end
    })

    local SpearTab = AutoFarmTabbox:AddTab("Thunder Spear")
    
    SpearTab:AddToggle("AutoThunderSpearToggle", {
        Text = "Auto Thunder Spear",
        Default = false,
        Callback = function(v)
            if syncingWeapon then return end
            if v then
                task.wait(0.5)
                
                if G.AutoFarmBlade then
                    if isBlade() then
                        pcall(function()
                            if Options and Options.AutoFarmBlade then
                                Options.AutoFarmBlade:SetValue(false)
                            end
                        end)
                        pcall(function()
                            if Options and Options.AutoThunderSpearToggle then
                                Options.AutoThunderSpearToggle:SetValue(false)
                            end
                        end)
                        Library:Notify("⚠️ Cannot enable Thunder Spear because Blade is active!", 3)
                        return
                    else
                        G.AutoFarmBlade = false
                        G.Farm = false
                        PendingFarmStart = false
                        pcall(function()
                            if Options and Options.AutoFarmBlade then
                                Options.AutoFarmBlade:SetValue(false)
                            end
                        end)
                    end
                end
                
                G.AutoThunderSpear = true
                G.SpearFarm = true
                G.FarmStartTime = tick()
                SpearCurrentEntry = nil
                LastSpearAttackTime = tick()
                
                if not SpearFarmConn then
                    CreateSpearFarmLoop()
                end
            else
                G.AutoThunderSpear = false
                G.SpearFarm = false
                SpearCurrentEntry = nil
                if SpearFarmConn then
                    SpearFarmConn:Disconnect()
                    SpearFarmConn = nil
                end
                CleanupSmoothMovement()
                if CharRef then
                    for _, part in ipairs(CharParts) do
                        if part and part.Parent then
                            pcall(function()
                                part.CanCollide = true
                            end)
                        end
                    end
                    CharParts = {}
                    CharRef = nil
                end
                NapeCache = setmetatable({}, {__mode = "k"})
                if type(ActiveTitans) == "table" then
                    table.clear(ActiveTitans)
                else
                    ActiveTitans = {}
                end
                LastTitanPosition = nil
                local char = Player.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        pcall(function()
                            hrp.AssemblyLinearVelocity = Vector3.zero
                            hrp.AssemblyAngularVelocity = Vector3.zero
                        end)
                    end
                end
                pcall(function()
                    if Options and Options.AutoThunderSpearToggle then
                        Options.AutoThunderSpearToggle:SetValue(false)
                    end
                end)
            end
        end
    })
    
    SpearTab:AddDivider()
    
    SpearTab:AddDropdown("ThunderSpear_FarmMode", {
        Values = {"Tween","Teleport"},
        Default = "Tween",
        Multi = false,
        Text = "Farm Mode",
        Callback = function(v) if not syncingWeapon then G.ThunderSpearFarmMode = v end end
    })
    
    SpearTab:AddSlider("ThunderSpear_HoverSpeed", {
        Text="Hover Speed", Default=120, Min=50, Max=1000, Rounding=0,
        Callback=function(v) if not syncingWeapon then G.ThunderSpearHoverSpeed = v end end
    })
    
    SpearTab:AddSlider("ThunderSpear_HoverHeight", {
        Text="Hover Height", Default=120, Min=0, Max=400, Rounding=0,
        Callback=function(v) if not syncingWeapon then G.ThunderSpearHoverHeight = v end end
    })

    SpearTab:AddSlider("SpearHitDistanceSlider", {
        Text = "Hit Distance",
        Default = G.HitDistance or 80,
        Min = 10,
        Max = 300,
        Rounding = 0,
        Callback = function(val)
            if not syncingWeapon then
                G.HitDistance = val
            end
        end
    })

    SpearTab:AddToggle("SpearHitDistanceToggle", {
        Text = "Enable Hit Distance",
        Default = G.HitDistanceEnabled ~= false,
        Callback = function(v)
            if not syncingWeapon then
                G.HitDistanceEnabled = v
            end
        end
    })

    task.spawn(function()
        while true do
            task.wait(0.1)
            pcall(function()
                local G = getgenv()
                if G.AutoFarmBlade and not G.Farm then
                    G.Farm = true
                    G.FarmStartTime = tick()
                    CurrentEntry = nil
                    LastAttackTime = tick()
                    if not FarmConn then
                        CreateFarmLoop()
                    end
                end
                if G.AutoThunderSpear and not G.SpearFarm then
                    G.SpearFarm = true
                    G.FarmStartTime = tick()
                    SpearCurrentEntry = nil
                    LastSpearAttackTime = tick()
                    if not SpearFarmConn then
                        CreateSpearFarmLoop()
                    end
                end
            end)
        end
    end)
-- ===== Return to Town Central after X Missions =====
local MissionReturnGroup = Tabs.AutoFarm:AddRightGroupbox("Return to Town Central")

local missionLabel = MissionReturnGroup:AddLabel("Completed: " .. completedMissions)

MissionReturnGroup:AddSlider("TargetMissionsSlider", {
    Text = "Return after X Missions",
    Default = 2,
    Min = 1,
    Max = 50,
    Rounding = 0,
    Callback = function(v)
        targetMissions = v
    end
})

MissionReturnGroup:AddToggle("AutoReturnToggle", {
    Text = "Enable Auto Return to Town",
    Default = false,
    Callback = function(v)
        autoReturnEnabled = v
        if not v then
            isReturning = false
        end
    end
})

MissionReturnGroup:AddButton("Reset Counter", function()
    resetMissionsCount()
    missionLabel:SetText("Completed: 0")
    Library:Notify("Mission counter reset to 0", 3)
end)

MissionReturnGroup:AddButton("Force Return Now", function()
    isReturning = true
    pcall(function()
        TeleportService:Teleport(MAIN_MENU_ID, Player)
    end)
end)
    local TeleportGroup = Tabs.AutoFarm:AddRightGroupbox("Teleport Now")
    local tpLabel = TeleportGroup:AddLabel("")
    local function AddConfirmTP(name, id, time)
        local c = false
        TeleportGroup:AddButton(name, function()
            if c then
                pcall(function() TeleportService:Teleport(id, Player) end)
            else
                c = true
                tpLabel:SetText("Are you sure?")
                task.delay(time or 3, function() c = false; tpLabel:SetText("") end)
            end
        end)
    end
    AddConfirmTP("Teleport to Main Menu", MAIN_MENU_ID, 1.5)
    AddConfirmTP("Teleport to Lobby", LOBBY_ID)
    
    TeleportGroup:AddDivider()

    local combinedDelay = 0
    local selectedActions = {}
    local combinedEnabled = false
    local combinedTimerRunning = false
    local combinedStartTime = 0
    local actionPending = false
    local teleportAttempts = 0
    local maxAttempts = 5

    TeleportGroup:AddSlider("CombinedActionDelaySlider", {
        Text = "Set Delay (seconds)",
        Default = 0,
        Min = 0,
        Max = 1200,
        Rounding = 0,
        Suffix = " sec",
        Callback = function(v)
            combinedDelay = tonumber(v) or 0
            if combinedEnabled and combinedTimerRunning then
                combinedStartTime = tick()
            end
        end
    })

    TeleportGroup:AddDropdown("CombinedActionsDropdown", {
        Values = {"Teleport to Main Menu", "Teleport to Lobby", "Kill Character", "AUTO Leave Game"},
        Default = {},
        Multi = true,
        Text = "Select [ Multi ]",
        Callback = function(v)
            -- Always store as a flat list of selected action names
            local list = {}
            if type(v) == "table" then
                for k, val in pairs(v) do
                    if val == true or val == 1 then
                        table.insert(list, tostring(k))
                    elseif type(val) == "string" and val ~= "" then
                        table.insert(list, val)
                    elseif type(k) == "number" and type(val) == "string" then
                        table.insert(list, val)
                    end
                end
            end
            selectedActions = list
        end
    })

    local function tryLeaveMission()
        pcall(function()
            local GET = ReplicatedStorage:FindFirstChild("Assets")
                and ReplicatedStorage.Assets:FindFirstChild("Remotes")
                and ReplicatedStorage.Assets.Remotes:FindFirstChild("GET")
            if GET then
                GET:InvokeServer("S_Missions", "Leave")
            end
        end)
        pcall(function()
            local POST = ReplicatedStorage:FindFirstChild("Assets")
                and ReplicatedStorage.Assets:FindFirstChild("Remotes")
                and ReplicatedStorage.Assets.Remotes:FindFirstChild("POST")
            if POST then
                POST:FireServer("Functions", "Teleport", "Menu", nil)
                POST:FireServer("Functions", "Teleport", "Lobby", nil)
            end
        end)
    end

    local function performTeleportToMainMenu()
        teleportAttempts = teleportAttempts + 1
        tryLeaveMission()
        task.wait(1.2)
        pcall(function() TeleportService:Teleport(MAIN_MENU_ID, Player) end)
        task.delay(4, function()
            if game.PlaceId ~= MAIN_MENU_ID and game.PlaceId ~= LOBBY_ID then
                pcall(function() TeleportService:Teleport(MAIN_MENU_ID, Player) end)
            end
        end)
        if teleportAttempts >= maxAttempts then
            pcall(function() game:Shutdown() end)
        end
    end

    local function performTeleportToLobby()
        teleportAttempts = teleportAttempts + 1
        tryLeaveMission()
        task.wait(1.2)
        pcall(function() TeleportService:Teleport(LOBBY_ID, Player) end)
        task.delay(4, function()
            if game.PlaceId ~= LOBBY_ID and game.PlaceId ~= MAIN_MENU_ID then
                pcall(function() TeleportService:Teleport(LOBBY_ID, Player) end)
            end
        end)
        if teleportAttempts >= maxAttempts then
            pcall(function() game:Shutdown() end)
        end
    end

    local function performKillCharacter()
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            pcall(function() player.Character.Humanoid.Health = 0 end)
        end
    end

    local function getSelectedActionsList()
        local list = {}
        local seen = {}

        local function add(name)
            if type(name) ~= "string" or name == "" then return end
            if seen[name] then return end
            -- ignore non-action keys
            if name == "Teleport to Main Menu"
                or name == "Teleport to Lobby"
                or name == "Kill Character"
                or name == "AUTO Leave Game" then
                seen[name] = true
                table.insert(list, name)
            end
        end

        local function absorb(src)
            if type(src) ~= "table" then return end
            -- already a flat list of strings?
            local isArray = #src > 0
            if isArray then
                for _, v in ipairs(src) do
                    if type(v) == "string" then add(v) end
                end
            end
            for k, val in pairs(src) do
                if val == true or val == 1 then
                    add(tostring(k))
                elseif type(val) == "string" then
                    add(val)
                elseif type(k) == "string" and (val == true or val == false) then
                    if val then add(k) end
                end
            end
        end

        -- 1) local cache from Callback
        absorb(selectedActions)

        -- 2) live Options value (Linoria)
        pcall(function()
            if Options and Options.CombinedActionsDropdown then
                absorb(Options.CombinedActionsDropdown.Value)
            end
        end)

        return list
    end

    local function executeCombinedActions()
        if not actionPending then return end
        actionPending = false
        combinedTimerRunning = false

        local actionsToRun = getSelectedActionsList()
        if #actionsToRun == 0 then
            Library:Notify("FailSafe: no actions selected", 3)
            return
        end

        for _, action in ipairs(actionsToRun) do
            if action == "Teleport to Main Menu" then
                performTeleportToMainMenu()
            elseif action == "Teleport to Lobby" then
                performTeleportToLobby()
            elseif action == "Kill Character" then
                performKillCharacter()
            elseif action == "AUTO Leave Game" then
                pcall(function() game:Shutdown() end)
            end
            task.wait(0.25)
        end
        teleportAttempts = 0

        if combinedEnabled then
            task.delay(3, function()
                if combinedEnabled and not combinedTimerRunning then
                    startCombinedTimer()
                end
            end)
        end
    end

    local function startCombinedTimer()
        if combinedTimerRunning then return end

        local actionsToRun = getSelectedActionsList()
        if #actionsToRun == 0 then
            Library:Notify("FailSafe: select at least one action first", 3)
            combinedEnabled = false
            pcall(function()
                if Options and Options.CombinedActionToggle then
                    Options.CombinedActionToggle:SetValue(false)
                end
            end)
            return
        end

        if combinedDelay <= 0 then
            actionPending = true
            executeCombinedActions()
            return
        end

        combinedTimerRunning = true
        actionPending = true
        combinedStartTime = tick()
        Library:Notify(string.format("FailSafe started (%ds)", combinedDelay), 3)

        task.spawn(function()
            while combinedEnabled and actionPending do
                local elapsed = tick() - combinedStartTime
                if elapsed >= combinedDelay then
                    executeCombinedActions()
                    break
                end
                task.wait(0.25)
            end
            combinedTimerRunning = false
        end)
    end

    local function stopCombinedTimer()
        actionPending = false
        combinedTimerRunning = false
        teleportAttempts = 0
    end

    TeleportGroup:AddToggle("CombinedActionToggle", {
        Text = "Enable Failed Safe",
        Default = false,
        Callback = function(v)
            combinedEnabled = v
            if v then
                pcall(function()
                    if Options and Options.CombinedActionDelaySlider then
                        combinedDelay = tonumber(Options.CombinedActionDelaySlider.Value) or combinedDelay
                    end
                end)
                -- tiny defer so Linoria finishes writing Multi dropdown Value
                task.defer(function()
                    if not combinedEnabled then return end
                    startCombinedTimer()
                end)
            else
                stopCombinedTimer()
            end
        end
    })

    TeleportGroup:AddButton("Test FailSafe NOW", function()
        local actionsToRun = getSelectedActionsList()
        if #actionsToRun == 0 then
            Library:Notify("FailSafe: select actions first", 3)
            return
        end
        actionPending = true
        executeCombinedActions()
    end)
end

-- ===== ส่วนของ Titans และ Farm Core (ปรับปรุงให้ยิงเร็วขึ้น) =====

local function SafeGetTitansFolder()
    local success, folder = pcall(function()
        return workspace:FindFirstChild("Titans")
    end)
    if success and folder then
        return folder
    end
    local success2, newFolder = pcall(function()
        local f = Instance.new("Folder")
        f.Name = "Titans"
        f.Parent = workspace
        return f
    end)
    if success2 then return newFolder end
    return nil
end

local TitansFolder = SafeGetTitansFolder()

local function IsInCutscene()
    local ok, result = pcall(function()
        local gui = Player:FindFirstChild("PlayerGui")
        if not gui then return false end
        local Interface = gui:FindFirstChild("Interface")
        if not Interface then return false end
        local skip = Interface:FindFirstChild("Skip")
        local skipWarning = Interface:FindFirstChild("Skip_Warning")
        return (skip and skip.Visible) or (skipWarning and skipWarning.Visible) or false
    end)
    return ok and result or false
end

if ({[MAIN_MENU_ID]=true,[LOBBY_ID]=true})[game.PlaceId] then return end

if not TitansFolder then
    TitansFolder = SafeGetTitansFolder()
end

local function safeClearTable(tbl)
    if type(tbl) == "table" then
        table.clear(tbl)
        return tbl
    end
    return {}
end

local objectivesCache = false
local objectivesCacheTime = 0
local OBJECTIVES_CACHE_DURATION = 0.05

local function isObjectivesActiveForCore()
    local now = tick()
    if now - objectivesCacheTime < OBJECTIVES_CACHE_DURATION then
        return objectivesCache
    end
    objectivesCacheTime = now
    
    local success, player = pcall(function()
        return game:GetService("Players").LocalPlayer
    end)
    if not success or not player then 
        objectivesCache = false
        return false 
    end
    
    local success2, playerGui = pcall(function()
        return player:FindFirstChild("PlayerGui")
    end)
    if not success2 or not playerGui then 
        objectivesCache = false
        return false 
    end
    
    local function IsActuallyVisible(gui)
        if not gui or not gui:IsA("GuiObject") then return false end
        if not gui.Visible then return false end
        local current = gui.Parent
        while current do
            if current:IsA("GuiObject") and not current.Visible then return false end
            if current:IsA("ScreenGui") and not current.Enabled then return false end
            current = current.Parent
        end
        return true
    end
    
    local success3, descendants = pcall(function()
        return playerGui:GetDescendants()
    end)
    if not success3 then 
        objectivesCache = false
        return false 
    end
    
    for _, v in ipairs(descendants) do
        if v.Name == "Objectives" then
            if IsActuallyVisible(v) then
                objectivesCache = true
                return true
            end
        end
    end
    objectivesCache = false
    return false
end

local slayCache = false
local slayCacheTime = 0
local SLAY_CACHE_DURATION = 0.05

local function isSlayObjectiveVisible()
    local now = tick()
    if now - slayCacheTime < SLAY_CACHE_DURATION then
        return slayCache
    end
    slayCacheTime = now
    
    local success, player = pcall(function()
        return game:GetService("Players").LocalPlayer
    end)
    if not success or not player then 
        slayCache = false
        return false 
    end
    
    local success2, targetGui = pcall(function()
        local gui = player.PlayerGui:FindFirstChild("Interface")
        if gui then
            gui = gui:FindFirstChild("HUD")
            if gui then
                gui = gui:FindFirstChild("Objectives")
                if gui then
                    gui = gui:FindFirstChild("Main")
                    if gui then
                        gui = gui:FindFirstChild("Slay")
                        return gui
                    end
                end
            end
        end
        return nil
    end)
    
    if success2 and targetGui and targetGui:IsA("TextLabel") then
        local visible = true
        local current = targetGui
        while current do
            if current:IsA("GuiObject") and not current.Visible then visible = false break end
            if current:IsA("ScreenGui") and not current.Enabled then visible = false break end
            current = current.Parent
        end
        if visible and targetGui.AbsoluteSize.X > 0 and targetGui.AbsoluteSize.Y > 0 then
            slayCache = true
            return true
        end
    end
    slayCache = false
    return false
end

local isShiganshinaBreachMission = false
local isProtectHQActive = false
local protectHQCompleted = false
local lastMissionCheck = 0
local protectHQCheckTimer = 0
local protectHQCheckInterval = 0.1

local function updateMissionInfo()
    local now = tick()
    if now - lastMissionCheck < 5 then return end
    lastMissionCheck = now
    
    pcall(function()
        local data = GET:InvokeServer("Data", "Copy")
        if data and data.Map then
            local mapName = data.Map.Map or ""
            local objective = data.Map.Objective or ""
            if mapName == "Shiganshina" and objective == "Breach" then
                if not isShiganshinaBreachMission then
                    isShiganshinaBreachMission = true
                    Library:Notify("Shiganshina Breach mission detected - Slay check disabled until Protect_HQ appears", 4)
                end
            else
                if isShiganshinaBreachMission then
                    isShiganshinaBreachMission = false
                    isProtectHQActive = false
                    protectHQCompleted = false
                    Library:Notify("Not Shiganshina Breach - Returning to normal mode", 3)
                end
            end
        end
    end)
end

local function checkProtectHQ()
    if not isShiganshinaBreachMission then return end
    
    local now = tick()
    if now - protectHQCheckTimer < protectHQCheckInterval then return end
    protectHQCheckTimer = now
    
    local success, protect = pcall(function()
        local gui = Player.PlayerGui:FindFirstChild("Interface")
        if gui then
            gui = gui:FindFirstChild("HUD")
            if gui then
                gui = gui:FindFirstChild("Objectives")
                if gui then
                    gui = gui:FindFirstChild("Main")
                    if gui then
                        return gui:FindFirstChild("Protect_HQ")
                    end
                end
            end
        end
        return nil
    end)
    
    if success and protect and protect:IsA("TextLabel") and protect.Visible then
        if not isProtectHQActive then
            isProtectHQActive = true
            protectHQCompleted = false
            Library:Notify("Protect_HQ appeared - Slay check will be re-enabled after completing Protect_HQ", 3)
        end
        
        local text = protect.Text
        local current, max = text:match("(%d+)/(%d+)")
        if current and max then
            if tonumber(current) >= tonumber(max) and not protectHQCompleted then
                protectHQCompleted = true
                Library:Notify("Protect_HQ completed ("..current.."/"..max..") - Re-enabling Slay check", 3)
            end
        end
    else
        if isProtectHQActive and not protectHQCompleted then
            isProtectHQActive = false
        end
    end
end

task.spawn(function()
    while task.wait(0.10) do
        pcall(function()
            updateMissionInfo()
            checkProtectHQ()
        end)
    end
end)

local BOSS_NAMES = {
    Attack_Titan = true, Armored_Titan = true, Female_Titan = true,
    Beast_Titan = true, Colossal_Titan = true, Warhammer_Titan = true,
    Jaw_Titan = true, Cart_Titan = true
}
local attackTitanSpawnTime = nil

local ActiveTitans = {}
local LastScan = 0
local SCAN_RATE = 0.03
local NapeCache = setmetatable({}, {__mode = "k"})
local OriginalHitSizes = setmetatable({}, {__mode = "k"})  -- part -> original Size

local LastTitanPosition = nil
local LastTitanHoverHeight = 120

local function IsTitanAlive(t)
    if not t then return false end
    local success, h = pcall(function()
        return t:FindFirstChildWhichIsA("Humanoid")
    end)
    return success and h and h.Health > 10
end

local function ExpandHitboxPart(part)
    if not part or not part:IsA("BasePart") then return end
    local G = getgenv()
    if not G.HitDistanceEnabled then return end
    local targetSize = tonumber(G.HitDistance) or 80
    if targetSize < 5 then targetSize = 5 end

    if not OriginalHitSizes[part] then
        OriginalHitSizes[part] = part.Size
    end

    local desired = Vector3.new(targetSize, targetSize, targetSize)
    if (part.Size - desired).Magnitude > 0.5 then
        pcall(function()
            part.Size = desired
            part.CanCollide = false
            part.Massless = true
        end)
    end
end

local function ApplyHitDistanceToTitan(t)
    if not t then return end
    local G = getgenv()

    -- Blade uses the exact standalone remote.
    -- Do not locally resize Hit/Nape parts while Blade farm is active.
    if G.AutoFarmBlade then
        return
    end

    if not G.HitDistanceEnabled then return end

    pcall(function()
        local hitboxes = t:FindFirstChild("Hitboxes")
        if not hitboxes then return end
        local hit = hitboxes:FindFirstChild("Hit")
        if hit then
            if hit:IsA("BasePart") then
                ExpandHitboxPart(hit)
            end
            local nape = hit:FindFirstChild("Nape")
            if nape and nape:IsA("BasePart") then
                ExpandHitboxPart(nape)
            end
            -- expand other common weak points too
            for _, child in ipairs(hit:GetChildren()) do
                if child:IsA("BasePart") then
                    ExpandHitboxPart(child)
                end
            end
        end
        -- some titans put hit parts directly under Hitboxes
        for _, child in ipairs(hitboxes:GetChildren()) do
            if child:IsA("BasePart") then
                ExpandHitboxPart(child)
            end
        end
    end)
end

local function GetNape(t)
    if not t then return nil end
    local c = NapeCache[t]
    if c then
        ApplyHitDistanceToTitan(t)
        return c
    end
    local success, hitboxes = pcall(function()
        return t:FindFirstChild("Hitboxes")
    end)
    if success and hitboxes then
        local success2, hit = pcall(function()
            return hitboxes:FindFirstChild("Hit")
        end)
        if success2 and hit then
            local success3, nape = pcall(function()
                return hit:FindFirstChild("Nape")
            end)
            if success3 and nape and nape:IsA("BasePart") then
                NapeCache[t] = nape
                ApplyHitDistanceToTitan(t)
                return nape
            end
        end
    end
    return nil
end

local function ScanTitans()
    local now = tick()
    if now - LastScan < SCAN_RATE then return end
    LastScan = now
    
    local success, titansFolder = pcall(function()
        return workspace:FindFirstChild("Titans")
    end)
    if not success or not titansFolder then
        ActiveTitans = safeClearTable(ActiveTitans)
        return
    end
    
    ActiveTitans = safeClearTable(ActiveTitans)
    local attackFound = false
    
    local success2, children = pcall(function()
        return titansFolder:GetChildren()
    end)
    if not success2 then return end
    
    for i = 1, #children do
        local t = children[i]
        if t:IsA("Model") and IsTitanAlive(t) then
            local JaMe = t:FindFirstChild("JaMe")
            if JaMe then
                local collision = JaMe:FindFirstChild("Collision")
                if collision and not collision.CanCollide then              
                end
            end
            local nape = GetNape(t)
            if nape then
                ApplyHitDistanceToTitan(t)
                local isBoss = BOSS_NAMES[t.Name] or false
                if t.Name == "Attack_Titan" then attackFound = true end
                table.insert(ActiveTitans, {titan = t, nape = nape, isBoss = isBoss, titanName = t.Name})
                LastTitanPosition = nape.Position
            end
        end
    end
    
    if attackFound then
        if not attackTitanSpawnTime then attackTitanSpawnTime = now end
    else
        attackTitanSpawnTime = nil
    end
end

local function GetBestTarget(hrpPos)
    if not hrpPos then return nil end
    if #ActiveTitans == 0 then return nil end
    
    local now = tick()
    local attackReady = true
    if attackTitanSpawnTime then
        attackReady = (now - attackTitanSpawnTime) >= 3
    end
    
    local bestBoss, bestBossDist = nil, math.huge
    local bestNormal, bestNormalDist = nil, math.huge
    
    for i = 1, #ActiveTitans do
        local entry = ActiveTitans[i]
        if entry.titanName == "Attack_Titan" and not attackReady then continue end
        local n = entry.nape
        if not n then continue end
        local dx = hrpPos.X - n.Position.X
        local dz = hrpPos.Z - n.Position.Z
        local distSq = dx*dx + dz*dz
        if entry.isBoss then
            if distSq < bestBossDist then bestBossDist = distSq; bestBoss = entry end
        else
            if distSq < bestNormalDist then bestNormalDist = distSq; bestNormal = entry end
        end
    end
    return bestBoss or bestNormal
end

local CharParts = {}
local CharRef = nil
local function NoclipOn()
    local success, char = pcall(function()
        return Player.Character
    end)
    if not success or not char then return end
    if char ~= CharRef then
        CharRef = char
        CharParts = {}
        local success2, descendants = pcall(function()
            return char:GetDescendants()
        end)
        if success2 then
            for i = 1, #descendants do
                local v = descendants[i]
                if v:IsA("BasePart") then
                    CharParts[#CharParts + 1] = v
                end
            end
        end
    end
    for i = 1, #CharParts do
        if CharParts[i] and CharParts[i].Parent then
            pcall(function()
                CharParts[i].CanCollide = false
            end)
        end
    end
end

local bodyPos = nil
local bodyGyro = nil

local function InitSmoothMovement(hrp)
    if not hrp then return end
    if not bodyPos or not bodyPos.Parent then
        if bodyPos then pcall(function() bodyPos:Destroy() end) end
        local success, newPos = pcall(function()
            local b = Instance.new("BodyPosition")
            b.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            b.P = 5000
            b.D = 1000
            b.Parent = hrp
            return b
        end)
        if success then bodyPos = newPos end
    end
    if not bodyGyro or not bodyGyro.Parent then
        if bodyGyro then pcall(function() bodyGyro:Destroy() end) end
        local success, newGyro = pcall(function()
            local g = Instance.new("BodyGyro")
            g.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
            g.P = 8000
            g.D = 1600
            g.Parent = hrp
            return g
        end)
        if success then bodyGyro = newGyro end
    end
end

CleanupSmoothMovement = function()
    if bodyPos then pcall(function() bodyPos:Destroy() end); bodyPos = nil end
    if bodyGyro then pcall(function() bodyGyro:Destroy() end); bodyGyro = nil end
end

local function MoveSmooth(hrp, targetPos, targetLookDir)
    if not hrp or not targetPos then return end
    InitSmoothMovement(hrp)
    if bodyPos then
        pcall(function() bodyPos.Position = targetPos end)
    end
    if bodyGyro then
        pcall(function()
            if targetLookDir then
                bodyGyro.CFrame = CFrame.lookAt(targetPos, targetLookDir)
            else
                bodyGyro.CFrame = CFrame.lookAt(targetPos, targetPos + Vector3.new(0, 0, -1))
            end
        end)
    end
end

local function MoveStableTeleport(hrp, targetPos)
    if not hrp or not targetPos then return end
    pcall(function()
        hrp.CFrame = CFrame.new(targetPos)
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    end)
    CleanupSmoothMovement()
end

local function HoverInPlace(hrp)
    if not hrp then return end
    NoclipOn()
    CleanupSmoothMovement()
    
    local targetY = IdleHoverY
    if LastTitanPosition then
        targetY = LastTitanPosition.Y + LastTitanHoverHeight
    end
    
    local currentY = hrp.Position.Y
    if math.abs(currentY - targetY) > 2 then
        pcall(function()
            hrp.AssemblyLinearVelocity = Vector3.new(0, (targetY - currentY) * 8, 0)
        end)
    else
        pcall(function()
            hrp.AssemblyLinearVelocity = Vector3.zero
            hrp.CFrame = CFrame.new(hrp.Position.X, targetY, hrp.Position.Z)
        end)
    end
    pcall(function()
        hrp.AssemblyAngularVelocity = Vector3.zero
    end)
end

local CurrentEntry = nil
local isDead = false
local IdleHoverY = 80

local function IsRewardsUIVisible()
    -- Rewards.Visible can stay true even while the mission is running.
    -- Treat the mission as finished only when the Rewards UI is ACTUALLY
    -- visible on-screen (all parents visible/enabled + non-zero size).
    local function IsActuallyVisible(gui)
        if not gui then return false end

        local ok, visible = pcall(function()
            if gui:IsA("GuiObject") then
                if not gui.Visible then return false end
                if gui.AbsoluteSize.X <= 0 or gui.AbsoluteSize.Y <= 0 then return false end
            elseif gui:IsA("ScreenGui") then
                if not gui.Enabled then return false end
            end

            local current = gui.Parent
            while current and current ~= game do
                if current:IsA("GuiObject") and not current.Visible then
                    return false
                end
                if current:IsA("ScreenGui") and not current.Enabled then
                    return false
                end
                current = current.Parent
            end

            return true
        end)

        return ok and visible == true
    end

    local ok, rewards = pcall(function()
        local interface = Player.PlayerGui:FindFirstChild("Interface")
        return interface and interface:FindFirstChild("Rewards")
    end)

    if not ok or not rewards or not IsActuallyVisible(rewards) then
        return false
    end

    -- Extra confirmation: the Retry button must also really be visible.
    local retry = nil
    pcall(function()
        retry = rewards.Main.Info.Main.Buttons.Retry
    end)

    if not retry then
        pcall(function()
            for _, d in ipairs(rewards:GetDescendants()) do
                if d.Name == "Retry" and (d:IsA("TextButton") or d:IsA("ImageButton") or d:IsA("GuiButton")) then
                    retry = d
                    break
                end
            end
        end)
    end

    return retry ~= nil and IsActuallyVisible(retry)
end

local function OnDeath()
    isDead = true
    CurrentEntry = nil
    NapeCache = setmetatable({}, {__mode = "k"})
    ActiveTitans = safeClearTable(ActiveTitans)
    CharRef = nil
    CharParts = {}
    CleanupSmoothMovement()
end

local function OnSpawn(char)
    if not char then return end
    isDead = false
    CharRef = nil
    CleanupSmoothMovement()
    local success, hum = pcall(function()
        return char:FindFirstChildOfClass("Humanoid")
    end)
    if success and hum then
        pcall(function() hum.Died:Connect(OnDeath) end)
    end
end

if Player.Character then OnSpawn(Player.Character) end
Player.CharacterAdded:Connect(OnSpawn)

local FarmConn = nil
local SpearFarmConn = nil
local FARM_ATTACK_INTERVAL = 0.05
local LastAttackTime = 0

local waveWaiting = false
local waveProgressCache = {current = nil, max = nil, text = nil, time = 0}
local WAVE_CACHE_DURATION = 0.05

local function getWaveProgress()
    local now = tick()
    if now - waveProgressCache.time < WAVE_CACHE_DURATION then
        return waveProgressCache.current, waveProgressCache.max, waveProgressCache.text
    end
    
    local player = Player
    if not player then return nil, nil, nil end
    
    local success2, defend = pcall(function()
        local gui = player.PlayerGui:FindFirstChild("Interface")
        if gui then
            gui = gui:FindFirstChild("HUD")
            if gui then
                gui = gui:FindFirstChild("Objectives")
                if gui then
                    gui = gui:FindFirstChild("Main")
                    if gui then
                        return gui:FindFirstChild("Defend")
                    end
                end
            end
        end
        return nil
    end)
    
    if success2 and defend and defend:IsA("TextLabel") and defend.Visible then
        local text = defend.Text
        local current, max = text:match("(%d+)/(%d+)")
        if current and max then
            waveProgressCache.current = tonumber(current)
            waveProgressCache.max = tonumber(max)
            waveProgressCache.text = text
            waveProgressCache.time = now
            return waveProgressCache.current, waveProgressCache.max, waveProgressCache.text
        end
    end
    waveProgressCache.current = nil
    waveProgressCache.max = nil
    waveProgressCache.text = nil
    waveProgressCache.time = now
    return nil, nil, nil
end

local reloadCache = false
local reloadCacheTime = 0
local RELOAD_CACHE_DURATION = 0.05

local function NeedReload()
    local now = tick()
    if now - reloadCacheTime < RELOAD_CACHE_DURATION then
        return reloadCache
    end
    reloadCacheTime = now
    
    local success, char = pcall(function()
        return workspace:FindFirstChild("Characters")
    end)
    if not success or not char then 
        reloadCache = false
        return false 
    end
    local success2, playerChar = pcall(function()
        return char:FindFirstChild(Player.Name)
    end)
    if not success2 or not playerChar then 
        reloadCache = false
        return false 
    end
    local success3, rig = pcall(function()
        return playerChar:FindFirstChild("Rig_" .. Player.Name)
    end)
    if not success3 or not rig then 
        reloadCache = false
        return false 
    end

    local success4, leftHand = pcall(function()
        return rig:FindFirstChild("LeftHand")
    end)
    local success5, rightHand = pcall(function()
        return rig:FindFirstChild("RightHand")
    end)

    if success4 and leftHand then
        local success6, blade = pcall(function()
            return leftHand:FindFirstChild("Blade_1")
        end)
        if success6 and blade and blade.Transparency == 1 then 
            reloadCache = true
            return true 
        end
    end

    if success5 and rightHand then
        local success7, blade = pcall(function()
            return rightHand:FindFirstChild("Blade_1")
        end)
        if success7 and blade and blade.Transparency == 1 then 
            reloadCache = true
            return true 
        end
    end

    reloadCache = false
    return false
end

local function GetTargets(limit)
    if #ActiveTitans == 0 then return {} end
    local success, hrp = pcall(function()
        local char = Player.Character
        if char then return char:FindFirstChild("HumanoidRootPart") end
        return nil
    end)
    if not success or not hrp then return {} end
    local pos = hrp.Position
    
    local sorted = {}
    for i = 1, #ActiveTitans do
        local entry = ActiveTitans[i]
        local nape = entry.nape
        if nape then
            local dx = nape.Position.X - pos.X
            local dz = nape.Position.Z - pos.Z
            local distSq = dx*dx + dz*dz
            sorted[#sorted + 1] = {entry = entry, dist = distSq}
        end
    end
    table.sort(sorted, function(a,b) return a.dist < b.dist end)
    
    local result = {}
    local count = math.min(#sorted, limit or 9)
    for i = 1, count do
        result[i] = sorted[i].entry
    end
    return result
end

local function AttackAllTitans()
    if #ActiveTitans == 0 then return end
    if not isObjectivesActiveForCore() then return end
    if NeedReload() then return end

    local G = getgenv()
    local elapsed = (G.FarmStartTime and tick() - G.FarmStartTime) or 0
    local safe = elapsed >= (G.SafetyTime or 60)
    local killHits = G.KillHits or 9

    if safe then
        SafeFire(POST, "Attacks", "Slash", true)
        local targets = GetTargets(killHits)
        for i = 1, #targets do
            local entry = targets[i]
            local nape = entry.nape
            if nape and nape.Parent then
                SafeFire(POST, "Hitboxes", "Register", nape, 99999, 0)
            end
        end
        return
    end

    if isShiganshinaBreachMission and not protectHQCompleted then
        SafeFire(POST, "Attacks", "Slash", true)
        local targets = GetTargets(killHits)
        for i = 1, #targets do
            local entry = targets[i]
            local nape = entry.nape
            if nape and nape.Parent then
                SafeFire(POST, "Hitboxes", "Register", nape, 99999, 0)
            end
        end
        return
    end

    local currentWave, maxWave = getWaveProgress()
    if currentWave and maxWave and currentWave < maxWave then
        local nearComplete = (currentWave >= maxWave - 2)
        if nearComplete then
            if elapsed < (G.SafetyTime or 60) then
                if not waveWaiting then waveWaiting = true end
                return
            else
                if waveWaiting then waveWaiting = false end
            end
        else
            waveWaiting = false
        end
    elseif currentWave and currentWave == maxWave then
        waveWaiting = false
    elseif not currentWave then
        waveWaiting = false
    end

    local slayVisible = isSlayObjectiveVisible()
    local stopAt = G.StopAtTitansLeft or 1
    local targets = GetTargets(killHits)

    if not slayVisible then
        SafeFire(POST, "Attacks", "Slash", true)
        for i = 1, #targets do
            local entry = targets[i]
            local nape = entry.nape
            if nape and nape.Parent then
                SafeFire(POST, "Hitboxes", "Register", nape, 99999, 0)
            end
        end
        return
    end

    if not safe and #ActiveTitans <= stopAt then return end

    SafeFire(POST, "Attacks", "Slash", true)
    for i = 1, #targets do
        local entry = targets[i]
        local nape = entry.nape
        if nape and nape.Parent then
            SafeFire(POST, "Hitboxes", "Register", nape, 99999, 0)
        end
    end
end

local function FarmUpdate()
    pcall(function()
        local G = getgenv()
        
        if not G.AutoFarmBlade then
            if G.Farm then G.Farm = false end
            return
        end
        
        if not G.Farm then return end
        
        if isDead then return end
        
        if NeedReload() then
            if G.FarmMode ~= "No Movement" then
                local char = Player.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then HoverInPlace(hrp) end
                end
            else
                CleanupSmoothMovement()
            end

            return
        end
        
        if IsRewardsUIVisible() then
            -- Mission finished: pause this heartbeat only.
            --
            -- IMPORTANT:
            -- Do NOT set G.Farm=false and do NOT turn AutoFarmBlade off.
            -- Auto Retry can keep the Rewards UI around briefly while the
            -- next mission is loading. The old code permanently disabled
            -- Auto Farm during that transition, leaving Auto Retry/Reload
            -- alive but the farm doing nothing.
            --
            -- Keeping AutoFarmBlade + G.Farm enabled lets it automatically
            -- resume the instant Rewards disappears in the next mission.
            CurrentEntry = nil
            return
        end

        local char = Player.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then
            OnDeath()
            return
        end

        if G.FarmMode == "No Movement" then
            CleanupSmoothMovement()

            pcall(function()
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
            end)

            -- Keep titan state refreshed for the rest of the UI/script,
            -- but do not move and do not send the original Blade attack.
            -- The exact Standalone9 worker appended at the end handles damage.
            ScanTitans()
            return
        end

        hrp.AssemblyAngularVelocity = Vector3.zero

        if hrp.Position.Y < -50 then
            hrp.CFrame = CFrame.new(hrp.Position.X, IdleHoverY, hrp.Position.Z)
            hrp.AssemblyLinearVelocity = Vector3.zero
            CleanupSmoothMovement()
            return
        end

        ScanTitans()

        local elapsed = (G.FarmStartTime and tick() - G.FarmStartTime) or 0
        if waveWaiting then
            if elapsed < (G.SafetyTime or 60) then
                HoverInPlace(hrp)
                return
            else
                waveWaiting = false
            end
        end

        if #ActiveTitans == 0 then
            CurrentEntry = nil
            HoverInPlace(hrp)
            return
        end

        LastTitanHoverHeight = G.HoverHeight or 120

        if not CurrentEntry or not IsTitanAlive(CurrentEntry.titan) then
            CurrentEntry = GetBestTarget(hrp.Position)
        end
        
        if not CurrentEntry then return end

        local nape = CurrentEntry.nape
        if not nape then
            CurrentEntry = nil
            return
        end
        
        LastTitanPosition = nape.Position

        local ty = nape.Position.Y + (G.HoverHeight or 120)
        local tp = Vector3.new(nape.Position.X, ty, nape.Position.Z)
        local lookDir = Vector3.new(nape.Position.X, ty, nape.Position.Z - 5)

        NoclipOn()

        if G.FarmMode == "Teleport" then
            MoveStableTeleport(hrp, tp)
        else
            MoveSmooth(hrp, tp, lookDir)
        end

        local now = tick()
        if now - LastAttackTime >= FARM_ATTACK_INTERVAL then
            LastAttackTime = now
            AttackAllTitans()
        end
    end)
end

CreateFarmLoop = function()
    if FarmConn then
        pcall(function() FarmConn:Disconnect() end)
        FarmConn = nil
    end
    FarmConn = RunService.Heartbeat:Connect(FarmUpdate)
end

local SpearCurrentEntry = nil
local LastSpearAttackTime = 0
local SPEAR_ATTACK_INTERVAL = 0.1
local CurrentFirePower = 8
local EXPLODE_RADIUS = 0.14
-- Hit Distance also boosts spear AOE when enabled
local function getExplodeRadius()
    local G = getgenv()
    if G.HitDistanceEnabled and G.HitDistance then
        -- map 10-300 studs → roughly 0.14 - 2.5 explode radius
        local t = math.clamp((G.HitDistance - 10) / 290, 0, 1)
        return 0.14 + t * 2.4
    end
    return EXPLODE_RADIUS
end
getgenv().SpearFarm = getgenv().SpearFarm or false

local cachedSpearRefill = nil
local lastSpearRefillCheck = 0

local function FindRefillObject()
    local now = tick()
    if cachedSpearRefill and (now - lastSpearRefillCheck < 3) then
        if pcall(function() return cachedSpearRefill.Parent end) then
            return cachedSpearRefill
        end
    end
    lastSpearRefillCheck = now

    local paths = {
        "Climbable._Walls.Gate.GasTanks.Refill",
        "Climbable._Walls.Gate:GetChildren()[50].Refill",
        "Unclimbable.Props.HQ.GasTanks.Refill"
    }
    for _, path in ipairs(paths) do
        local success, obj = pcall(function()
            if path:find(":GetChildren") then
                local gate = workspace:FindFirstChild("Climbable") and workspace.Climbable:FindFirstChild("_Walls") and workspace.Climbable._Walls:FindFirstChild("Gate")
                if gate then
                    local children = gate:GetChildren()
                    if children[50] then return children[50]:FindFirstChild("Refill") end
                end
                return nil
            else
                local parts = {}
                for part in string.gmatch(path, "[^.]+") do table.insert(parts, part) end
                local obj = workspace
                for _, p in ipairs(parts) do obj = obj and obj:FindFirstChild(p) if not obj then break end end
                return obj
            end
        end)
        if success and obj then
            cachedSpearRefill = obj
            return obj
        end
    end
    local success, refill = pcall(function() return workspace:FindFirstChild("Refill", true) end)
    if success and refill then
        cachedSpearRefill = refill
        return refill
    end
    cachedSpearRefill = nil
    return nil
end

local function ReloadSpears()
    local refill = FindRefillObject()
    if refill then
        pcall(function() POST:FireServer("Attacks", "Reload", refill) end)
    end
    CurrentFirePower = 8
end

local function FireSpear()
    if CurrentFirePower <= 0 then
        ReloadSpears()
        task.wait(0.05)
        if CurrentFirePower == 0 then return end
    end
    pcall(function()
        GET:InvokeServer("Spears", "S_Fire", tostring(CurrentFirePower))
        CurrentFirePower = CurrentFirePower - 1
    end)
end

local function ThunderAOEAttack()
    local activeList = ActiveTitans
    for i = 1, #activeList do
        local entry = activeList[i]
        local nape = entry.nape
        if nape then
            pcall(function()
                POST:FireServer("Spears", "S_Explode", Vector3.new(nape.Position.X, nape.Position.Y, nape.Position.Z), getExplodeRadius())
            end)
        end
    end
end

local function ThunderAttackAllTitans()
    if #ActiveTitans == 0 then return end
    if not isObjectivesActiveForCore() then return end
    
    if getgenv().IsReloading or getgenv().IsRefilling then
        return
    end

    local G = getgenv()
    local elapsed = (G.FarmStartTime and tick() - G.FarmStartTime) or 0
    local safe = elapsed >= (G.SafetyTime or 60)

    if safe then
        FireSpear()
        ThunderAOEAttack()
        return
    end

    if isShiganshinaBreachMission and not protectHQCompleted then
        FireSpear()
        ThunderAOEAttack()
        return
    end

    local currentWave, maxWave = getWaveProgress()
    if currentWave and maxWave and currentWave < maxWave then
        local nearComplete = (currentWave >= maxWave - 2)
        if nearComplete then
            if elapsed < (G.SafetyTime or 60) then
                if not waveWaiting then
                    waveWaiting = true
                end
                return
            else
                if waveWaiting then
                    waveWaiting = false
                end
            end
        else
            waveWaiting = false
        end
    elseif currentWave and currentWave == maxWave then
        waveWaiting = false
    elseif not currentWave then
        waveWaiting = false
    end

    local slayVisible = isSlayObjectiveVisible()
    
    if not slayVisible then
        FireSpear()
        ThunderAOEAttack()
        return
    end
    
    local stopAt = G.StopAtTitansLeft or 1
    if not safe and #ActiveTitans <= stopAt then
        return
    end

    FireSpear()
    ThunderAOEAttack()
end

local function SpearFarmUpdate()
    pcall(function()
        local G = getgenv()
        
        if not G.AutoThunderSpear then
            if G.SpearFarm then G.SpearFarm = false end
            return
        end
        
        if not G.SpearFarm or isDead then return end
        
        if G.IsReloading or G.IsRefilling then return end
        
        if G.AutoThunderSpear and not G.SpearFarm then
            G.SpearFarm = true
            G.FarmStartTime = tick()
        end
        
        if IsRewardsUIVisible() then
            -- Pause during Rewards, but keep the Auto Spear toggle/state
            -- alive so Auto Retry can resume it in the next mission.
            SpearCurrentEntry = nil
            return
        end

        local char = Player.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then
            OnDeath()
            return
        end

        hrp.AssemblyAngularVelocity = Vector3.zero

        if hrp.Position.Y < -50 then
            hrp.CFrame = CFrame.new(hrp.Position.X, IdleHoverY, hrp.Position.Z)
            hrp.AssemblyLinearVelocity = Vector3.zero
            CleanupSmoothMovement()
            return
        end

        ScanTitans()

        if #ActiveTitans == 0 then
            SpearCurrentEntry = nil
            NoclipOn()
            CleanupSmoothMovement()
            local dy = IdleHoverY - hrp.Position.Y
            hrp.AssemblyLinearVelocity = Vector3.new(0, math.clamp(dy * 8, -80, 80), 0)
            return
        end

        if not SpearCurrentEntry or not IsTitanAlive(SpearCurrentEntry.titan) then
            SpearCurrentEntry = GetBestTarget(hrp.Position)
        end
        if not SpearCurrentEntry then return end

        local nape = SpearCurrentEntry.nape
        if not nape then
            SpearCurrentEntry = nil
            return
        end

        local hoverHeight = G.ThunderSpearHoverHeight or G.HoverHeight or 120
        local targetHeight = nape.Position.Y + hoverHeight
        local targetPos = Vector3.new(nape.Position.X, targetHeight, nape.Position.Z)
        local lookDir = Vector3.new(nape.Position.X, targetHeight, nape.Position.Z - 5)

        NoclipOn()

        local farmMode = G.ThunderSpearFarmMode or G.FarmMode or "Tween"
        if farmMode == "Teleport" then
            MoveStableTeleport(hrp, targetPos)
        else
            MoveSmooth(hrp, targetPos, lookDir)
        end

        -- ยิงเร็วขึ้น
        local now = tick()
        if now - LastSpearAttackTime >= SPEAR_ATTACK_INTERVAL then
            LastSpearAttackTime = now
            ThunderAttackAllTitans()
        end
    end)
end

CreateSpearFarmLoop = function()
    if SpearFarmConn then
        pcall(function() SpearFarmConn:Disconnect() end)
        SpearFarmConn = nil
    end
    SpearFarmConn = RunService.Heartbeat:Connect(SpearFarmUpdate)
end

-- ===== สร้าง loop ตรวจสอบสถานะ (เร็วขึ้น) =====
task.spawn(function()
    while true do
        task.wait(0.10)
        local G = getgenv()
        if G.AutoFarmBlade then
            if not G.Farm then
                G.Farm = true
                G.FarmStartTime = tick()
                CurrentEntry = nil
                LastAttackTime = tick()
                if not FarmConn then
                    CreateFarmLoop()
                end
            end
        else
            if G.Farm then
                G.Farm = false
                CurrentEntry = nil
                CleanupSmoothMovement()
                if FarmConn then
                    FarmConn:Disconnect()
                    FarmConn = nil
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.10)
        local G = getgenv()
        if G.AutoThunderSpear then
            if not G.SpearFarm then
                G.SpearFarm = true
                G.FarmStartTime = tick()
                SpearCurrentEntry = nil
                LastSpearAttackTime = tick()
                if not SpearFarmConn then
                    CreateSpearFarmLoop()
                end
            end
        else
            if G.SpearFarm then
                G.SpearFarm = false
                SpearCurrentEntry = nil
                CleanupSmoothMovement()
                if SpearFarmConn then
                    SpearFarmConn:Disconnect()
                    SpearFarmConn = nil
                end
            end
        end
    end
end)

-- ===== loop เช็คและสร้างใหม่ =====
task.spawn(function()
    while task.wait(0.1) do
        local G = getgenv()
        if G.AutoFarmBlade and (not FarmConn or not FarmConn.Connected) then
            CreateFarmLoop()
        end
    end
end)

-- ===== Auto Farm self-heal =====
-- Keeps Blade Auto Farm alive across Auto Retry / character reloads.
task.spawn(function()
    local lastHealPrint = 0

    while task.wait(0.25) do
        local G = getgenv()

        if G.AutoFarmBlade then
            local rewardsVisible = false
            pcall(function()
                rewardsVisible = IsRewardsUIVisible()
            end)

            -- During the actual Rewards screen, leave the attack/movement
            -- paused. As soon as it disappears, fully restore farm state.
            if not rewardsVisible then
                local healed = false

                if not G.Farm then
                    G.Farm = true
                    G.FarmStartTime = tick()
                    CurrentEntry = nil
                    LastAttackTime = 0
                    healed = true
                end

                if not FarmConn or not FarmConn.Connected then
                    CreateFarmLoop()
                    healed = true
                end

                local char = Player.Character
                local hum = char and char:FindFirstChildOfClass("Humanoid")

                if hum and hum.Health > 0 and isDead then
                    isDead = false
                    CurrentEntry = nil
                    healed = true
                end

                if healed and (tick() - lastHealPrint) > 2 then
                    lastHealPrint = tick()
                    print("[AutoFarm] self-recovered")
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        local G = getgenv()
        if G.AutoThunderSpear and (not SpearFarmConn or not SpearFarmConn.Connected) then
            CreateSpearFarmLoop()
        end
    end
end)



if ({[MAIN_MENU_ID]=true,[LOBBY_ID]=true})[game.PlaceId] then return end

-- OPTIMIZED: removed duplicated Thunder Spear implementation.
-- The primary implementation above is the only active copy.


-- Target-return lock.
-- When the mission counter reaches its goal, Auto Retry must stop clicking Retry.
getgenv().TownShipReturnInProgress = false

if Tabs.AutoFarm then
    task.spawn(function()
        local lastClick = 0
        local clickCooldown = 1.0
        local firstSeenAt = 0
        local initialDelay = 1.2  -- wait a bit after rewards appear before first click

        local function IsActuallyVisible(gui)
            if not gui then return false end
            local ok = pcall(function()
                if gui:IsA("GuiObject") then
                    if not gui.Visible then return false end
                    if gui.AbsoluteSize.X <= 0 or gui.AbsoluteSize.Y <= 0 then return false end
                end
                if gui:IsA("ScreenGui") and not gui.Enabled then return false end
            end)
            if not ok then return false end

            local current = gui
            while current and current ~= game do
                if current:IsA("GuiObject") and not current.Visible then return false end
                if current:IsA("ScreenGui") and not current.Enabled then return false end
                current = current.Parent
            end
            return true
        end

        local function findRetryButton(player)
            local ok, btn = pcall(function()
                return player.PlayerGui.Interface.Rewards.Main.Info.Main.Buttons.Retry
            end)
            if ok and btn then return btn end

            -- fallback: search under Rewards
            local ok2, rewards = pcall(function()
                return player.PlayerGui.Interface.Rewards
            end)
            if not ok2 or not rewards then return nil end

            local found = nil
            pcall(function()
                for _, d in ipairs(rewards:GetDescendants()) do
                    if d.Name == "Retry" and (d:IsA("TextButton") or d:IsA("ImageButton") or d:IsA("GuiButton")) then
                        found = d
                        break
                    end
                end
            end)
            return found
        end

        local function clickRetry(btn)
            local VIM = game:GetService("VirtualInputManager")
            local GS = game:GetService("GuiService")
            local clicked = false

            -- Method 1: mouse click on center of button
            pcall(function()
                local inset = GS:GetGuiInset()
                local pos = btn.AbsolutePosition
                local size = btn.AbsoluteSize
                local x = pos.X + size.X / 2 + inset.X
                local y = pos.Y + size.Y / 2 + inset.Y
                VIM:SendMouseMoveEvent(x, y, game)
                task.wait(0.02)
                VIM:SendMouseButtonEvent(x, y, 0, true, game, 0)
                task.wait(0.04)
                VIM:SendMouseButtonEvent(x, y, 0, false, game, 0)
                clicked = true
            end)

            -- Method 2: GuiService select + Enter
            pcall(function()
                GS.SelectedObject = btn
                task.wait(0.03)
                VIM:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                task.wait(0.03)
                VIM:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                task.wait(0.05)
                GS.SelectedObject = nil
            end)

            -- Method 3: fire button events if possible
            pcall(function()
                if btn.Activated then
                    firesignal(btn.Activated)
                end
            end)
            pcall(function()
                if typeof(btn) == "Instance" and btn:IsA("GuiButton") then
                    for _, sig in ipairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
                        pcall(function()
                            if firesignal and btn[sig] then
                                firesignal(btn[sig])
                            end
                        end)
                    end
                end
            end)

            return clicked
        end

        while true do
            task.wait(0.15)

            if not getgenv().StartRejoin
                or getgenv().TownShipReturnInProgress then

                firstSeenAt = 0
                continue
            end

            local player = game:GetService("Players").LocalPlayer
            if not player or not player.PlayerGui then continue end

            local rewardsVisible = false
            pcall(function()
                local r = player.PlayerGui.Interface.Rewards
                if r and IsActuallyVisible(r) then
                    rewardsVisible = true
                end
            end)

            local retry = findRetryButton(player)
            local retryVisible = retry and IsActuallyVisible(retry)

            if not rewardsVisible or not retryVisible then
                firstSeenAt = 0
                continue
            end

            -- first time we see it this round
            if firstSeenAt == 0 then
                firstSeenAt = tick()
            end

            -- wait a short delay so rewards UI fully loads
            if tick() - firstSeenAt < initialDelay then
                continue
            end

            -- cooldown between clicks
            if tick() - lastClick < clickCooldown then
                continue
            end

            -- keep clicking while button is still visible
            clickRetry(retry)
            lastClick = tick()
        end
    end)
end

-- ===== Mission Counter + Auto Return to Town Central =====
task.spawn(function()
    local lastRewardsVisible = false

    local function IsActuallyVisible(gui)
        if not gui then
            return false
        end

        local ok, result = pcall(function()
            if gui:IsA("GuiObject") then
                if not gui.Visible then
                    return false
                end

                if gui.AbsoluteSize.X <= 0 or gui.AbsoluteSize.Y <= 0 then
                    return false
                end
            end

            local current = gui

            while current and current ~= game do
                if current:IsA("GuiObject") and not current.Visible then
                    return false
                end

                if current:IsA("ScreenGui") and not current.Enabled then
                    return false
                end

                current = current.Parent
            end

            return true
        end)

        return ok and result == true
    end

    -- Find the Rewards button that leaves the mission.
    --
    -- Different versions of the game may call it:
    -- Leave / Lobby / Return / Exit / Menu.
    --
    -- Final fallback:
    -- if the Rewards button container has Retry + one other visible button,
    -- use the other button.
    local function findLeaveButton(player)
        local rewards = nil

        pcall(function()
            rewards = player.PlayerGui.Interface.Rewards
        end)

        if not rewards then
            return nil
        end

        local buttons = nil

        pcall(function()
            buttons = rewards.Main.Info.Main.Buttons
        end)

        local candidates = {}
        local fallbackNonRetry = {}

        local function inspect(root)
            if not root then
                return
            end

            for _, obj in ipairs(root:GetDescendants()) do
                if obj:IsA("GuiButton") then
                    local name = string.lower(tostring(obj.Name or ""))
                    local textValue = ""

                    pcall(function()
                        textValue = string.lower(tostring(obj.Text or ""))
                    end)

                    local combined = name .. " " .. textValue

                    if not combined:find("retry", 1, true) then
                        table.insert(fallbackNonRetry, obj)

                        local score = 0

                        if combined:find("leave", 1, true) then
                            score = 100
                        elseif combined:find("lobby", 1, true) then
                            score = 90
                        elseif combined:find("return", 1, true) then
                            score = 80
                        elseif combined:find("exit", 1, true) then
                            score = 70
                        elseif combined:find("menu", 1, true) then
                            score = 60
                        end

                        if score > 0 then
                            table.insert(candidates, {
                                Button = obj,
                                Score = score,
                            })
                        end
                    end
                end
            end
        end

        inspect(buttons or rewards)

        table.sort(candidates, function(a, b)
            return a.Score > b.Score
        end)

        for _, entry in ipairs(candidates) do
            if IsActuallyVisible(entry.Button) then
                return entry.Button
            end
        end

        -- Very useful fallback for a Rewards UI that only has two actions:
        -- Retry + one other button.
        for _, btn in ipairs(fallbackNonRetry) do
            if IsActuallyVisible(btn) then
                return btn
            end
        end

        return nil
    end

    local function clickGuiButton(btn)
        if not btn then
            return false
        end

        local VIM = game:GetService("VirtualInputManager")
        local GS = game:GetService("GuiService")
        local clicked = false

        -- Method 1: center mouse click.
        pcall(function()
            local inset = GS:GetGuiInset()
            local pos = btn.AbsolutePosition
            local size = btn.AbsoluteSize

            local x = pos.X + (size.X / 2) + inset.X
            local y = pos.Y + (size.Y / 2) + inset.Y

            VIM:SendMouseMoveEvent(x, y, game)
            task.wait(0.03)

            VIM:SendMouseButtonEvent(x, y, 0, true, game, 0)
            task.wait(0.05)
            VIM:SendMouseButtonEvent(x, y, 0, false, game, 0)

            clicked = true
        end)

        -- Method 2: select button and press Enter.
        pcall(function()
            GS.SelectedObject = btn
            task.wait(0.04)

            VIM:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
            task.wait(0.04)
            VIM:SendKeyEvent(false, Enum.KeyCode.Return, false, game)

            task.wait(0.05)
            GS.SelectedObject = nil

            clicked = true
        end)

        -- Method 3: fire button signals if executor supports firesignal.
        pcall(function()
            if firesignal and btn.Activated then
                firesignal(btn.Activated)
                clicked = true
            end
        end)

        pcall(function()
            if firesignal and btn:IsA("GuiButton") then
                for _, signalName in ipairs({
                    "MouseButton1Click",
                    "MouseButton1Down",
                    "Activated",
                }) do
                    pcall(function()
                        if btn[signalName] then
                            firesignal(btn[signalName])
                            clicked = true
                        end
                    end)
                end
            end
        end)

        return clicked
    end

    local function clickRewardsLeave(player)
        local started = tick()
        local lastDebug = 0

        -- Wait up to 4 seconds because the Rewards buttons may animate/create late.
        while tick() - started < 4 do
            local leaveButton = findLeaveButton(player)

            if leaveButton and IsActuallyVisible(leaveButton) then
                print(
                    "[MissionCounter] Leave target:",
                    leaveButton:GetFullName()
                )

                -- Repeat because some clients ignore the first click while
                -- the Rewards animation is still settling.
                for attempt = 1, 5 do
                    if not leaveButton.Parent then
                        return true
                    end

                    clickGuiButton(leaveButton)
                    task.wait(0.15)

                    -- If Rewards disappeared, Leave worked.
                    local rewardsStillVisible = false

                    pcall(function()
                        local rewards = player.PlayerGui.Interface.Rewards
                        rewardsStillVisible =
                            rewards ~= nil
                            and IsActuallyVisible(rewards)
                    end)

                    if not rewardsStillVisible then
                        print("[MissionCounter] Leave click succeeded")
                        return true
                    end
                end
            end

            if tick() - lastDebug >= 1 then
                lastDebug = tick()
                print("[MissionCounter] Waiting for Leave button...")
            end

            task.wait(0.10)
        end

        warn("[MissionCounter] Could not click Rewards Leave button")
        return false
    end

    -- This is based on the script's existing FailSafe leave path.
    -- It sends ALL known mission/lobby leave commands.
    local function sendLeaveCommands()
        -- Mission Leave remote.
        pcall(function()
            GET:InvokeServer("S_Missions", "Leave")
        end)

        -- POST teleport commands used by the existing FailSafe system.
        pcall(function()
            POST:FireServer("Functions", "Teleport", "Menu", nil)
        end)

        pcall(function()
            POST:FireServer("Functions", "Teleport", "Lobby", nil)
        end)

        -- GET teleport fallback used elsewhere in the script.
        pcall(function()
            GET:InvokeServer("Functions", "Teleport", "Menu")
        end)
    end

    while true do
        task.wait(0.25)

        local player = game:GetService("Players").LocalPlayer

        if not player or not player.PlayerGui then
            continue
        end

        local interface = player.PlayerGui:FindFirstChild("Interface")

        if not interface then
            continue
        end

        local rewards = interface:FindFirstChild("Rewards")
        local isVisible = rewards and IsActuallyVisible(rewards)

        if isVisible and not lastRewardsVisible then
            completedMissions = completedMissions + 1
            saveMissionsCount()

            pcall(function()
                if missionLabel then
                    missionLabel:SetText(
                        "Completed: " .. completedMissions
                    )
                end
            end)

            Library:Notify(
                string.format(
                    "Mission Completed! (%d/%d)",
                    completedMissions,
                    targetMissions
                ),
                4
            )

            if autoReturnEnabled
                and completedMissions >= targetMissions
                and not isReturning then

                isReturning = true

                -- Stop Retry BEFORE it gets its first click.
                getgenv().TownShipReturnInProgress = true
                getgenv().StartRejoin = false

                Library:Notify(
                    string.format(
                        "Reached %d missions -> Leaving mission...",
                        targetMissions
                    ),
                    5
                )

                -- Short settle so the Rewards buttons are fully created.
                task.wait(0.45)

                -- First: actually click the visible Rewards Leave/Lobby button.
                local clickedLeave = clickRewardsLeave(player)

                -- Second: send the game's own Leave + lobby commands.
                -- Do this even when the click worked, as a backup.
                sendLeaveCommands()

                -- Give those commands a moment to transition us.
                task.wait(0.8)

                -- Reset counter only after we have performed the leave actions.
                completedMissions = 0
                saveMissionsCount()

                pcall(function()
                    if missionLabel then
                        missionLabel:SetText("Completed: 0")
                    end
                end)

                -- Final fallback: Roblox teleport directly to lobby.
                if game.PlaceId ~= LOBBY_ID then
                    pcall(function()
                        TeleportService:Teleport(LOBBY_ID, Player)
                    end)
                end

                -- Keep retrying the leave/lobby path if the first transition
                -- did not happen.
                task.delay(3, function()
                    if game.PlaceId ~= LOBBY_ID then
                        print(
                            "[MissionCounter] Still in mission - retrying leave",
                            "ButtonClicked=" .. tostring(clickedLeave)
                        )

                        sendLeaveCommands()

                        task.wait(0.5)

                        pcall(function()
                            TeleportService:Teleport(LOBBY_ID, Player)
                        end)
                    end
                end)
            end
        end

        lastRewardsVisible = isVisible
    end
end)


getgenv().AutoReloadBlade = getgenv().AutoReloadBlade or false

task.spawn(function()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local VIM = game:GetService("VirtualInputManager")

    local Remotes = ReplicatedStorage
        :WaitForChild("Assets")
        :WaitForChild("Remotes")

    local GET = Remotes:WaitForChild("GET")
    local POST = Remotes:WaitForChild("POST")

    -- ============================================================
    -- FAST AUTO RELOAD
    --
    -- Old version had:
    --   refill cooldown       = 1.5s
    --   R cooldown            = 1.0s
    --   fixed refill wait     = 1.5s
    --   reload start wait     = 0.3s
    --   outer action wait     = 0.5s
    --   outer scan delay      = 0.1s
    --
    -- This version reacts/polls instead of sleeping for fixed times.
    -- ============================================================

    local COOLDOWN_REFILL = 0.25
    local COOLDOWN_R_PRESS = 0.15

    local REFILL_RETRY_DELAY = 0.08
    local REFILL_TIMEOUT = 1.10

    local RELOAD_RETRY_DELAY = 0.035
    local RELOAD_TIMEOUT = 1.25

    local LOOP_DELAY = 0.03
    local CACHE_REFRESH_INTERVAL = 5

    local lastRefillTime = 0
    local lastRPressTime = 0

    local refillBusy = false
    local reloadBusy = false

    local validRefills = {}
    local refillIndex = 1

    -- ------------------------------------------------------------
    -- Refill cache
    -- ------------------------------------------------------------

    local function refreshRefillCache()
        local newCache = {}
        local seen = {}

        pcall(function()
            local roots = {
                workspace:FindFirstChild("Unclimbable"),
                workspace:FindFirstChild("Climbable"),
                workspace,
            }

            for _, root in ipairs(roots) do
                if root then
                    for _, obj in ipairs(root:GetDescendants()) do
                        if obj.Name == "Refill"
                            and obj:IsA("BasePart")
                            and not seen[obj] then

                            seen[obj] = true
                            table.insert(newCache, obj)
                        end
                    end
                end
            end
        end)

        if #newCache > 0 then
            validRefills = newCache
        end
    end

    refreshRefillCache()

    task.spawn(function()
        while true do
            task.wait(CACHE_REFRESH_INTERVAL)

            if getgenv().AutoReloadBlade then
                refreshRefillCache()
            end
        end
    end)

    -- ------------------------------------------------------------
    -- Blade state
    -- ------------------------------------------------------------

    local function NeedReload()
        local characters = workspace:FindFirstChild("Characters")
        if not characters then return false end

        local playerChar = characters:FindFirstChild(LocalPlayer.Name)
        if not playerChar then return false end

        local rig = playerChar:FindFirstChild("Rig_" .. LocalPlayer.Name)
        if not rig then return false end

        local leftHand = rig:FindFirstChild("LeftHand")
        local rightHand = rig:FindFirstChild("RightHand")

        if leftHand then
            local blade = leftHand:FindFirstChild("Blade_1")
            if blade and blade.Transparency == 1 then
                return true
            end
        end

        if rightHand then
            local blade = rightHand:FindFirstChild("Blade_1")
            if blade and blade.Transparency == 1 then
                return true
            end
        end

        return false
    end

    local function getBladeSetCount()
        local count = nil

        -- Fast known path first.
        pcall(function()
            local sets =
                LocalPlayer.PlayerGui
                .Interface.HUD.Main.Top["7"]
                .Blades.Sets

            if sets and sets:IsA("TextLabel") and sets.Text then
                count = tonumber(
                    tostring(sets.Text)
                        :gsub("%s+", "")
                        :match("^(%d+)/")
                )
            end
        end)

        if count ~= nil then
            return count
        end

        -- Fallback scan for maps/UI variants.
        pcall(function()
            local top =
                LocalPlayer.PlayerGui
                .Interface.HUD.Main.Top

            if not top then return end

            for _, child in ipairs(top:GetChildren()) do
                local blades = child:FindFirstChild("Blades")
                local sets = blades and blades:FindFirstChild("Sets")

                if sets
                    and sets:IsA("TextLabel")
                    and sets.Text then

                    local n = sets.Text:match("(%d+)%s*/")

                    if n then
                        count = tonumber(n)
                        return
                    end
                end
            end
        end)

        return count
    end

    local function isZeroThree()
        local count = getBladeSetCount()
        return count ~= nil and count <= 0
    end

    -- ------------------------------------------------------------
    -- Fast refill
    -- ------------------------------------------------------------

    local function PerformRefill()
        if refillBusy or reloadBusy then
            return false
        end

        local now = tick()

        if now - lastRefillTime < COOLDOWN_REFILL then
            return false
        end

        -- Remove dead cached parts.
        local alive = {}

        for _, refill in ipairs(validRefills) do
            if refill and refill.Parent then
                table.insert(alive, refill)
            end
        end

        validRefills = alive

        if #validRefills == 0 then
            refreshRefillCache()

            if #validRefills == 0 then
                return false
            end
        end

        lastRefillTime = now
        refillBusy = true
        getgenv().IsRefilling = true

        local target =
            validRefills[((refillIndex - 1) % #validRefills) + 1]

        refillIndex = refillIndex + 1

        local started = tick()
        local success = false

        -- Send immediately, then poll the set counter. Repeat only while
        -- the server still reports 0 sets.
        repeat
            pcall(function()
                POST:FireServer(
                    "Attacks",
                    "Reload",
                    target
                )
            end)

            task.wait(REFILL_RETRY_DELAY)

            if not isZeroThree() then
                success = true
                break
            end

        until not getgenv().AutoReloadBlade
            or (tick() - started) >= REFILL_TIMEOUT

        getgenv().IsRefilling = false
        refillBusy = false

        return success
    end

    -- ------------------------------------------------------------
    -- Fast blade reload
    -- ------------------------------------------------------------

    local function PressR()
        if reloadBusy or refillBusy then
            return false
        end

        local now = tick()

        if now - lastRPressTime < COOLDOWN_R_PRESS then
            return false
        end

        lastRPressTime = now
        reloadBusy = true
        getgenv().IsReloading = true

        -- Keep the original R press because the game/client may expect it.
        pcall(function()
            VIM:SendKeyEvent(
                true,
                Enum.KeyCode.R,
                false,
                game
            )

            task.wait(0.015)

            VIM:SendKeyEvent(
                false,
                Enum.KeyCode.R,
                false,
                game
            )
        end)

        local started = tick()
        local success = false

        -- No old 0.3s startup delay.
        -- Send the known reload remote immediately and stop as soon as
        -- the blade becomes visible again.
        repeat
            if not NeedReload() then
                success = true
                break
            end

            pcall(function()
                GET:InvokeServer(
                    "Blades",
                    "Reload"
                )
            end)

            task.wait(RELOAD_RETRY_DELAY)

        until not getgenv().AutoReloadBlade
            or (tick() - started) >= RELOAD_TIMEOUT

        if not NeedReload() then
            success = true
        end

        getgenv().IsReloading = false
        reloadBusy = false

        return success
    end

    -- ------------------------------------------------------------
    -- Main fast loop
    -- ------------------------------------------------------------

    while true do
        if getgenv().AutoReloadBlade
            and not reloadBusy
            and not refillBusy
            and NeedReload() then

            if isZeroThree() then
                PerformRefill()

                -- As soon as the server gives us a new blade set,
                -- reload the hand blades immediately instead of waiting
                -- for another 0.5s loop.
                if getgenv().AutoReloadBlade
                    and NeedReload()
                    and not isZeroThree() then

                    PressR()
                end
            else
                PressR()
            end
        end

        task.wait(LOOP_DELAY)
    end
end)
if Tabs.Webhook then
    local WebhookGroup = Tabs.Webhook:AddLeftGroupbox("Discord Webhook")
    
    local webhookURL = ""
    local webhookEnabled = false
    local hasSentWebhook = false
    local lastMissionState = ""
    local webhookMode = "All Data"
    local webhookPingMode = "None"
    
    local gamesPlayed = 0
    local gamesPlayedPath = "TownShip/games_played_" .. tostring(Player.UserId) .. ".txt"
    
    if isfile(gamesPlayedPath) then
        gamesPlayed = tonumber(readfile(gamesPlayedPath)) or 0
    else
        writefile(gamesPlayedPath, "0")
    end
    
    local function incrementGamesPlayed()
        gamesPlayed = gamesPlayed + 1
        writefile(gamesPlayedPath, tostring(gamesPlayed))
    end
    
    local ItemsModule = nil
    local IconToNameMap = {}
    
    local function loadItemsModule()
        local success, module = pcall(function()
            return require(game:GetService("ReplicatedStorage").Modules.Storage.Items)
        end)
        if success and type(module) == "table" then
            ItemsModule = module
            for itemName, itemData in pairs(module) do
                if type(itemData) == "table" and itemData.Image then
                    local img = tostring(itemData.Image)
                    local assetId = img:match("rbxassetid://(%d+)") or img:match("^(%d+)$")
                    if assetId then
                        IconToNameMap[assetId] = itemName
                    end
                end
            end
            return true
        end
        return false
    end
    
    task.spawn(function()
        task.wait(1)
        loadItemsModule()
    end)
    
    local function findUIElements()
        local player = game:GetService("Players").LocalPlayer
        local playerGui = player:FindFirstChild("PlayerGui")
        if not playerGui then return nil, nil end
        local interface = playerGui:FindFirstChild("Interface")
        if not interface then return nil, nil end
        local rewards = interface:FindFirstChild("Rewards")
        if not rewards then return nil, nil end
        local main = rewards:FindFirstChild("Main")
        if not main then return nil, nil end
        local info = main:FindFirstChild("Info")
        if not info then return nil, nil end
        local mainInfo = info:FindFirstChild("Main")
        if not mainInfo then return nil, nil end
        local statsFrame = mainInfo:FindFirstChild("Stats")
        local itemsFrame = mainInfo:FindFirstChild("Items")
        return statsFrame, itemsFrame
    end
    
    local function waitForServerData(maxWait)
        local start = tick()
        local lastData = nil
        local GET = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("GET")
        while tick() - start < maxWait do
            local success, data = pcall(function()
                return GET:InvokeServer("Data", "Copy")
            end)
            if success and data and data.Slots then
                local slot = data.Slots[data.Current_Slot or "A"]
                if slot and slot.Currency and slot.Progression then
                    if (slot.Currency.Gold or 0) > 0 or (slot.Currency.Gems or 0) > 0 or (slot.Progression.Level or 0) > 0 then
                        lastData = data
                        break
                    end
                end
                lastData = data
            end
            task.wait(0.15)
        end
        return lastData
    end
    
    local function waitForUIElements(maxWait)
        local start = tick()
        local statsFrame, itemsFrame = nil, nil
        while tick() - start < maxWait do
            statsFrame, itemsFrame = findUIElements()
            local hasStat = false
            local hasItem = false
            if statsFrame then
                for _, v in ipairs(statsFrame:GetChildren()) do
                    if v:IsA("Frame") and v:FindFirstChild("Amount") then
                        local amount = v.Amount.Text
                        if amount and amount ~= "0" and amount ~= "" then
                            hasStat = true
                            break
                        end
                    end
                end
            end
            if itemsFrame then
                for _, v in ipairs(itemsFrame:GetChildren()) do
                    if v:IsA("Frame") and v:FindFirstChild("Main") then
                        local inner = v.Main:FindFirstChild("Inner")
                        if inner and inner.Quantity and inner.Quantity.Text ~= "0" and inner.Quantity.Text ~= "" then
                            hasItem = true
                            break
                        end
                    end
                end
            end
            if hasStat or hasItem then break end
            task.wait(0.2)
        end
        return findUIElements()
    end
    
    -- ===== ฟังก์ชันจัดรูปแบบตัวเลข (ตัดทศนิยม) =====
    local function formatNumberWithComma(num)
        if type(num) == "string" then
            local clean = num:gsub("[^%d.]", "")
            num = tonumber(clean) or 0
        end
        if type(num) ~= "number" then return tostring(num) end
        num = math.floor(num)  -- ตัดทศนิยมทิ้ง
        local str = tostring(num)
        local formatted = ""
        local len = #str
        for i = 1, len do
            formatted = formatted .. str:sub(i, i)
            if (len - i) % 3 == 0 and i < len then
                formatted = formatted .. ","
            end
        end
        return formatted
    end
    
    -- ===== ฟังก์ชันดึงข้อมูล Reward แบบเรียลไทม์ =====
    local function getRealTimeRewardData()
        local success, result = pcall(function()
            local GET = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("GET")
            return GET:InvokeServer("S_Rewards", "Get")
        end)
        if not success or not result then return nil end
        if type(result) == "table" then
            if result.Obtained or result.Stats then
                return result
            end
            if #result > 0 and type(result[1]) == "table" then
                return result[1]
            end
        end
        return nil
    end

    -- ===== Mission Timer (exact Rewards UI value) =====
    local function getMissionTime()
        local ok, value = pcall(function()
            return game:GetService("Players")
                .LocalPlayer
                .PlayerGui
                .Interface
                .Rewards
                .Main
                .Info
                .Main
                .Stats
                .Time_Taken
                .Amount
                .Text
        end)

        if ok and value and value ~= "" then
            return tostring(value)
        end

        return "Unknown"
    end

    -- Forward declarations because the webhook functions use these helpers
    -- before their implementations appear later in the file.
    local getAllRewards
    local getCurrentMissionRewardsText
    
    -- ===== ฟังก์ชันส่ง Reward Webhook =====
    local function sendRewardWebhook()
        if webhookURL == "" then return end
        incrementGamesPlayed()
        
        if not ItemsModule or #IconToNameMap == 0 then
            loadItemsModule()
        end
        
        local player = game:GetService("Players").LocalPlayer
        local executor = identifyexecutor and identifyexecutor() or "Unknown"
        
        local totalData = { Level = 1, Gold = 0, Gems = 0 }
        pcall(function()
            local GET = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("GET")
            local mapData = GET:InvokeServer("Data", "Copy")
            local slotIndex = player:GetAttribute("Slot") or "A"
            if mapData and mapData.Slots and mapData.Slots[slotIndex] then
                local slot = mapData.Slots[slotIndex]
                if slot.Currency then
                    totalData.Gold = slot.Currency.Gold or 0
                    totalData.Gems = slot.Currency.Gems or 0
                end
                if slot.Progression then
                    totalData.Level = slot.Progression.Level or 1
                end
            end
        end)
        
        local rewardData = getRealTimeRewardData()
        
        if not rewardData then
            -- Fallback: ใช้ข้อมูลจาก UI
            local statsFrame, _ = findUIElements()
            local stats = {}
            if statsFrame then
                for _, v in ipairs(statsFrame:GetChildren()) do
                    if v:IsA("Frame") and v:FindFirstChild("Stat") and v:FindFirstChild("Amount") then
                        local statName = string.gsub(v.Name, "_", " ")
                        stats[statName] = v.Amount.Text
                    end
                end
            end
            
            local rewardsUI = getAllRewards()
            local kills = stats["Kills"] or 0
            local crits = stats["Crits"] or 0
            local damage = stats["Damage"] or "0"
            local damageNum = tonumber(damage:gsub("[^%d.]", "")) or 0
            local missionTimer = getMissionTime()
            local currentMissionRewards = getCurrentMissionRewardsText(nil)
            
            local xp, gold, gems, shards = 0, 0, 0, 0
            for _, item in ipairs(rewardsUI) do
                if item.name == "XP" then xp = tonumber(item.qty:match("%d+")) or 0 end
                if item.name == "Gold" then gold = tonumber(item.qty:match("%d+")) or 0 end
                if item.name == "Gems" then gems = tonumber(item.qty:match("%d+")) or 0 end
                if item.name == "Shards" then shards = tonumber(item.qty:match("%d+")) or 0 end
            end
            
            local perksList = "None"
            local isCompleted, isClaimed = true, true
            local statusTitle = "COMPLETED ✅"
            local color = 0x00ff00
            
            local pingContent = nil
            if webhookPingMode == "Everyone" then
                pingContent = "@everyone"
            elseif webhookPingMode == "Here" then
                pingContent = "@here"
            end
            
            local payload = {
                content = pingContent,
                embeds = {{
                    title = string.format("[%s] %s", statusTitle, player.Name),
                    color = color,
                    fields = {
                        { name = "STATS", value = string.format("Mission Time: %s\nKills: %s\nCrits: %s\nDamage: %s", missionTimer, kills, crits, formatNumberWithComma(damageNum)), inline = false },
                        { name = "REWARDS", value = string.format("XP: %s\nGold: %s\nGems: %s\nShards: %s", formatNumberWithComma(xp), formatNumberWithComma(gold), formatNumberWithComma(gems), formatNumberWithComma(shards)), inline = false },
                        { name = "CURRENT MISSION REWARDS", value = currentMissionRewards, inline = false },
                        { name = "PERKS", value = perksList, inline = false },
                        { name = "INFO", value = string.format("User: %s\nExecutor: %s\nGames Played: %d\nGold: %s\nGems: %s", player.Name, executor, gamesPlayed, formatNumberWithComma(totalData.Gold), formatNumberWithComma(totalData.Gems)), inline = false }
                    },
                    footer = { text = "TownShip • " .. os.date("%Y-%m-%d %H:%M:%S") },
                    timestamp = DateTime.now():ToIsoDate()
                }}
            }
            pcall(function()
                request({ Url = webhookURL, Method = "POST", Headers = { ["Content-Type"] = "application/json" }, Body = game:GetService("HttpService"):JSONEncode(payload) })
            end)
            return
        end
        
        -- ===== ใช้ข้อมูลจาก S_Rewards Get =====
        local kills = rewardData.Stats and rewardData.Stats.Kills or 0
        local crits = rewardData.Stats and rewardData.Stats.Crits or 0
        local damage = rewardData.Stats and rewardData.Stats.Damage or 0
        local missionTimer = getMissionTime()
        local currentMissionRewards = getCurrentMissionRewardsText(rewardData)
        
        local xp = rewardData.Obtained and rewardData.Obtained.XP or 0
        local gold = rewardData.Obtained and rewardData.Obtained.Gold or 0
        local gems = rewardData.Obtained and rewardData.Obtained.Gems or 0
        local shards = rewardData.Obtained and rewardData.Obtained.Shards or 0
        
        local perksList = "None"
        if rewardData.Obtained and rewardData.Obtained.Perks and #rewardData.Obtained.Perks > 0 then
            perksList = "• " .. table.concat(rewardData.Obtained.Perks, "\n• ")
        end
        
        local isCompleted = rewardData.Completed or false
        local isClaimed = rewardData.Claimed or false
        local statusTitle = "IN PROGRESS"
        local color = 0xffaa00
        if isCompleted and isClaimed then
            statusTitle = "COMPLETED ✅"
            color = 0x00ff00
        elseif isCompleted and not isClaimed then
            statusTitle = "COMPLETED ⏳"
            color = 0x00aaff
        end
        
        local pingContent = nil
        if webhookPingMode == "Everyone" then
            pingContent = "@everyone"
        elseif webhookPingMode == "Here" then
            pingContent = "@here"
        end
        
        local payload = {
            content = pingContent,
            embeds = {{
                title = string.format("[%s] %s", statusTitle, player.Name),
                color = color,
                fields = {
                    { name = "STATS", value = string.format("Mission Time: %s\nKills: %s\nCrits: %s\nDamage: %s", missionTimer, kills, crits, formatNumberWithComma(damage)), inline = false },
                    { name = "REWARDS", value = string.format("XP: %s\nGold: %s\nGems: %s\nShards: %s", formatNumberWithComma(xp), formatNumberWithComma(gold), formatNumberWithComma(gems), formatNumberWithComma(shards)), inline = false },
                    { name = "CURRENT MISSION REWARDS", value = currentMissionRewards, inline = false },
                    { name = "PERKS", value = perksList, inline = false },
                    { name = "INFO", value = string.format("User: %s\nExecutor: %s\nGames Played: %d\nGold: %s\nGems: %s", player.Name, executor, gamesPlayed, formatNumberWithComma(totalData.Gold), formatNumberWithComma(totalData.Gems)), inline = false }
                },
                footer = { text = "TownShip • " .. os.date("%Y-%m-%d %H:%M:%S") },
                timestamp = DateTime.now():ToIsoDate()
            }}
        }
        
        pcall(function()
            request({ 
                Url = webhookURL, 
                Method = "POST", 
                Headers = { ["Content-Type"] = "application/json" }, 
                Body = game:GetService("HttpService"):JSONEncode(payload) 
            })
            print("📤 Webhook sent successfully!")
        end)
    end
    
    -- ===== ฟังก์ชัน getAllRewards (ใช้ในกรณี fallback) =====
    getAllRewards = function()
        local player = game:GetService("Players").LocalPlayer
        local mainInfo = player.PlayerGui.Interface.Rewards.Main.Info.Main
        local rewardsList = {}
        
        local function extractFromFrame(frame)
            local qtyText = nil
            local itemName = nil
            local isRare = false
            
            local mainObj = frame:FindFirstChild("Main")
            local inner = mainObj and mainObj:FindFirstChild("Inner")
            if inner then
                local qtyObj = inner:FindFirstChild("Quantity")
                if qtyObj and qtyObj:IsA("TextLabel") then
                    qtyText = qtyObj.Text
                    local num = tonumber(qtyText:match("%d+"))
                    if num and num > 0 then
                        local icon = inner:FindFirstChild("Icon")
                        if icon and icon:IsA("ImageLabel") and icon.Image then
                            local assetId = tostring(icon.Image):match("rbxassetid://(%d+)") or tostring(icon.Image):match("^(%d+)$")
                            if assetId and IconToNameMap[assetId] then
                                itemName = IconToNameMap[assetId]
                            end
                        end
                        if not itemName then
                            local title = inner:FindFirstChild("Title")
                            if title and title:IsA("TextLabel") and title.Text ~= "" then
                                itemName = title.Text
                            else
                                local nameObj = inner:FindFirstChild("Name")
                                if nameObj and nameObj:IsA("TextLabel") and nameObj.Text ~= "" then
                                    itemName = nameObj.Text
                                end
                            end
                        end
                        local rarity = inner:FindFirstChild("Rarity")
                        if rarity and rarity.BackgroundColor3 == Color3.fromRGB(255, 0, 0) then
                            isRare = true
                        end
                    end
                end
            else
                local nameLabel = frame:FindFirstChild("Name") or frame:FindFirstChild("Title")
                local amountLabel = frame:FindFirstChild("Amount") or frame:FindFirstChild("Quantity")
                if nameLabel and nameLabel:IsA("TextLabel") and amountLabel and amountLabel:IsA("TextLabel") then
                    local num = tonumber(amountLabel.Text:match("%d+"))
                    if num and num > 0 then
                        qtyText = amountLabel.Text
                        itemName = nameLabel.Text
                    end
                end
            end
            
            if itemName and qtyText then
                table.insert(rewardsList, { name = itemName, qty = qtyText, rare = isRare })
                return true
            end
            return false
        end
        
        local function scanAll(obj)
            for _, child in ipairs(obj:GetChildren()) do
                if child:IsA("Frame") then
                    if extractFromFrame(child) then
                        -- found
                    else
                        scanAll(child)
                    end
                end
            end
        end
        scanAll(mainInfo)
        return rewardsList
    end

    -- ===== Current mission rewards =====
    -- Prefer S_Rewards/Get, then merge the Rewards UI so special drops are kept.
    getCurrentMissionRewardsText = function(rewardData)
        local lines = {}
        local seen = {}

        local function addLine(key, text)
            if not key or not text or text == "" then return end
            key = string.lower(tostring(key))
            if seen[key] then return end
            seen[key] = true
            table.insert(lines, tostring(text))
        end

        local obtained = type(rewardData) == "table" and rewardData.Obtained or nil
        if type(obtained) == "table" then
            for name, value in pairs(obtained) do
                if name == "Perks" and type(value) == "table" then
                    for _, perkName in ipairs(value) do
                        addLine("perk:" .. tostring(perkName), "• Perk: " .. tostring(perkName))
                    end
                elseif type(value) == "number" then
                    if value ~= 0 then
                        addLine("reward:" .. tostring(name), "• " .. tostring(name) .. ": " .. formatNumberWithComma(value))
                    end
                elseif type(value) == "string" then
                    if value ~= "" and value ~= "0" then
                        addLine("reward:" .. tostring(name), "• " .. tostring(name) .. ": " .. tostring(value))
                    end
                elseif type(value) == "table" then
                    for subName, qty in pairs(value) do
                        if type(qty) == "number" and qty ~= 0 then
                            addLine(
                                "reward:" .. tostring(subName),
                                "• " .. tostring(subName) .. ": x" .. formatNumberWithComma(qty)
                            )
                        elseif type(qty) == "string" and qty ~= "" then
                            addLine(
                                "reward:" .. tostring(subName),
                                "• " .. tostring(subName) .. ": " .. tostring(qty)
                            )
                        end
                    end
                end
            end
        end

        local ok, uiRewards = pcall(function()
            return getAllRewards()
        end)

        if ok and type(uiRewards) == "table" then
            for _, item in ipairs(uiRewards) do
                local itemName = tostring(item.name or "Unknown")
                local qty = tostring(item.qty or "")
                if itemName ~= "Unknown" and qty ~= "" then
                    addLine("reward:" .. itemName, "• " .. itemName .. ": " .. qty)
                end
            end
        end

        if #lines == 0 then
            return "None"
        end

        table.sort(lines)
        local text = table.concat(lines, "\n")

        -- Discord embed field values are capped at 1024 characters.
        if #text > 1000 then
            text = text:sub(1, 997) .. "..."
        end

        return text
    end
    
    -- ===== ฟังก์ชันอื่นๆ (ส่ง All Data, Mission ฯลฯ) =====
    local filters = {
        Currency = true,
        Progression = true,
        Loadout = true,
        Inventory = true,
        Cosmetics = true,
    }
    
    local function fmt(n)
        if type(n) ~= "number" then return tostring(n) end
        if n >= 1e9 then return string.format("%.2fB", n/1e9)
        elseif n >= 1e6 then return string.format("%.2fM", n/1e6)
        elseif n >= 1e3 then return string.format("%.1fK", n/1e3)
        else return tostring(n) end
    end
    
    local function getItems(tbl, prefix)
        if not tbl then return nil end
        local items = {}
        for name, qty in pairs(tbl) do
            table.insert(items, {name = name, qty = qty})
        end
        table.sort(items, function(a, b)
            return string.lower(a.name) < string.lower(b.name)
        end)
        local lines = {}
        for _, item in ipairs(items) do
            table.insert(lines, (prefix or "• ") .. item.name .. ": x" .. tostring(item.qty))
        end
        return #lines > 0 and table.concat(lines, "\n") or nil, #lines
    end
    
    local function getMissionState()
        local ok, state = pcall(function()
            return game:GetService("Players").LocalPlayer.PlayerGui.Interface.Rewards.Main.Info.State.Text
        end)
        return ok and state or ""
    end
    
    local function formatModifiersText(modifiers)
        local order = {
            "No Perks", "No Skills", "No Memories", "Nightmare", "Oddball",
            "Injury Prone", "Chronic Injuries", "Fog", "Glass Cannon", "Time Trial", "Boring", "Simple"
        }
        if not modifiers or type(modifiers) ~= "table" then return "None" end
        local modList = {}
        for k, v in pairs(modifiers) do
            if type(k) == "number" then modList[#modList+1] = tostring(v)
            elseif type(v) == "boolean" and v then modList[#modList+1] = tostring(k)
            elseif type(v) == "string" then modList[#modList+1] = v end
        end
        local sortedMods = {}
        for _, modName in ipairs(order) do
            for _, m in ipairs(modList) do
                if m == modName then table.insert(sortedMods, m) break end
            end
        end
        for _, m in ipairs(modList) do
            local found = false
            for _, ordered in ipairs(order) do if m == ordered then found = true break end end
            if not found then table.insert(sortedMods, m) end
        end
        if #sortedMods == 0 then return "None" end
        return "- " .. table.concat(sortedMods, "\n- ")
    end
    
    local function sendMissionEndWebhook(missionState)
        if webhookURL == "" then return end
        
        local serverData = waitForServerData(3)
        if not serverData or not serverData.Slots then
            task.wait(0.5)
            serverData = waitForServerData(1)
        end
        waitForUIElements(2)
        local player = game:GetService("Players").LocalPlayer
        if not serverData then
            pcall(function()
                local GET = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("GET")
                serverData = GET:InvokeServer("Data", "Copy")
            end)
        end
        if not serverData or not serverData.Slots then return end
        local slot = serverData.Slots[serverData.Current_Slot or "A"]
        if not slot then return end
        local rewardData = getRealTimeRewardData()
        local missionTimer = getMissionTime()
        local currentMissionRewards = getCurrentMissionRewardsText(rewardData)

        local fields = {}
        if serverData.Map then
            local modsText = formatModifiersText(serverData.Map.Modifiers)
            local mapValue = string.format("Map: %s\nDifficulty: %s\nObjective: %s\nMission Time: %s\n\nModifiers:\n%s",
                serverData.Map.Map or "Unknown",
                serverData.Map.Difficulty or "Unknown",
                serverData.Map.Objective or "Unknown",
                missionTimer,
                modsText)
            table.insert(fields, {name = "Mission Info", value = mapValue, inline = false})
        else
            table.insert(fields, {name = "Mission Timer", value = missionTimer, inline = true})
        end

        table.insert(fields, {
            name = "Current Mission Rewards",
            value = currentMissionRewards,
            inline = false
        })

        if filters.Currency then
            table.insert(fields, {name = "Currency", value = string.format("Gold: %s\nGems: %s\nCanes: %s\nShards: %s",
                fmt(slot.Currency and slot.Currency.Gold or 0),
                fmt(slot.Currency and slot.Currency.Gems or 0),
                fmt(slot.Currency and slot.Currency.Canes or 0),
                fmt(slot.Currency and slot.Currency.Shards or 0)), inline = true})
        end
        if filters.Progression then
            table.insert(fields, {name = "Progression", value = string.format("Level: %s\nPrestige: %s\nXP: %s/%s",
                slot.Progression and slot.Progression.Level or 0,
                slot.Progression and slot.Progression.Prestige or 0,
                fmt(slot.Progression and slot.Progression.XP or 0),
                fmt(slot.Progression and slot.Progression.Max_XP or 0)), inline = true})
        end
        if filters.Loadout then
            table.insert(fields, {name = "Loadout", value = string.format("Weapon: %s\nSlot: %s\nSpins: %s",
                slot.Weapon or "?",
                serverData.Current_Slot or "A",
                fmt(slot.Total_Spins or 0)), inline = true})
        end
        if filters.Inventory and slot.Inventory and slot.Inventory.Items then
            local text, count = getItems(slot.Inventory.Items, "• ")
            if text then table.insert(fields, {name = "Inventory ("..count.." items)", value = ""..text.."", inline = false}) end
        end
        if filters.Cosmetics and slot.Inventory and slot.Inventory.Cosmetics then
            local text, count = getItems(slot.Inventory.Cosmetics, "• ")
            if text then table.insert(fields, {name = "Cosmetics ("..count.." items)", value = ""..text.."", inline = false}) end
        end
        local isCompleted = missionState and (missionState:find("COMPLETED") or missionState:find("FINISHED"))
        local color = isCompleted and 65280 or 16711680
        local body = game:GetService("HttpService"):JSONEncode({
            embeds = {{
                title = (missionState or "All Data") .. " - " .. player.Name,
                color = color,
                fields = fields,
                footer = {text = os.date("%Y-%m-%d %H:%M:%S")}
            }}
        })
        pcall(function()
            request({Url = webhookURL, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = body})
        end)
    end
    
    -- ===== เชื่อมต่อ Event เมื่อ Rewards เปิด =====
    task.spawn(function()
        local playerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
        local rewards = playerGui.Interface.Rewards
        rewards:GetPropertyChangedSignal("Visible"):Connect(function()
            if not rewards.Visible then
                hasSentWebhook = false
                lastMissionState = ""
                return
            end
            if not webhookEnabled then return end
            if hasSentWebhook then return end
            if webhookURL == "" then return end
            task.wait(2.5)
            if webhookMode == "Reward Webhook" then
                sendRewardWebhook()
                hasSentWebhook = true
            else
                local missionState = getMissionState()
                if missionState == lastMissionState and missionState ~= "" then return end
                lastMissionState = missionState
                sendMissionEndWebhook(missionState)
                hasSentWebhook = true
            end
        end)
    end)
    
    -- ===== UI Components =====
    WebhookGroup:AddInput("WebhookURL", {
        Default = "", Numeric = false, Finished = true,
        Text = "Discord Webhook URL",
        Placeholder = "https://discord.com/api/webhooks/...",
        Callback = function(v) webhookURL = v end
    })
    
    WebhookGroup:AddDivider()
    
    WebhookGroup:AddDropdown("WebhookMode", {
        Text = "Webhook Type",
        Values = {"All Data", "Reward Webhook"},
        Default = "All Data",
        Multi = false,
        Callback = function(v) webhookMode = v end
    })
    
    WebhookGroup:AddDropdown("WebhookPingMode", {
        Text = "Ping Mode (For Special Drops)",
        Values = {"None", "@here", "@everyone"},
        Default = "None",
        Multi = false,
        Callback = function(v)
            webhookPingMode = v
        end
    })
    
    WebhookGroup:AddDivider()
    
    local filterDropdown = WebhookGroup:AddDropdown("WebhookFilters", {
        Values = {"Currency", "Progression", "Loadout", "Inventory", "Cosmetics"},
        Default = {"Currency", "Progression", "Loadout", "Inventory", "Cosmetics"},
        Multi = true,
        Text = "Report Only for All Data ",
        Callback = function(v)
            filters.Currency = v["Currency"] or false
            filters.Progression = v["Progression"] or false
            filters.Loadout = v["Loadout"] or false
            filters.Inventory = v["Inventory"] or false
            filters.Cosmetics = v["Cosmetics"] or false
        end
    })
    
    WebhookGroup:AddDivider()
    
    WebhookGroup:AddToggle("WebhookToggle", {
        Text = "Enable Auto Webhook",
        Default = false,
        Callback = function(v)
            webhookEnabled = v
            if not v then 
                hasSentWebhook = false
                lastMissionState = ""
            end
        end
    })
    
    WebhookGroup:AddButton("Test Send", function()
        if webhookURL == "" then return end
        local testBody = game:GetService("HttpService"):JSONEncode({
            content = "Test from TownShip!",
            embeds = {{
                title = "Webhook Working!",
                color = 65280,
                fields = {
                    {name = "Mode", value = webhookMode, inline = true},
                    {name = "Ping Mode", value = webhookPingMode, inline = true},
                    {name = "Test Time", value = os.date("%Y-%m-%d %H:%M:%S"), inline = true}
                },
                footer = {text = "TownShip Webhook Test"}
            }}
        })
        pcall(function()
            request({Url = webhookURL, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = testBody})
            Library:Notify("Test webhook sent!", 2)
        end)
    end)
end
if IsIngameLobby() and Tabs.Webhook then
    local descGroup = Tabs.Webhook:AddRightGroupbox("Set Description")

        local function formatNumber(n)
        if type(n) ~= "number" then return "0" end
        return tostring(n):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
    end

        local function getThaiTime()
        local utcHour = tonumber(os.date("!%H"))
        local utcMin  = tonumber(os.date("!%M"))
        local thaiHour = (utcHour + 7) % 24
        return string.format("%02d:%02d", thaiHour, utcMin)
    end

        local statsFields = {
        "Level", "Prestige", "Slot", "Gold", "Gems", "Shards", "Spins", "Time"
    }
    local selectedStats = {
        ["Level"] = true,
        ["Prestige"] = true,
        ["Slot"] = true,
        ["Gold"] = true,
        ["Gems"] = true,
        ["Shards"] = true,
        ["Spins"] = true,
        ["Time"] = true,
    }

        local itemsFields = {
        "Memory Scroll", "Emperor's Key", "Female Serum", "Attack Serum", "Armored Serum"
    }
    local selectedItems = {
        ["Memory Scroll"] = true,
        ["Emperor's Key"] = true,
        ["Female Serum"] = true,
        ["Attack Serum"] = true,
        ["Armored Serum"] = true,
    }

        local cosmeticsFields = {
        "Angel's Halo", "Kitsune Ribbon", "Radiant Headband", "Blood Vial", "Kitsune Mask"
    }
    local selectedCosmetics = {
        ["Angel's Halo"] = true,
        ["Kitsune Ribbon"] = true,
        ["Radiant Headband"] = true,
        ["Blood Vial"] = true,
        ["Kitsune Mask"] = true,
    }

    descGroup:AddDropdown("DescTypeDropdown", {
        Text = "Description Type",
        Values = {"Horst"},
        Default = "Horst",
        Multi = false,
        Callback = function() end
    })

    descGroup:AddDivider()

    descGroup:AddDropdown("DescStatsDropdown", {
        Text = "Stats to include",
        Values = statsFields,
        Default = selectedStats,
        Multi = true,
        Callback = function(v) selectedStats = v end
    })

    descGroup:AddDivider()

    descGroup:AddDropdown("DescItemsDropdown", {
        Text = "Items to include",
        Values = itemsFields,
        Default = selectedItems,
        Multi = true,
        Callback = function(v) selectedItems = v end
    })

    descGroup:AddDivider()

    descGroup:AddDropdown("DescCosmeticsDropdown", {
        Text = "Cosmetics to include",
        Values = cosmeticsFields,
        Default = selectedCosmetics,
        Multi = true,
        Callback = function(v) selectedCosmetics = v end
    })

    descGroup:AddDivider()

    descGroup:AddToggle("SetDescToggle", {
        Text = "Apply Description (once, after 1s)",
        Default = false,
        Callback = function(v)
            if not v then return end

            task.spawn(function()
                task.wait(1)

                local success, data = pcall(function()
                    return GET:InvokeServer("Data", "Copy")
                end)

                if success and data and data.Slots then
                    local currentSlot = data.Current_Slot or "A"
                    local slotData = data.Slots[currentSlot]

                    if slotData then
                                                local valueMap = {}
                        
                        valueMap.Level = (slotData.Progression and slotData.Progression.Level) or 0
                        valueMap.Prestige = (slotData.Progression and slotData.Progression.Prestige) or 0
                        valueMap.Slot = currentSlot
                        valueMap.Gold = (slotData.Currency and slotData.Currency.Gold) or 0
                        valueMap.Gems = (slotData.Currency and slotData.Currency.Gems) or 0
                        valueMap.Shards = (slotData.Currency and slotData.Currency.Shards) or 0
                        valueMap.Spins = data.Spins or 0
                        valueMap.Time = getThaiTime()

                        local items = (slotData.Inventory and slotData.Inventory.Items) or {}
                        for _, field in ipairs(itemsFields) do
                            valueMap[field] = items[field] or 0
                        end

                        local cosmetics = (slotData.Inventory and slotData.Inventory.Cosmetics) or {}
                        for _, field in ipairs(cosmeticsFields) do
                            valueMap[field] = cosmetics[field] or 0
                        end

                                                local parts = {}

                                                for _, field in ipairs(statsFields) do
                            if selectedStats[field] and valueMap[field] ~= nil then
                                local val = valueMap[field]
                                if field ~= "Slot" and field ~= "Time" then
                                    val = formatNumber(val)
                                end
                                table.insert(parts, string.format("%s: %s", field, val))
                            end
                        end

                        for _, field in ipairs(itemsFields) do
                            if selectedItems[field] and valueMap[field] ~= nil and valueMap[field] > 0 then
                                local val = valueMap[field]
                                val = formatNumber(val)
                                table.insert(parts, string.format("%s: %s", field, val))
                            end
                        end

                        for _, field in ipairs(cosmeticsFields) do
                            if selectedCosmetics[field] and valueMap[field] ~= nil and valueMap[field] > 0 then
                                local val = valueMap[field]
                                val = formatNumber(val)
                                table.insert(parts, string.format("%s: %s", field, val))
                            end
                        end

                                                -- Shadow Ban Status (Lobby/Main Menu only)
                                                local function IsInMission()
                                                    local player = game:GetService("Players").LocalPlayer

                                                    if player:GetAttribute("InMission") == true then
                                                        return true
                                                    end

                                                    if player:GetAttribute("Mission") == true then
                                                        return true
                                                    end

                                                    return false
                                                end

                                                local function GetShadowBanStatus()
                                                    local player = game:GetService("Players").LocalPlayer

                                                    if player:GetAttribute("Blacklisted") == true then
                                                        return "SHADOW BANNED"
                                                    end

                                                    if player:GetAttribute("Exploiter") == true then
                                                        return "SHADOW BANNED"
                                                    end

                                                    return "SAFE"
                                                end

                                                if not IsInMission() then
                                                    table.insert(
                                                        parts,
                                                        "Shadow Ban: " .. GetShadowBanStatus()
                                                    )
                                                end

                                                local description = table.concat(parts, "  ")

                        if _G and _G.Horst_SetDescription then
                            _G.Horst_SetDescription(description)
                        end
                    end
                end

                pcall(function()
                    if Options and Options.SetDescToggle then
                        Options.SetDescToggle:SetValue(false)
                    end
                end)
            end)
        end
    })
end

if Tabs.AutoFarm then
    local MiscGroup = Tabs.AutoFarm:AddRightGroupbox("Skip Cutscene")

    local skipEnabled = false
    local skipRunning = false

    local Players = game:GetService("Players")
    local GuiService = game:GetService("GuiService")
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local lp = Players.LocalPlayer

    local CLICK_DELAY = 0.5

    local function clickSkipButton()
        local playerGui = lp:FindFirstChild("PlayerGui")
        if not playerGui then return false end

        local interface = playerGui:FindFirstChild("Interface")
        if not interface then return false end

        local skipFrame = interface:FindFirstChild("Skip")
        if not skipFrame or not skipFrame.Visible then return false end

        local interactBtn = skipFrame:FindFirstChild("Interact")
        if not interactBtn or not interactBtn.Visible then return false end

        if GuiService.MenuIsOpen then
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Escape, false, game)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Escape, false, game)
            task.wait(0.05)
        end

        GuiService.SelectedObject = interactBtn
        task.wait(0.02)
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
        task.wait(0.02)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
        task.wait(0.02)
        GuiService.SelectedObject = nil

        return true
    end

    task.spawn(function()
        local detectedTime = 0
        local hasClicked = false

        while true do
            task.wait(0.1)

            if not skipEnabled then
                detectedTime = 0
                hasClicked = false
                continue
            end

            local interface = lp.PlayerGui:FindFirstChild("Interface")
            local skip = interface and interface:FindFirstChild("Skip")

            if skip and skip.Visible then
                local interactBtn = skip:FindFirstChild("Interact")
                if interactBtn and interactBtn.Visible then
                    if not hasClicked then
                        if detectedTime == 0 then
                            detectedTime = tick()
                        elseif tick() - detectedTime >= CLICK_DELAY then
                            clickSkipButton()
                            hasClicked = true
                            detectedTime = 0
                        end
                    end
                else
                    detectedTime = 0
                    hasClicked = false
                end
            else
                detectedTime = 0
                hasClicked = false
            end
        end
    end)

    MiscGroup:AddToggle("SkipCutSceneToggle", {
        Text = "Skip Cut Scene",
        Default = false,
        Callback = function(v)
            skipEnabled = v
            if not v then
                skipRunning = false
            end
        end
    })

    MiscGroup:AddToggle("SkipForceToggle", {
        Text = "Skip Fixed",
        Default = false,
        Callback = function(v)
            if v then
                task.spawn(function()
                    local ReplicatedStorage = game:GetService("ReplicatedStorage")
                    local GET = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("GET")
                    local POST = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("POST")

                    pcall(function()
                        GET:InvokeServer("Functions", "Loaded", "Add")
                    end)

                    local function GetNil(Name, DebugId)
                        for _, Object in getnilinstances() do
                            if Object.Name == Name and Object:GetDebugId() == DebugId then
                                return Object
                            end
                        end
                    end

                    local startObj = GetNil("Start", "1_39502")
                    if startObj then
                        pcall(function()
                            POST:FireServer("Functions", "Finished", startObj)
                        end)
                    end

                    if Options and Options.SkipForceToggle then
                        Options.SkipForceToggle:SetValue(false)
                    end
                end)
            end
        end
    })
end



if Tabs.AutoFarm then
    local SpearGroup = Tabs.AutoFarm:AddRightGroupbox("Auto Spear Quest")
    
    local spearQuestEnabled = false
    local spearQuestRunning = false
    
        local GET = game:GetService("ReplicatedStorage"):WaitForChild("Assets"):WaitForChild("Remotes"):WaitForChild("GET")
    
        local function callSpearQuestUpdate()
        for i = 1, 6 do
            if not spearQuestEnabled then break end
            local args = {"Quests", "Update_Spear_Towers", true}
            pcall(function()
                GET:InvokeServer(unpack(args))
            end)
            task.wait(0.2)
        end
    end
    
    SpearGroup:AddToggle("AutoSpearQuestToggle", {
        Text="Auto Spear Quest",
        Default=false,
        Callback=function(v)
            spearQuestEnabled = v
            if v and not spearQuestRunning then
                spearQuestRunning = true
                task.spawn(function()
                                        callSpearQuestUpdate()
                    
                                        repeat task.wait() until game.Players.LocalPlayer.Character
                    local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
                    
                    local Unclimbable = workspace:FindFirstChild("Unclimbable")
                    if Unclimbable then
                        local baseCircle = Unclimbable:FindFirstChild("Supplies_Circle")
                        local baseHitbox = baseCircle and baseCircle:FindFirstChild("Hitbox")
                        
                        for lap = 1, 3 do
                            if not spearQuestEnabled then break end
                            
                            local supplies = {}
                            for _, obj in ipairs(Unclimbable:GetChildren()) do
                                if obj.Name:find("ThunderSpear_Supplies") then
                                    table.insert(supplies, obj)
                                end
                            end
                            
                            for _, supply in ipairs(supplies) do
                                if not spearQuestEnabled then break end
                                
                                local hitbox = supply:FindFirstChild("Hitbox")
                                if hitbox and hitbox.Parent then
                                    hrp.CFrame = hitbox.CFrame
                                    hrp.Velocity = Vector3.zero
                                    hrp.RotVelocity = Vector3.zero
                                    task.wait(0.5)
                                end
                                
                                if baseHitbox and baseHitbox.Parent then
                                    hrp.CFrame = baseHitbox.CFrame
                                    hrp.Velocity = Vector3.zero
                                    hrp.RotVelocity = Vector3.zero
                                    task.wait(0.5)
                                end
                            end
                        end
                    end
                    
                    spearQuestRunning = false
                    if spearQuestEnabled then
                        spearQuestEnabled = false
                        pcall(function()
                            SpearGroup:GetToggle("AutoSpearQuestToggle"):SetValue(false)
                        end)
                    end
                end)
            else
                spearQuestRunning = false
            end
        end
    })
end


-- ============================================================

-- ============================================================
-- EXACT STANDALONE 9-TITAN REMOTE - INSTANT / NO WAIT GATES
--
-- No mission-start wait.
-- No blade/reload wait.
-- No IsReloading / IsRefilling checks.
-- No movement/farm/objective checks.
--
-- Starts sending as soon as valid Titan napes exist and keeps
-- sending from start to finish.
-- ============================================================

local ReplicatedStorage_Standalone9 = game:GetService("ReplicatedStorage")

local POST_Standalone9 = ReplicatedStorage_Standalone9
    :WaitForChild("Assets")
    :WaitForChild("Remotes")
    :WaitForChild("POST")

local RUNNING_STANDALONE9 = true
local INTERVAL_STANDALONE9 = 0.25
local MAX_TARGETS_STANDALONE9 = 9

local function getStandalone9TargetsExact()
    local Titans = workspace:FindFirstChild("Titans")

    if not Titans then
        return {}
    end

    local targets = {}

    for _, titan in ipairs(Titans:GetChildren()) do
        if titan:IsA("Model") then
            local humanoid = titan:FindFirstChildWhichIsA("Humanoid")

            if humanoid and humanoid.Health > 0 then
                local hitboxes = titan:FindFirstChild("Hitboxes")
                local hit = hitboxes and hitboxes:FindFirstChild("Hit")
                local nape = hit and hit:FindFirstChild("Nape")

                if nape and nape:IsA("BasePart") and nape.Parent then
                    targets[#targets + 1] = nape

                    if #targets >= MAX_TARGETS_STANDALONE9 then
                        break
                    end
                end
            end
        end
    end

    return targets
end

local function isMissionCompleteStandalone9()
    -- Use the SAME Rewards visibility check as the main farm.
    -- Do not treat ScreenGui.Enabled by itself as mission completion,
    -- because that can be true while a mission is still running.
    local ok, visible = pcall(IsRewardsUIVisible)

    if ok then
        return visible == true
    end

    return false
end

local function hitStandalone9Exact()
    -- Only stop once the mission is complete / rewards screen is shown.
    -- No startup waits, reload waits, or blade waits are added.
    if isMissionCompleteStandalone9() then
        return
    end

    local targets = getStandalone9TargetsExact()

    if #targets == 0 then
        return
    end

    POST_Standalone9:FireServer(
        "Attacks",
        "Slash",
        true
    )

    for i = 1, #targets do
        if isMissionCompleteStandalone9() then
            return
        end

        local nape = targets[i]

        if nape and nape.Parent then
            POST_Standalone9:FireServer(
                "Hitboxes",
                "Register",
                nape,
                99999,
                0
            )
        end
    end
end

while RUNNING_STANDALONE9 do
    -- Keep the original working Titan-kill remote exactly as-is,
    -- but only allow it to send while Auto Farm Blade is enabled.
    if getgenv().AutoFarmBlade and not isMissionCompleteStandalone9() then
        hitStandalone9Exact()
    end

    -- When Auto Farm Blade is OFF, or Rewards is visible,
    -- no Titan kill remote is sent.
    task.wait(INTERVAL_STANDALONE9)
end


task.spawn(function()
    task.wait(1)
end)