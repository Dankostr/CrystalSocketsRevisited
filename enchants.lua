--     Crystal Sockets Revisited - A convenient way to display all your gem sockets and enchants.
--     Copyright (C) 2024  Dankostr
-- 
--     This program is free software: you can redistribute it and/or modify
--     it under the terms of the GNU General Public License as published by
--     the Free Software Foundation, either version 3 of the License, or
--     (at your option) any later version.
-- 
--     This program is distributed in the hope that it will be useful,
--     but WITHOUT ANY WARRANTY; without even the implied warranty of
--     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--     GNU General Public License for more details.
-- 
--     You should have received a copy of the GNU General Public License
--     along with this program.  If not, see <https://www.gnu.org/licenses/>.

local Crystal = CrystalSocketsAddon;
local enchants = Crystal.enchants;


local enchantInfo = {
    -- LEGS
    [7934] = { ["spellId"] = 1229437,  ["itemId"]=240094}, -- Sunfire Silk Spellthread q1
    [7935] = {["spellId"] = 1229442, ["itemId"]=240133}, -- Sunfire Silk Spellthread q2

    [7936] = {["spellId"] = 1229453,  ["itemId"]=240154},-- Arcanoweave Spellthread q1
    [7937] = {["spellId"] = 1229454,  ["itemId"]=240155}, -- Arcanoweave Spellthread q2

    [7938] = {["spellId"]= 1229456, ["itemId"]=240156}, -- Bright Linen Spellthread q1
    [7939] = {["spellId"]= 1229457, ["itemId"]=240157}, -- Bright Linen Spellthread q2

    [8158] = {["spellId"]= 1243975, ["itemId"]=244640}, -- Forest Hunter's Armor Kit q1
    [8159] = {["spellId"]= 1243976, ["itemId"]=244641}, -- Forest Hunter's Armor Kit q2

    [8160] = {["spellId"]= 1243977, ["itemId"]= 244644}, -- Thalassian Scout Armor Kit q1
    [8161] = {["spellId"]= 1243978, ["itemId"]=244645}, -- Thalassian Scout Armor Kit q2

    [8162] = {["spellId"]= 1243979 , ["itemId"]=244642}, -- Blood Knight's Armor Kit q1
    [8163] = {["spellId"]= 1243980, ["itemId"]=244643}, -- Blood Knight's Armor Kit q2

    -- CHEST
    [7956] = {["spellId"]= 1236054, ["itemId"]= 243946}, -- Mark of Nalorakk q1
    [7957] = {["spellId"]= 1236054, ["itemId"]= 243947}, -- Mark of Nalorakk q2

    [7984] = {["spellId"]= 1236068, ["itemId"]=243974}, -- Mark of the Rootwarden q1
    [7985] = {["spellId"]= 1236068, ["itemId"]=243975}, -- Mark of the Rootwarden q2

    [7986] = {["spellId"]= 1236069, ["itemId"]=243976}, -- Mark of the Worldsoul q1
    [7987] = {["spellId"]= 1236069, ["itemId"]=243977}, -- Mark of the Worldsoul q2

    [8012]  = {["spellId"]= 1236082, ["itemId"]=244002}, -- Mark of the Magister q1
    [8013] = {["spellId"]= 1236082, ["itemId"]=244003}, -- Mark of the Magister q2

    --  HELM
    [7958] = {["spellId"]= 1236055, ["itemId"]=243948}, --  Hex of Leeching q1
    [7959] = {["spellId"]= 1236055, ["itemId"]=243949}, --  Hex of Leeching q2

    [7960] = {["spellId"]= 1236056, ["itemId"]=243950}, --  Empowered Hex of Leeching q1
    [7961] = {["spellId"]= 1236056, ["itemId"]=243951}, --  Empowered Hex of Leeching q2

    [7988] = {["spellId"]= 1236070, ["itemId"]=243978}, --  Blessing of Speed q1
    [7989] = {["spellId"]= 1236070, ["itemId"]=243979}, --  Blessing of Speed q2

    [7990] = {["spellId"]= 1236071, ["itemId"]=243980}, --  Empowered Blessing of Speed q1
    [7991] = {["spellId"]= 1236071, ["itemId"]=243981}, --  Empowered Blessing of Speed q2

    [8014] = {["spellId"]= 1236083, ["itemId"]=244004}, --  Rune of Avoidance q1
    [8015] = {["spellId"]= 1236083, ["itemId"]=244005}, --  Rune of Avoidance q2

    [8016] = {["spellId"]= 1236084, ["itemId"]=244006}, --  Empowered Rune of Avoidance q1
    [8017] = {["spellId"]= 1236084, ["itemId"]=244007}, --  Empowered Rune of Avoidance q2

    --  BOOTS
    [7962] = {["spellId"]= 1236057, ["itemId"]=243952}, -- Lynx's Dexterity q1
    [7963] = {["spellId"]= 1236057, ["itemId"]=243953}, -- Lynx's Dexterity q2

    [7992] = {["spellId"]= 1236072, ["itemId"]=243982}, -- Shaladrassil's Roots q1
    [7993] = {["spellId"]= 1236072, ["itemId"]=243983}, -- Shaladrassil's Roots q2

    [8018] = {["spellId"]= 1236085, ["itemId"]=244008}, -- Farstrider's Hunt q1
    [8019] = {["spellId"]= 1236085, ["itemId"]=244009}, -- Farstrider's Hunt q2

    --RING
    [7964] = {["spellId"]= 1236058, ["itemId"]=243954}, --  Amani Mastery q1
    [7965] = {["spellId"]= 1236058, ["itemId"]=243955}, --  Amani Mastery q2

    [7966] = {["spellId"]= 1236059, ["itemId"]=243956}, --  Eyes of the Eagle q1
    [7967] = {["spellId"]= 1236059, ["itemId"]=243957}, --  Eyes of the Eagle q2

    [7968] = {["spellId"]= 1236060, ["itemId"]=243958}, --  Zul'jin's Mastery q1
    [7969] = {["spellId"]= 1236060, ["itemId"]=243959}, --  Zul'jin's Mastery q2

    [7994] = {["spellId"]= 1236073, ["itemId"]=243984}, --  Nature's Wrath q1
    [7995] = {["spellId"]= 1236073, ["itemId"]=243985}, --  Nature's Wrath q2

    [7996] = {["spellId"]= 1236074, ["itemId"]=243986}, --  Nature's Fury q1
    [7997] = {["spellId"]= 1236074, ["itemId"]=243987}, --  Nature's Fury q2

    [8020] = {["spellId"]= 1236086, ["itemId"]=244010}, --  Thalassian Haste q1
    [8021] = {["spellId"]= 1236086, ["itemId"]=244011}, --  Thalassian Haste q2

    [8022] = {["spellId"]= 1236087, ["itemId"]=244012}, --  Thalassian Versatility q1
    [8023] = {["spellId"]= 1236087, ["itemId"]=244013}, --  Thalassian Versatility q2

    [8024] = {["spellId"]= 1236088, ["itemId"]=244015}, --  Silvermoon's Alacrity q1
    [8025] = {["spellId"]= 1236088, ["itemId"]=244014}, --  Silvermoon's Alacrity q2

    [8026] = {["spellId"]= 1236089, ["itemId"]=244016}, --  Silvermoon's Tenacity q1
    [8027] = {["spellId"]= 1236089, ["itemId"]=244017}, --  Silvermoon's Tenacity q2

    -- SHOULDER
    [7970] = {["spellId"]= 1236061, ["itemId"]=243960}, --  Flight of the Eagle q1
    [7971] = {["spellId"]= 1236061, ["itemId"]=243961}, --  Flight of the Eagle q2

    [7972] = {["spellId"]= 1236062, ["itemId"]=243962}, --  Akil'zon's Swiftness q1
    [7973] = {["spellId"]= 1236062, ["itemId"]=243963}, --  Akil'zon's Swiftness q2

    [7998] = {["spellId"]= 1236075, ["itemId"]=243988}, --  Nature's Grace q1
    [7999] = {["spellId"]= 1236075, ["itemId"]=243989}, --  Nature's Grace q2

    [8000] = {["spellId"]= 1236076, ["itemId"]=243990}, --  Amirdrassil's Grace q1
    [8001] = {["spellId"]= 1236076, ["itemId"]=243991}, --  Amirdrassil's Grace q2

    [8028] = {["spellId"]= 1236090, ["itemId"]=244018}, --  Thalassian Recovery q1
    [8029] = {["spellId"]= 1236090, ["itemId"]=244019}, --  Thalassian Recovery q2

    [8030] = {["spellId"]= 1236091, ["itemId"]=244021}, --  Silvermoon's Mending q1
    [8031] = {["spellId"]= 1236091, ["itemId"]=244020}, --  Silvermoon's Mending q2

    -- WEAPON ENCHANTS
    [7978] = {["spellId"]= 1236065, ["itemId"]=243968}, -- Enchant Weapon - Strength of Halazzi q1
    [7979] = {["spellId"]= 1236065, ["itemId"]=243969}, -- Enchant Weapon - Strength of Halazzi q2

    [7980] = {["spellId"]= 1236066, ["itemId"]=243970}, -- Enchant Weapon - Jan'alai's Precision q1
    [7981] = {["spellId"]= 1236066, ["itemId"]=243971}, -- Enchant Weapon - Jan'alai's Precision q2

    [7982] = {["spellId"]= 1236067, ["itemId"]=243972}, -- Enchant Weapon - Berserker's Rage q1
    [7983] = {["spellId"]= 1236067, ["itemId"]=243973}, -- Enchant Weapon - Berserker's Rage q2

    [8006] = {["spellId"]= 1236079, ["itemId"]=243996}, -- Enchant Weapon - Worldsoul Cradle q1
    [8007] = {["spellId"]= 1236079, ["itemId"]=243997}, -- Enchant Weapon - Worldsoul Cradle q2

    [8008] = {["spellId"]= 1236080, ["itemId"]=243998}, -- Enchant Weapon - Worldsoul Aegis q1
    [8009] = {["spellId"]= 1236080, ["itemId"]=243999}, -- Enchant Weapon - Worldsoul Aegis q2

    [8010] = {["spellId"]= 1236081, ["itemId"]=244000}, -- Enchant Weapon - Worldsoul Tenacity q1
    [8011] = {["spellId"]= 1236081, ["itemId"]=244001}, -- Enchant Weapon - Worldsoul Tenacity q2

    [8036] = {["spellId"]= 1236094, ["itemId"]=244026}, -- Enchant Weapon - Flames of the Sin'dorei q1
    [8037] = {["spellId"]= 1236094, ["itemId"]=244027}, -- Enchant Weapon - Flames of the Sin'dorei q2

    [8038] = {["spellId"]= 1236095, ["itemId"]=244028}, -- Enchant Weapon - Acuity of the Ren'dorei q1
    [8039] = {["spellId"]= 1236095, ["itemId"]=244029}, -- Enchant Weapon - Acuity of the Ren'dorei q2

    [8040] = {["spellId"]= 1236097, ["itemId"]=244030}, -- Enchant Weapon - Arcane Mastery q1
    [8041] = {["spellId"]= 1236097, ["itemId"]=244031}, -- Enchant Weapon - Arcane Mastery q2
}


