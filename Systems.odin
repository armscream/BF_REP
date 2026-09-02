// BF_REP/Systems.odin
package BF_REP

import ECS "../BF_ECS"

// STUBB
flush_rep_command_buffer :: proc {
    // Collect all dirty components in command buffer and flush/send as packet. this system will be registered
    // in the Post-Update phase.
}