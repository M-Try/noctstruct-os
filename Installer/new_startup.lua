-- TODO: make a way of checking if the computer is booting since a repeated run of the startup file might cause unwanted behaviour    
settings.load("os/.osinfo")
local version = settings.get("nstructos.version", " Error - check .osinfo file")

print("This computer is running Noctstruct v"..version)
print("Startup complete")

local help_path = "/help/"
help.setPath(help.path()..help_path)

local autorun_path = "/etc/autorun/autorun/"
	

for _,v in ipairs(fs.list(autorun_path)) do
    if not fs.isDir(autorun_path..v) then
        if string.sub(v, -3) == ".pl" then
            v_entry = fs.open(autorun_path..v, "r")
            shell.run(v_entry.readAll())
            v_entry.close()
        else
            shell.run(autorun_path..v)
        end
    end
end