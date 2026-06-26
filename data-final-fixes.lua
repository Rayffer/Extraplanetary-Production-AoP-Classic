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

-- Returns a deep copy of a recipe's categories.
-- If the recipe has no categories (or an empty list), treat it as {"crafting"}.
local function getRecipeCategories(recipeName)
    local recipe = data.raw.recipe[recipeName]

    if not recipe then
        return nil
    end

    if not recipe.categories or #recipe.categories == 0 then
        return { "crafting" }
    end

    return table.deepcopy(recipe.categories)
end

--@param recipe string The recipe to change
--@param category string|table The fallback category/categories
--@param reference string|table A recipe or table of recipes to copy categories from
function changeCategory(recipe, category, reference)
    local refstring
    if type(reference) == "table" then
        refstring = table.concat(reference, ", ")
    else
        refstring = tostring(reference)
    end

    log("Changing recipe '" .. recipe .. "' using reference '" .. refstring .. "'")

    local newCategories = nil

    -- Try to obtain categories from the reference recipe(s)
    if type(reference) == "string" then
        newCategories = getRecipeCategories(reference)

        if newCategories then
            log("Copied categories from '" .. reference .. "'")
        else
            log("Reference recipe '" .. reference .. "' does not exist, using fallback.")
        end

    elseif type(reference) == "table" then
        for _, entry in ipairs(reference) do
            newCategories = getRecipeCategories(entry)
            if newCategories then
                log("Copied categories from '" .. entry .. "'")
                break
            end
        end

        if not newCategories then
            log("No valid reference recipe found, using fallback.")
        end
    else
        log("Reference was not a string or table.")
    end

    -- Use the supplied fallback if no reference categories were found
    if not newCategories then
        if type(category) == "string" then
            newCategories = { category }
        elseif type(category) == "table" then
            newCategories = table.deepcopy(category)
        else
            log("Invalid fallback category type.")
            return false
        end
    end

    local recipeProto = data.raw.recipe[recipe]
    if not recipeProto then
        log("Failed to find recipe '" .. recipe .. "'")
        return false
    end

    -- Missing/empty categories implicitly mean "crafting".
    if not recipeProto.categories or #recipeProto.categories == 0 then
        recipeProto.categories = { "crafting" }
    end

    -- Build lookup table of existing categories.
    local existing = {}
    for _, cat in ipairs(recipeProto.categories) do
        existing[cat] = true
    end

    -- Append any missing categories.
    for _, cat in ipairs(newCategories) do
        if not existing[cat] then
            table.insert(recipeProto.categories, cat)
            existing[cat] = true
        end
    end

    log("Recipe '" .. recipe .. "' categories are now: " .. table.concat(recipeProto.categories, ", "))
    return true
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