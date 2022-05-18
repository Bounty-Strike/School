-- // Bot

-- // Variables
local plrs = game:GetService("Players");
local plr = game:GetService("Players").LocalPlayer;
local commands = {};
local l = {};

-- // functions
l.Insert = function(command, code)
  if type(code) == "function" and type(command) == "string" then
    for _, v in next, Commands do
      if not v[1] == command then
        table.insert(Commands, {command, code})
        end
      end
    end
end
l.set = function(str, l_)
  if type(str) == "string" and type(l_) == "string" then
    if l_ == "lower" then
      return str:lower()
    elseif l_ == "upper" then
      return str:upper()
    end
  end
end

l.match = function(str1, str2)
  if str1 and str2 then
    if l.set(str1, "lower"):sub(1, #str2) == l.set(str2, "lower") then
      return true
    end
  end
  return false
end

l.GetPlayer = function(str)
  if type(str) == "string" then
    if str == "all" then
      return plrs:GetPlayers()
    elseif str == "me" then
      return {plr}
    else
      for _, v in next, plrs:GetPlayers() do
        if l.match(v.Name, str) or l.match(v.DisplayName, str) then
          return {v}
        end
      end
    end
  end
end

-- // Commands
Insert("goto", function(Args)
  for _, v in next, l.GetPlayer(Args[1]) do
      workspace.vh7z:SetPrimaryPartCFame(v.Character:GetModelCFrame())
      end
end)
