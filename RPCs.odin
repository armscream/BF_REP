// BF_REP/RPCs.odin
package BF_REP

import "core:log"

/* 
//*[WEB INFO]
Remote Procedure Calls (RPCs) are primarily categorized by their communication behavior and execution model. 
The most common classification distinguishes between Synchronous and Asynchronous RPCs.  In Synchronous RPC, the 
client sends a request and blocks, waiting for the server to respond before continuing execution.  In Asynchronous 
(Nonblocking) RPC, the client sends a request and continues its own processing without waiting for an immediate reply,
handling the response when it arrives. 

RPCs are also classified by their routing and batching strategies:

* Callback RPC: Enables bidirectional communication where the server can initiate a call back to the client 
after processing a request, supporting peer-to-peer interactions. 

* Broadcast RPC: A client sends a single request to all servers on the network, allowing any available server
to process it; this is useful for load balancing or resource discovery. 

* Batch-mode RPC: The client queues multiple requests in a transmission buffer and sends them to the server in a
single batch, reducing network overhead and latency for applications with lower call rates. 
Additionally, in specific frameworks like Unreal Engine, RPCs are categorized by their execution scope:

*Client RPC: Executed on the owning client connection. 
*Server RPC: Executed on the server, typically called from the client. 
*Remote RPC: Executed on the remote side of a connection (either server or client), never locally. 
*NetMulticast RPC: Executed on the server and all relevant connected clients simultaneously
*/*/

RPC_Proc :: struct {
    
}

// Stubb
RPC :: proc(rpc_proc: RPC_Proc, synchronous: bool) -> bool {
    received: bool = false
    // Stubb
    log.warn("RPC is a stubb")
    return received
}