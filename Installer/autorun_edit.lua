local tArgs = { ... }

local function printUsage()
    print("Usages:")
    print("autorun_edit enable <program/link>")
    print("autorun_edit disable <program/link>")
    print("autorun_edit add <path>")
    print("autorun_edit add_link <path>")
    print("autorun_edit remove <program/link>")
end

local sCommand = tArgs[1]
if sCommand == "enable" then
    if fs.exists("/etc/autorun/disabled/"..tArgs[2]) then
        fs.move("/etc/autorun/disabled/"..tArgs[2], "/etc/autorun/autorun/"..tArgs[2])
    else
        error("No such entry: "..tArgs[2])       
    end

elseif sCommand == "disable" then
    if fs.exists("/etc/autorun/autorun/"..tArgs[2]) then
        fs.move("/etc/autorun/autorun/"..tArgs[2], "/etc/autorun/disabled/"..tArgs[2])
    else
        error("No such entry: "..tArgs[2])
    end

elseif sCommand == "add" then
    if fs.exists(tArgs[2]) and fs.isDir(tArgs[2]) == false then
        fs.copy(tArgs[2], "/etc/autorun/disabled/"..fs.getName(tArgs[2]))
    else
        error("No such file: "..tArgs[2])
    end

elseif sCommand == "add_link" then
    if fs.exists(tArgs[2]) and fs.isDir(tArgs[2]) == false then
        local newEntryName = "/etc/autorun/disabled/"..fs.getName(tArgs[2])..".pl"
        if not fs.exists(newEntryName) then
            local newEntry = fs.open(newEntryName, "w")
            newEntry.write(tArgs[2])
            newEntry.close()
        else
            error("Entry already exists")
        end
    else
        error("No such file: "..tArgs[2])
    end

elseif sCommand == "remove" then
    local entry = "/etc/autorun/disabled/"..tArgs[2]
    if fs.exists(entry) then
        fs.delete(entry)
    elseif fs.exists(entry..".pl") then
        fs.delete(entry..".pl")
    end
else
    printUsage()
end