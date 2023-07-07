local status_ok, flash = pcall(require, "flash")
if not status_ok then
    return
end

flash.setup()
