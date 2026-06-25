function tableContains(table, value)
  if not table then
    log("tableContains failed: table is nil")
    return nil
  end
  if not value then
    log("tableContains failed: value is nil")
    return nil
  end
    for i, _ in pairs(table) do
      if (table[i] == value) then
        return true
      end
    end
    return false
end

function matchInTable(table, pattern)
    if not table then
        log("matchInTable failed: table is nil")
        return nil
    end
    if not pattern then
        log("matchInTable failed: pattern is nil")
        return nil
    end
    for i, _ in pairs(table) do
        if string.find(table[i],pattern) then
            return true
        end
    end
    return false
end

-- TODO: Adapt to 2.1

--@param recipe string The recipe to change
--@param category string The category to change it to
--@param reference string||table A recipe or table of recipes to take the category of if available
function changeCategory(recipe,category,reference)
    if type(reference)=="table" then refstring = table.concat(reference,", ") else refstring = tostring(reference) end
    log("Changing recipe "..recipe.." to category "..category..",  or referencing category of "..refstring)
    if type(reference) == "string" then
        if data.raw["recipe"][reference].categories then
            category = data.raw["recipe"][reference].categories
        else
            log("Reference recipe category was not available, using default.")
        end
    elseif type(reference) == "table" then
        reference_valid = false
        for i, entry in pairs(reference) do
            if data.raw["recipe"][reference].categories then
                category = data.raw["recipe"][reference].categories
                reference_valid = true
                break
            end
        end
        if reference_valid then log("Successfully used reference: "..reference..", category is "..category) else log("No valid reference could be found, using default.") end
    else
        log("Reference given was not a string or table!")
    end
    if data.raw.recipe[recipe] then
        data.raw.recipe[recipe].categories = category
        return true
    else
        log("Failed to find "..recipe.." to change category of!")
        return false
    end
end

assembler_1 = data.raw["assembling-machine"]["assembling-machine-1"]
assembler_2 = data.raw["assembling-machine"]["assembling-machine-2"]
assembler_3 = data.raw["assembling-machine"]["assembling-machine-3"]
biochamber = data.raw["assembling-machine"]["biochamber"]
foundry = data.raw["assembling-machine"]["foundry"]
em_plant = data.raw["assembling-machine"]["electromagnetic-plant"]
cryo_plant = data.raw["assembling-machine"]["cryogenic-plant"]
chemical_plant = data.raw["assembling-machine"]["chemical-plant"]
centrifuge = data.raw["assembling-machine"]["centrifuge"]
oil_refinery = data.raw["assembling-machine"]["oil-refinery"]

require("scripts/recipe-updates")

--Compat for mods that change the icon of sciences
--@param icon_path string The icon to check consistency of
--@param reference string The icon to compare against and replace if different
function checkUpdateIcon(icon_path,reference_path)
    if not icon_path == reference_path then
        log("Detected icon "..icon_path.."differs from " ..reference_path..", updating to match.")
        icon_path = reference_path
    end
    return icon_path
end

if adv_science_recipes then
    checkUpdateIcon(data.raw["recipe"]["automation-science-pack"].icon,data.raw["recipe"]["advanced-automation-science-pack"].icons[1].icon)
    checkUpdateIcon(data.raw["recipe"]["logistic-science-pack"].icon,data.raw["recipe"]["advanced-logistic-science-pack"].icons[1].icon)
    checkUpdateIcon(data.raw["recipe"]["military-science-pack"].icon,data.raw["recipe"]["advanced-military-science-pack"].icons[1].icon)
end

--Mod Compat
if settings.startup["experimental-compat"] then
    require("compat/basic_compat")
end

require("compat/Age-of-Production")
require("compat/maraxis")