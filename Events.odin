// BF_REP/Events.odin
package BF_REP

//*INFO from web below, not going to stubb anything here for now. I am not sure how i will, or if i will implement events, 
// I likely need either or both RPCs and Events, but most replication should be done through the Rep_Component as that is
// likely the easiest, and probably most performant way to do things.

/* //*[WEB INFO]
*In Unreal Engine, replication events (also called RepNotify or OnRep functions) are callback functions that fire on
the client when a replicated property changes.  They are the counterpart to RPCs for handling stateful changes,
whereas RPCs handle transient/one-off events. 

*How They Work == You attach them to a property using the ReplicatedUsing specifier:
*
*   UPROPERTY(ReplicatedUsing = OnRep_Health) 
*   uint32 Health;

*   UFUNCTION()
*   void OnRep_Health();

The engine automatically calls OnRep_Health() on the client whenever Health changes and gets replicated. You can also 
receive the previous value as a parameter:

*void OnRep_Health(uint32 LastHealth);

*Key Behaviors
Client-only by default — the engine calls OnRep automatically on clients.  On the server, you must call it manually 
(in Blueprint, "Set with Rep Notify" does this for you). 
Listen server caveat — OnRep does not fire on the host of a listen server because data never passes through the network 
layer.  You need to call it manually in that case.
Conditional notification — use DOREPLIFETIME_CONDITION_NOTIFY to control when the callback fires:
*REPNOTIFY_Always — fires every time the property replicates
*REPNOTIFY_OnChanged — fires only when the value actually changes 

View all
When to Use OnRep vs. RPCs
Scenario	Use
Stateful changes (health, inventory, door open/closed)	Replicated property + OnRep
Transient / one-off events (explosion VFX, sound cue)	Multicast / Client RPC
Client → Server communication	Server RPC

*The golden rule: replicated properties + OnRep for state, RPCs for transient events. This avoids the problem of 
*late-joining clients missing one-shot RPCs, since replicated state is always available on new connections. 
*/*/