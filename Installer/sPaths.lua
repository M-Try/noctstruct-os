dofile("etc/sPaths_config/sPaths.cfg")

for _,path in ipairs(extPaths) do
    shell.setPath(shell.path()..path)
end