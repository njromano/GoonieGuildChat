local GOON_STRING = "G{skull}{skull}NS";
local GOON_DELAY = 60; -- seconds

-- set initial goon time
nextGoonTime = time();

-- get player name and UI frame
local playerName = UnitName("player");
local goonFrame = CreateFrame("Frame");
goonFrame:RegisterEvent("CHAT_MSG_GUILD");

-- script
goonFrame:SetScript('OnEvent', function(self, event, msg, sender, ...)
    -- rip out server from 'name-server', leaving only 'name'
    local nameOnly = sender;
    for match in string.gmatch(sender, "(.+)-.") do
        nameOnly = match
    end

    -- check if we gooned in this message
    -- remove all spaces
    msg = string.gsub(msg, "%s", "");
    if string.find(msg, GOON_STRING) ~= nil and time() > nextGoonTime then
        if (nameOnly ~= playerName) then
            SendChatMessage(GOON_STRING, "GUILD");
        end
         nextGoonTime = time() +  GOON_DELAY;
    end
end)