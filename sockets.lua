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
local sockets = Crystal.sockets;

function sockets:isEmpty(itemLink)
    local stats = C_Item.GetItemStats(itemLink);
    if DLAPI then DLAPI.DebugLog("crystalSockets", stats) end
    if stats ~= nil then
        for key, val in pairs(stats) do
            if (string.find(key, "EMPTY_SOCKET_")) then
                return true;
            end
        end
    end
    return false;
end

function sockets.showGameTooltip(self, motion)
    if self.link then
        GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT");
        GameTooltip:SetHyperlink(self.link);
        GameTooltip:Show();
    end
end

function sockets.hideGameTooltip(self, motion)
    GameTooltip:Hide();
end

function sockets.setTooltip(slotID, gemLink, socketFrame)
    socketFrame.link = gemLink;
    socketFrame:SetScript("OnEnter", sockets.showGameTooltip);
    socketFrame:SetScript("OnLeave", sockets.hideGameTooltip);
end


function sockets:setIcon(slotID, iconID, gemLink, socketFrame)
    socketFrame.texture:SetTexture(iconID);
    sockets.setTooltip(slotID, gemLink, socketFrame);
end

function sockets:updateSocket(itemLink, slotID)
    local _, gemLink = GetItemGem(itemLink, 1);
    sockets:showSocketIcon(itemLink, gemLink, slotID, Crystal.slots.info[slotID].socketFrame)
    if Crystal.slots.info[slotID].secondGem then
        local _, secondGemLink = GetItemGem(itemLink, 2)
        sockets:showSocketIcon(itemLink, secondGemLink, slotID, Crystal.slots.info[slotID].secondSocketFrame)
    end
end

function sockets:showSocketIcon(itemLink, gemLink, slotID, socketFrame)
    if gemLink ~= nil then
        local gem = Item:CreateFromItemLink(gemLink);
        gem:ContinueOnItemLoad(function() sockets:setIcon(slotID, gem:GetItemIcon(), gemLink, socketFrame); end);
        return;
    end
    if sockets:isEmpty(itemLink) then
        sockets:setIcon(slotID, 458977, nil, socketFrame);
        return;
    end
    sockets:setIcon(slotID, nil, nil, socketFrame);
end

function sockets:init()
    -- NOPE
end
