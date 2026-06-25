function addRecipeToTechnology(recipe,technology)
    log("Adding recipe "..recipe.." to technology "..technology)
    table.insert(data.raw["technology"][technology].effects, {
        type = "unlock-recipe",
        recipe = recipe
      })
end

adv_science_recipes = settings.startup["adv-science-recipes"].value

data:extend{
    {
        type = "recipe",
        name = "ammonial-holmium-solution",
        category = "cryogenics",
        subgroup = "aquilo-processes",
        order = "b[holmium]-c[ammonial-holmium-solution]",
        icons = {{
                icon = "__space-age__/graphics/icons/fluid/holmium-solution.png",
                scale = 0.6,
                shift = {4, 4}
                },{
                icon = "__space-age__/graphics/icons/fluid/ammonia.png",
                scale = 0.5,
                shift = {-4, -4}
        }},
        enabled = false,
        ingredients =
        {
            {type = "fluid", name = "ammonia", amount = 10}, 
            {type = "fluid", name = "water", amount = 10},
            {type = "item", name = "holmium-ore", amount = 1}
        },
        energy_required = 10.0,
        allow_decomposition = false,
        results = {
            {type = "fluid", name = "holmium-solution", amount = 75},
            {type = "fluid", name = "ammonia", amount = 5, ignored_by_productivity = 5}
        },
        allow_productivity = true
    },
    {
        type = "recipe",
        name = "casting-engine-unit",
        category = "metallurgy",
        subgroup = "vulcanus-processes",
        order = "b[casting]-g[engine-unit]",
        icons = {{
            icon = "__base__/graphics/icons/engine-unit.png",
            scale = 0.5,
            shift = {-4, 4}
            },{
            icon = "__space-age__/graphics/icons/fluid/molten-iron.png",
            scale = 0.5,
            shift = {6, -4}
        }},
        enabled = false,
        ingredients = {
            {type = "fluid", name = "molten-iron", amount = 20},
            {type = "item", name = "iron-gear-wheel", amount = 1},
            {type = "item", name = "pipe", amount = 2},
        },
        energy_required = 10.0,
        allow_decomposition = false,
        results = {{type = "item", name = "engine-unit", amount = 1}},
        allow_productivity = true
    },
    {
        type = "recipe",
        name = "casting-gun-turret",
        category = "metallurgy",
        subgroup = "vulcanus-processes",
        order = "b[casting-turrets]-a[gun-turret]",
        icons = {{
            icon = "__base__/graphics/icons/gun-turret.png",
            scale = 0.5,
            shift = {-4, 4}
            },{
            icon = "__space-age__/graphics/icons/fluid/molten-iron.png",
            scale = 0.5,
            shift = {6, -4}
        }},
        enabled = false,
        ingredients = {
            {type = "fluid", name = "molten-iron", amount = 200},
            {type = "fluid", name = "molten-copper", amount = 100},
            {type = "item", name = "iron-gear-wheel", amount = 10},
        },
        energy_required = 8.0,
        allow_decomposition = false,
        results = {{type = "item", name = "gun-turret", amount = 1}},
        allow_productivity = false
    },
    {
        type = "recipe",
        name = "casting-flamethrower-turret",
        category = "metallurgy",
        subgroup = "vulcanus-processes",
        order = "b[casting-turrets]-a[flamethrower-turret]",
        icons = {{
            icon = "__base__/graphics/icons/flamethrower-turret.png",
            scale = 0.5,
            shift = {-4, 4}
            },{
            icon = "__space-age__/graphics/icons/fluid/molten-iron.png",
            scale = 0.5,
            shift = {6, -4}
        }},
        enabled = false,
        ingredients = {
            {type = "fluid", name = "molten-iron", amount = 900},
            {type = "item", name = "iron-gear-wheel", amount = 15},
            {type = "item", name = "engine-unit", amount = 5},
            {type = "item", name = "pipe", amount = 10},
        },
        energy_required = 20.0,
        allow_decomposition = false,
        results = {{type = "item", name = "flamethrower-turret", amount = 1}},
        allow_productivity = false
    },
    {
        type = "recipe",
        name = "casting-rail",
        category = "metallurgy",
        subgroup = "vulcanus-processes",
        order = "b[casting]-j[rail]",
        icons = {{
            icon = "__base__/graphics/icons/concrete.png",
            scale = 0.8,
            shift = {0, 0}
            },{
            icon = "__base__/graphics/icons/rail.png",
            scale = 0.5,
            shift = {-4, 4}
            },{
            icon = "__space-age__/graphics/icons/fluid/molten-iron.png",
            scale = 0.5,
            shift = {6, -4}
            }},
        enabled = false,
        ingredients = {
            {type = "fluid", name = "molten-iron", amount = 560},
            {type = "item", name = "concrete", amount = 4},
        },
        energy_required = 2,
        allow_decomposition = false,
        results = {{type = "item", name = "rail", amount = 40}},
        allow_productivity = false
    },
    {
        type = "recipe",
        name = "casting-heat-pipe",
        category = "metallurgy",
        subgroup = "vulcanus-processes",
        order = "b[casting]-k[heat-pipe]",
        icons = {{
            icon = "__base__/graphics/icons/heat-pipe.png",
            scale = 0.5,
            shift = {0, 8}
            },{
            icon = "__space-age__/graphics/icons/fluid/molten-iron.png",
            scale = 0.4,
            shift = {2, -8}
            },{
            icon = "__space-age__/graphics/icons/fluid/molten-copper.png",
            scale = 0.5,
            shift = {10, -4}
            }},
        enabled = false,
        ingredients = {
            {type = "fluid", name = "molten-iron", amount = 300},
            {type = "fluid", name = "molten-copper", amount = 200}
        },
        energy_required = 1,
        allow_decomposition = false,
        results = {{type = "item", name = "heat-pipe", amount = 1}},
        allow_productivity = false
    },
    {
        type = "recipe",
        name = "lds-space-platform-foundation",
        category = "pressing",
        icons = {{
            icon = "__space-age__/graphics/icons/space-platform-foundation.png",
            scale = 0.5,
            shift = {0, 0}
            },{
            icon = "__base__/graphics/icons/low-density-structure.png",
            scale = 0.3,
            shift = {-8, -8}
            }},
        enabled = false,
        ingredients = {
            {type = "item", name = "low-density-structure", amount = 5},
            {type = "item", name = "copper-cable", amount = 30}
        },
        energy_required = 10,
        allow_decomposition = false,
        results = {{type = "item", name = "space-platform-foundation", amount = 3}},
        allow_productivity = false
    }
}

