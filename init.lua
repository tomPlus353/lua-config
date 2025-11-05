hs.application.enableSpotlightForNameSearches(true)

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")



local function isInArray (targetArray, val)
    for _, value in ipairs(targetArray) do
        if value == val then
            return true
        end
    end

    return false
end

local function bindBrowserMenuShortcut(modifiers, modifierKey, subMenuName, menuItemName)
    -- set default arguments
    modifiers = modifiers or {"cmd", "alt"}
    subMenuName = subMenuName or "Tab"
    
    -- adjust modifier to uppercase first letter if needed
    modifierKey = string.upper(modifierKey)

     -- Map the hotkey to the browser menu item (with debug logs)
    hs.hotkey.bind(modifiers, modifierKey, function()
        local app = hs.application.frontmostApplication()
        if not app then
            hs.alert("No frontmost app")
            hs.console.printStyledtext("No frontmost application found\n")
            return
        end -- end of if not app
    
    local appName = app:name()
    hs.console.printStyledtext("Hotkey pressed. Frontmost app: " .. appName .. "\n")
    local targetAppArray = {"Google Chrome", "Microsoft Edge", "Brave Browser", "Vivaldi", "Opera"}
    if isInArray(targetAppArray, appName) then
        local browser = hs.application.get(appName)
        if browser then
            local ok = browser:selectMenuItem({subMenuName, menuItemName})
            if ok then
                hs.alert("Successfully triggered:  '".. menuItemName .. "'\n")
                hs.console.printStyledtext("Successfully triggered menu item\n")
            else
                hs.alert("Menu item not found")
                hs.console.printStyledtext("Failed to find menu item: {" .. subMenuName .. " -> " .. menuItemName .. "}\n")
            end
        else
            hs.console.printStyledtext("Failed to get browser application object\n")
        end
    else
        -- Fallback: send normal keys
        hs.console.printStyledtext("Passing through modifiers: " .. modifiers .. "and hotkey: " .. modifierKey .. " to " .. appName .. "\n")
        hs.eventtap.keyStroke(modifiers, modifierKey)
    end

    end) -- end of hotkey.bind
end -- end of bindBrowserMenuShortcut function

-- Bind specific browser menu shortcuts
bindBrowserMenuShortcut({"cmd", "alt"}, "W", "Tab", "Close Tabs to the Right")
bindBrowserMenuShortcut({"cmd"}, "T", "Tab", "New Tab to the Right")
bindBrowserMenuShortcut({"cmd", "alt"}, "D", "Tab", "Duplicate Tab")
bindBrowserMenuShortcut({"cmd", "alt"}, "O", "Tab", "Close Other Tabs")