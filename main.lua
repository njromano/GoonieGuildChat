local GOON_STRING = "G{skull}{skull}NS";
local GOON_DELAY = 60;

nextGoonTime = time();
local playerName = UnitName("player");
local goonFrame = CreateFrame("Frame");
goonFrame:RegisterEvent("CHAT_MSG_GUILD");
goonFrame:SetScript('OnEvent', function(self, event, msg, sender, ...)
    local match = string.gmatch(sender, "(*)-*");
    local nameOnly = "noname";
    for match in string.gmatch(sender, "(.+)-.") do
        nameOnly = match
    end
    if msg == GOON_STRING and time() > nextGoonTime then
        if (nameOnly ~= playerName) then
            SendChatMessage(GOON_STRING, "GUILD");
        end
        nextGoonTime = time() +  GOON_DELAY;
    end
end)