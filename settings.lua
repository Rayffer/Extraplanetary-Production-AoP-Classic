function createBoolStartupSetting(name,default,order)
    if type(default) ~= "boolean" then
        log("Attempted to create boolean startup setting, but default was not a boolean.")
        return
    else
        data:extend({
            {
                type = "bool-setting",
                name = name,
                setting_type = "startup",
                default_value = default,
                order = order
              }
        })
    end
    
end
function createIntegerStartupSetting(name,default,min,max,order)
    data:extend({
        {
            type = "int-setting",
            name = name,
            setting_type = "startup",
            default_value = default,
            min = min,
            max = max,
            order = order
          }
    })
end
function createDoubleStartupSetting(name,default,min,max,order)
    data:extend({
        {
            type = "double-setting",
            name = name,
            setting_type = "startup",
            default_value = default,
            min = min,
            max = max,
            order = order
          }
    })
end
function createStringStartupSetting(name,default,allowed,order)
    if type(allowed) ~= "table" then
        log("Attempted to create string startup setting, but allowed was not a table.")
        return
    elseif type(default) ~= "string" then
        log("Attempted to create string startup setting, but default was not a string.")
        return
    else
        data:extend({
            {
                type = "string-setting",
                name = name,
                setting_type = "startup",
                default_value = default,
                allowed_values = allowed,
                order = order
            }
        })
    end
    
end

createBoolStartupSetting("adv-science-recipes",true,"a")
createBoolStartupSetting("basic-science-changes",true,"a")
createBoolStartupSetting("personal-equip-em-plant",false,"a")
createBoolStartupSetting("nuclear-reactor-cryo-plant",false,"a")
createBoolStartupSetting("logi-in-em-plant",true,"a")
createBoolStartupSetting("inserters-in-em-plant",false,"a")

createBoolStartupSetting("experimental-compat",true,"z")