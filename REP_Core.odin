// BF_REP/REP_Core.odin
package BF_REP

import ECS "../BF_ECS"

// Some stubbed implementations just outlining the idea of what to do with this module.

Network_Entity_ID :: distinct u64
Client_ID        :: distinct u32

Rep_Serializer_ID :: distinct u32
Rep_Channel       :: enum {
	Unreliable,
	Unreliable_Sequenced,
	Reliable,
	Reliable_Ordered,
}
Rep_State_Flags :: bit_set[Rep_State_Flag]
Rep_State_Flag :: enum u8 {
	Created,
	Destroyed,
	Owner_Changed,
	Dirty,
	Sleeping,
}

// Per-component dirty flags tracked by the replicator. Indexed parallel
// to the components listed in a Rep_Rule.
Rep_Component_Dirty_Flags :: bit_set[Rep_Component_Dirty_Flag]
Rep_Component_Dirty_Flag :: enum u8 {
	None,
	Value,
	Structure,
	Ownership,
}

// ================================
// INTEREST MANAGEMENT
Interest_State :: struct {
	distance_of_interest: f32,
	owned_components:     [dynamic]ECS.Component_ID,
	subscribed_channels:  [dynamic]Rep_Channel,
}

// Only add rules for the components you wish to replicate, leave others so they wont be touched.
Replication :: struct {
	rules: [dynamic]Rep_Rule,
}
// This might be too convoluted right now
Rep_Rule :: struct {
	component:      ECS.Component_ID, // This entity's component IDs I want to replicate
	policy:         Rep_Policy,
	serializer:     Rep_Serializer_ID,
	priority:       u8,
	channel:        Rep_Channel,
}
// Replication policy sets how when to replicate this component, this is placeholder for now.
Rep_Policy :: enum {
	On_Create,
	On_Change,
	Continuous,
	Owner,
	Owner_On_Change,
}

// ================================
// REPLICATION STATE
Rep_State :: struct {
	network_id: Network_Entity_ID,
	owner:      Client_ID, // is == Network_Entity_ID, then it is the server.
	flags:      Rep_State_Flags,
	// Possibly:
	last_rep_tick: u32,
	priority:      u8,
}

// ================================
// INTEREST MANAGEMENT
Rep_Client :: struct { // Per client rep state as concerned by the server.
	// Client concerned with their network state, are they up-to-date on other entities they should be interested in?
	client_ID: Client_ID,
	// What types of information should this client be interested in? Nearby entities, Owned components, Global multi-casts, etc..
	interest:  Interest_State,
	// Entities replicated to this client. Should be possible to add or remove based off of interest.
	entities:  [dynamic]Client_Rep_Entity,
}
// An entity representation that the client has. This is server-side code.
Client_Rep_Entity :: struct {
	entity: ECS.Entity,
	state:  Rep_Entity_State,
}
// State of the entity's replication traffic to the client.
Rep_Entity_State :: struct {
	known:          bool, // if not known then we need to replicate all entity info to client on next packet.
	initialized:    bool, // if not initialized then we need to replicate all entity info to client on next packet.
	last_sent_tick: u32, // Last time we sent an update about this entity to the client.
	component_state: [dynamic]Rep_Component_Dirty_Flags, // is that component dirty from last tick?
}