addRecipeToTechnology("ammonial-holmium-solution","cryogenic-plant")
addRecipeToTechnology("casting-engine-unit","foundry")
addRecipeToTechnology("casting-gun-turret","foundry")
addRecipeToTechnology("casting-flamethrower-turret","foundry")
addRecipeToTechnology("casting-rail","foundry")
addRecipeToTechnology("casting-heat-pipe","foundry")
addRecipeToTechnology("lds-space-platform-foundation","foundry")


-- Advanced Sciences
if adv_science_recipes then
    data:extend{
        {
            type = "item-subgroup",
            name = "advanced-science-pack",
            group = "intermediate-products",
            order = "y"
        }
    }

    data:extend{
        {
            type = "recipe",
            name = "advanced-automation-science-pack",
            category = "pressing",
            subgroup = "advanced-science-pack",
            icons = {{
                icon = "__base__/graphics/icons/automation-science-pack.png",
                scale = 1.0,
                shift = {0, 0}
                },{
                    icon = "__extraplanetary-production__/graphics/icons/advanced-recipe.png",
                    scale = 0.5,
                    shift = {-12, 12}
                }},
            enabled = false,
            ingredients = {
                {type = "item", name = "iron-gear-wheel", amount = 10},
                {type = "fluid", name = "molten-copper", amount = 100}
            },
            energy_required = 50,
            results = {{type="item", name="automation-science-pack", amount=10}},
            allow_productivity = true
        },
        {
            type = "recipe",
            name = "advanced-logistic-science-pack",
            category = "electronics",
            subgroup = "advanced-science-pack",
            icons = {{
                icon = "__base__/graphics/icons/logistic-science-pack.png",
                scale = 1.0,
                shift = {0, 0}
                },{
                icon = "__extraplanetary-production__/graphics/icons/advanced-recipe.png",
                scale = 0.5,
                shift = {-12, 12}
                }},
            enabled = false,
            ingredients = {
                {type = "item", name = "fast-inserter", amount = 1},
                {type = "item", name = "fast-transport-belt", amount = 1}
            },
            energy_required = 18,
            results = {{type="item", name="logistic-science-pack", amount=3}},
            allow_productivity = true
        },
        {
            type = "recipe",
            name = "advanced-military-science-pack",
            category = "crafting-with-fluid",
            subgroup = "advanced-science-pack",
            icons = {{
                icon = "__base__/graphics/icons/military-science-pack.png",
                scale = 1.0,
                shift = {0, 0}
                },{
                icon = "__extraplanetary-production__/graphics/icons/advanced-recipe.png",
                scale = 0.5,
                shift = {-12, 12}
                }},
            enabled = false,
            ingredients = {
                {type = "item", name = "uranium-rounds-magazine", amount = 1},
                {type = "item", name = "cluster-grenade", amount = 1},
                {type = "fluid", name = "light-oil", amount = 20}
            },
            energy_required = 50,
            results = {{type="item", name="military-science-pack", amount=20}},
            allow_productivity = true
        }
    }

    addRecipeToTechnology("advanced-automation-science-pack","foundry")
    addRecipeToTechnology("advanced-logistic-science-pack","electromagnetic-plant")
    addRecipeToTechnology("advanced-military-science-pack","uranium-ammo")
end