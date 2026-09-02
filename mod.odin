package BF_REP

import "core:log"
import "../../Core"

// === MODULE_IDENTITY (parsed by rbs) ===
IDENTITY :: Core.Lib_Descriptor {
	api_version      = Core.LIB_API_VERSION,
	name             = "BF_ECS",
	version          = Core.Version{0, 0, 1},
	author           = "armscream",
	description      = "Minimal BF_ECS: entity storage, world partition, and DAG-registered ECS systems.",
	component_kind   = .Module,
	type             = .ECS,
	flags            = {.Runtime, .Provides_Service},
	capabilities     = {.ECS},
	dependencies     = {{
		name            = "BF_DAG",
		min_version     = Core.Version{0, 0, 1},
		max_version     = Core.Version{9, 9, 9},
		has_max_version = true,
		has_min_version = true,
		optional        = false,
	},
    {
       	name            = "BF_ECS",
		min_version     = Core.Version{0, 0, 1},
		max_version     = Core.Version{9, 9, 9},
		has_max_version = true,
		has_min_version = true,
		optional        = false, 
    }},
	dependency_count = 1,
}
// === END MODULE_IDENTITY ===

MODULE_API := Core.LIB_API {
	descriptor = IDENTITY,
	load       = module_load,
	register   = module_register,
	activate   = module_activate,
	deactivate = module_deactivate,
	unload     = module_unload,
}