function enchants:getEnchantId(slotID)
    local itemLink = GetInventoryItemLink("player",slotID)
    local itemString = (string.match(itemLink, "item[%-?%d:]+"))
    local enchantId = select(3, strsplit(":", itemString));
    return tonumber(enchantId)
end

function enchants:updateEnchant(slotID)
    local enchantId = enchants:getEnchantId(slotID);
    if Crystal.slots.info[slotID].enchantment then
        enchants:showEnchantIcon(enchantId, slotId, Crystal.slots.info[slotID].enchantFrame);
    end

end

function enchants:showEnchantIcon(enchantId, slotId, enchantFrame)
    if enchantInfo[enchantId] == nil then
        enchants:setIcon(slotId, 3565717, nil, enchantFrame);
        return;
    end
    if enchantId ~= nil then
        local _,enchantLink,_ = GetItemInfo(enchantInfo[enchantId].itemId)
        local enchantIcon = GetItemIcon(enchantInfo[enchantId].itemId)
        enchants:setIcon(slotId, enchantIcon, enchantLink, enchantFrame);
        return;
    end
    if enchantId == nil then
        enchants:setIcon(slotId, 3565717, nil, enchantFrame);
        return;
    end
    --sockets:setIcon(slotID, nil, nil, enchantFrame);
    --socketFrame.texture:SetTexture(iconID);
    --sockets.setTooltip(slotID, gemLink, enchantFrame);
end


function enchants.setTooltip(slotID, enchantLink, socketFrame)
    socketFrame.link = enchantLink;
    socketFrame:SetScript("OnEnter", enchants.showGameTooltip);
    socketFrame:SetScript("OnLeave", enchants.hideGameTooltip);
end


function enchants:setIcon(slotID, iconID, enchantLink, socketFrame)
    socketFrame.texture:SetTexture(iconID);
    enchants.setTooltip(slotID, enchantLink, socketFrame);
end

function enchants.showGameTooltip(self, motion)
    if self.link then
        GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT");
        GameTooltip:SetHyperlink(self.link);
        GameTooltip:Show();
    end
end

function enchants.hideGameTooltip(self, motion)
    GameTooltip:Hide();
end


function enchants:init()

end
