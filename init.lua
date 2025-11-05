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


-- Map Cmd+Option+W to "Close Tabs to the Right" in browser (with debug logs)
hs.hotkey.bind({"cmd", "alt"}, "W", function()
    local app = hs.application.frontmostApplication()
    if not app then
        hs.alert("No frontmost app")
        hs.console.printStyledtext("No frontmost application found\n")
        return
    end

    local appName = app:name()
    hs.console.printStyledtext("Hotkey pressed. Frontmost app: " .. appName .. "\n")
    local targetAppArray = {"Google Chrome", "Microsoft Edge", "Brave Browser", "Vivaldi", "Opera"}
    if isInArray(targetAppArray, appName) then
        local browser = hs.application.get(appName)
        if browser then
            local ok = browser:selectMenuItem({"Tab", "Close Tabs to the Right"})
            if ok then
                hs.alert("Closed tabs to the right")
                hs.console.printStyledtext("Successfully triggered menu item\n")
            else
                hs.alert("Menu item not found")
                hs.console.printStyledtext("Failed to find menu item: {Tab -> Close Tabs to the Right}\n")
            end
        else
            hs.console.printStyledtext("Failed to get browser application object\n")
        end
    else
        -- Fallback: send normal Cmd+Option+W
        hs.console.printStyledtext("Passing through Cmd+Option+W to " .. appName .. "\n")
        hs.eventtap.keyStroke({"cmd", "alt"}, "W")
    end
end)

-- Map Cmd+T to "New Tab to the Right" in browser (with debug logs)
hs.hotkey.bind({"cmd"}, "T", function()
    local app = hs.application.frontmostApplication()
    if not app then
        hs.alert("No frontmost app")
        hs.console.printStyledtext("No frontmost application found\n")
        return
    end

    local appName = app:name()
    hs.console.printStyledtext("Hotkey pressed. Frontmost app: " .. appName .. "\n")
    local targetAppArray = {"Google Chrome", "Microsoft Edge", "Brave Browser", "Vivaldi", "Opera"}
    if isInArray(targetAppArray, appName) then
        local browser = hs.application.get(appName)
        if browser then
            local ok = browser:selectMenuItem({"Tab", "New Tab to the Right"})
            if ok then
                hs.alert("Opened new tab to the right")
                hs.console.printStyledtext("Successfully triggered menu item\n")
            else
                hs.alert("Menu item not found")
                hs.console.printStyledtext("Failed to find menu item: {Tab -> New Tab to the Right}\n")
            end
        else
            hs.console.printStyledtext("Failed to get browser application object\n")
        end
    else
        -- Fallback: send normal Cmd+Option+W
        hs.console.printStyledtext("Passing through Cmd+T to " .. appName .. "\n")
        hs.eventtap.keyStroke({"cmd"}, "T")
    end
end)

-- Map Cmd+alt+D to "Duplicate Tab" in browser (with debug logs)
hs.hotkey.bind({"cmd", "option"}, "D", function()
    local app = hs.application.frontmostApplication()
    if not app then
        hs.alert("No frontmost app")
        hs.console.printStyledtext("No frontmost application found\n")
        return
    end

    local appName = app:name()
    hs.console.printStyledtext("Hotkey pressed. Frontmost app: " .. appName .. "\n")
    local targetAppArray = {"Google Chrome", "Microsoft Edge", "Brave Browser", "Vivaldi", "Opera"}
    if isInArray(targetAppArray, appName) then
        local browser = hs.application.get(appName)
        if browser then
            local ok = browser:selectMenuItem({"Tab", "Duplicate Tab"})
            if ok then
                hs.alert("Duplicated Tab")
                hs.console.printStyledtext("Successfully triggered menu item\n")
            else
                hs.alert("Menu item not found")
                hs.console.printStyledtext("Failed to find menu item: {Tab -> Duplicate Tab}\n")
            end
        else
            hs.console.printStyledtext("Failed to get browser application object\n")
        end
    else
        -- Fallback: send normal Cmd+Option+W
        hs.console.printStyledtext("Passing through Cmd+Option+D to " .. appName .. "\n")
        hs.eventtap.keyStroke({"cmd", "alt"}, "D")
    end
end)

-- Map Cmd+alt+o to "Close Other Tabs" in browser (with debug logs)
hs.hotkey.bind({"cmd", "option"}, "O", function()
    local app = hs.application.frontmostApplication()
    if not app then
        hs.alert("No frontmost app")
        hs.console.printStyledtext("No frontmost application found\n")
        return
    end

    local appName = app:name()
    hs.console.printStyledtext("Hotkey pressed. Frontmost app: " .. appName .. "\n")
    local targetAppArray = {"Google Chrome", "Microsoft Edge", "Brave Browser", "Vivaldi", "Opera"}
    if isInArray(targetAppArray, appName) then
        local browser = hs.application.get(appName)
        if browser then
            local ok = browser:selectMenuItem({"Tab", "Close Other Tabs"})
            if ok then
                hs.alert("Closed other tabs")
                hs.console.printStyledtext("Successfully triggered menu item\n")
            else
                hs.alert("Menu item not found")
                hs.console.printStyledtext("Failed to find menu item: {Tab -> Close Other Tabs}\n")
            end
        else
            hs.console.printStyledtext("Failed to get browser application object\n")
        end
    else
        -- Fallback: send normal Cmd+Option+O
        hs.console.printStyledtext("Passing through Cmd+Option+O to " .. appName .. "\n")
        hs.eventtap.keyStroke({"cmd", "alt"}, "O")
    end
end)
