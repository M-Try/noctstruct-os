-- TODO: make a way of checking if the OS is already installed on the latest version and update if its not
_G.installer_mountpath = fs.getDir(shell.getRunningProgram())

dofile(installer_mountpath.."/installerinfo")

print("Installer build: "..installer_build.. " | Nocstruct build: "..os_build)
print("Installing Noctstruct v"..os_version.."...")
print(build_experimental and "WARNING: Experimental Build" or "Stable build")
print("Don't turn off the System.")

shell.run(installer_mountpath.."/setup.lua")

_G.installer_mountpath = nil
print("Installer finished Setup. Eject the disk and restart for changes to take effect")