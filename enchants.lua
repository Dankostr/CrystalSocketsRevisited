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

local enchantMissingColor = { 1.0, 0.0, 0.0 }
local enchantPresentColor = { 0.0, 1.0, 0.0 }

local prefixToSkip = 
{
    ["of"] = true,
    ["the"] = true,
    ["Lesser"] = true,
    ["Minor"] = true,
    ["Greater"] = true,
    ["Superior"] = true,
    ["Legion"] = true,
    ["Zandalari"] = true,
    ["Kul"] = true,
    ["Tiran"] = true,
    ["Shadowlands"] = true,
    ["Rune"] = true,
    ["Eternal"] = true,
};

local function formatLine(line)
    local subStr = { strsplit(" ", line) };
    local enchantStr = ""
    if subStr[1]:sub(1, 1) == "+" then
        enchantStr = strconcat(subStr[1], " ", subStr[2]);
    else
        for key, str in pairs(subStr) do
            if not prefixToSkip[str] then
                enchantStr = str;
                break;
            end
        end
    end
    return enchantStr;
end

function enchants:getEnchantLine(slotID)
    local ttData = C_TooltipInfo.GetInventoryItem("player", slotID);
    if not ttData then
        return "";
    end
    for _, line in ipairs(ttData.lines) do
        local enchant = strmatch(line.leftText, enchants.tooltipFilter);
        if enchant then
            return enchant;
        end
    end
    if Crystal.slots.info[slotID].enchantment then
        return "Enchantable"
    end
    return "";
end

function enchants:updateEnchant(slotID)
    local enchantStr = formatLine(enchants:getEnchantLine(slotID));
    Crystal.slots.info[slotID].enchantFrame.fontString:SetText(enchantStr);
    enchants:changeFontColor(slotID, enchantStr)
end

function enchants:changeFontColor(slotID, enchantStr)
    if enchantStr == "Enchantable" then
        Crystal.slots.info[slotID].enchantFrame.fontString:SetTextColor(unpack(enchantMissingColor));
    else
        Crystal.slots.info[slotID].enchantFrame.fontString:SetTextColor(unpack(enchantPresentColor));
    end

end


function enchants:init()
    enchants.tooltipFilter = ENCHANTED_TOOLTIP_LINE:gsub('%%s', '(.+)');
end
