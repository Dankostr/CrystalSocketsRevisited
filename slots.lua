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
local slots = Crystal.slots;

slots.info = {
    [1] = { ["name"] = "Head",           ["side"] = "LEFT",          ["enchantment"] = false , ["secondGem"] = false},
    [2] = { ["name"] = "Neck",           ["side"] = "LEFT",          ["enchantment"] = false,  ["secondGem"] = true },
    [3] = { ["name"] = "Shoulder",       ["side"] = "LEFT",          ["enchantment"] = false,  ["secondGem"] = false },
    [4] = { ["name"] = "Shirt",          ["side"] = "LEFT",          ["enchantment"] = false,  ["secondGem"] = false },
    [5] = { ["name"] = "Chest",          ["side"] = "LEFT",          ["enchantment"] = true,   ["secondGem"] = false },
    [6] = { ["name"] = "Waist",          ["side"] = "RIGHT",         ["enchantment"] = false,  ["secondGem"] = false },
    [7] = { ["name"] = "Legs",           ["side"] = "RIGHT",         ["enchantment"] = true,   ["secondGem"] = false },
    [8] = { ["name"] = "Feet",           ["side"] = "RIGHT",         ["enchantment"] = true,   ["secondGem"] = false },
    [9] = { ["name"] = "Wrist",          ["side"] = "LEFT",          ["enchantment"] = true,   ["secondGem"] = false },
    [10] = { ["name"] = "Hands",         ["side"] = "RIGHT",         ["enchantment"] = false,  ["secondGem"] = false },
    [11] = { ["name"] = "Finger0",       ["side"] = "RIGHT",         ["enchantment"] = true,   ["secondGem"] = true },
    [12] = { ["name"] = "Finger1",       ["side"] = "RIGHT",         ["enchantment"] = true,   ["secondGem"] = true },
    [13] = { ["name"] = "Trinket0",      ["side"] = "RIGHT",         ["enchantment"] = false,  ["secondGem"] = false },
    [14] = { ["name"] = "Trinket1",      ["side"] = "RIGHT",         ["enchantment"] = false,  ["secondGem"] = false },
    [15] = { ["name"] = "Back",          ["side"] = "LEFT",          ["enchantment"] = true,   ["secondGem"] = false },
    [16] = { ["name"] = "MainHand",      ["side"] = "RIGHT",         ["enchantment"] = true,   ["secondGem"] = false },
    [17] = { ["name"] = "SecondaryHand", ["side"] = "LEFT",          ["enchantment"] = true,   ["secondGem"] = false },
    [19] = { ["name"] = "Tabard",        ["side"] = "LEFT",          ["enchantment"] = false,  ["secondGem"] = false }
};

local function direction(side)
   local relativeMap = { ["LEFT"] = "RIGHT", ["RIGHT"] = "LEFT" };
   return relativeMap[side];
end

local function sign(side)
    local signMap = { ["LEFT"] = 1, ["RIGHT"] = -1 };
    return signMap[side];
end

local function createSocketFrame(slotID, name, parent, side, xOffset)
    local frame = CreateFrame("Frame", name .. "Frame", parent);
    frame:SetWidth(parent:GetWidth()*0.4);
    frame:SetHeight(parent:GetHeight()*0.4);
    frame:SetPoint("TOP" .. side, parent, "TOP" .. direction(side), 10 * sign(side) + parent:GetWidth()*0.4* xOffset, - parent:GetHeight() * 0.05);
    frame.texture = frame:CreateTexture(name .. "Texture");
    frame.texture:SetAllPoints();
    return frame;
end

local function createEnchantFrame(slotID, name, parent, side)
    local frame = CreateFrame("Frame", name .. "Frame", parent);
    frame:SetWidth(parent:GetWidth()*2);
    frame:SetHeight(parent:GetHeight()*0.4);
    frame:SetPoint("BOTTOM" .. side, parent, "BOTTOM" .. direction(side), 10 * sign(side), parent:GetHeight() * 0.05);
    frame.fontString = frame:CreateFontString(name .. "String");
    frame.fontString:SetFontObject("GameFontGreen");
    frame.fontString:SetJustifyV("MIDDLE");
    frame.fontString:SetJustifyH(side);
    frame.fontString:SetAllPoints();
    local font, height, flags = frame.fontString:GetFont();
    frame.fontString:SetFont(font, parent:GetHeight()*0.3, flags);

    frame.texture = frame:CreateTexture(name .. "Texture");
    frame.texture:SetAllPoints();
    frame.texture:SetWidth(parent:GetWidth()*0.4);
    frame.texture:SetHeight(parent:GetHeight()*0.4);
    return frame;
end


function slots:update(slotID)
    if not slots.info[slotID] then
        return;
    end

    Crystal.enchants:updateEnchant(slotID);
    if not C_Item.DoesItemExist(slots.info[slotID].location) then
        --Crystal.sockets:setIcon(slotID, nil, nil, slots.info.socketFrame);
        --Crystal.sockets:setIcon(slotID, nil, nil, slots.info.secondSocketFrame);
        return;
    end
    local item = Item:CreateFromItemLocation(slots.info[slotID].location);
    item:ContinueOnItemLoad(function() Crystal.sockets:updateSocket(item:GetItemLink(), slotID); end);
end

function slots:updateAll()
    for slotID, info in pairs(slots.info) do
        slots:update(slotID);
    end
end

function slots:init()
    for slotID, slotInfo in pairs(slots.info) do
       slotInfo.location = ItemLocation:CreateFromEquipmentSlot(slotID);
       local prefix = "Character" .. slotInfo.name;
       slotInfo.frame = _G[prefix .. "Slot"];
       slotInfo.socketFrame = createSocketFrame(slotID, prefix .. "Socket", slotInfo.frame, slotInfo.side,0);
       if slotInfo.secondGem then
            slotInfo.secondSocketFrame =  createSocketFrame(slotID, prefix .. "Socket", slotInfo.frame, slotInfo.side, 1);
       end
       slotInfo.enchantFrame = createEnchantFrame(slotID, prefix .. "Enchant", slotInfo.frame, slotInfo.side);
    end
end

