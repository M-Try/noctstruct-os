fs.makeDir("etc/netconfig")
fs.makeDir("etc/autorun/disabled")
fs.makeDir("etc/autorun/autorun")
fs.makeDir("cfg")

fs.copy(installer_mountpath.."/sPaths.lua", "etc/autorun/autorun/sPaths.lua")
fs.copy(installer_mountpath.."/sPaths_config", "etc/sPaths_config")
fs.copy(installer_mountpath.."/autorun_edit.lua", "etc/autorun/autorun_edit.lua")

if fs.exists("startup.lua") then
    fs.move("startup.lua", "old_startup.lua")
    print("Old startup script moved to old_startup.lua") -- TODO: Add a functionality to let the User choose the new location of the old startup file
end

fs.copy(installer_mountpath.."/new_startup.lua", "startup.lua")