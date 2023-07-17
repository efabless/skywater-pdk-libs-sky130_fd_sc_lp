/*
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
*/


`ifndef SKY130_FD_SC_LP__INPUTISOLATCH_FUNCTIONAL_PP_V
`define SKY130_FD_SC_LP__INPUTISOLATCH_FUNCTIONAL_PP_V

/**
 * inputisolatch: Latching input isolator with inverted enable.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_p_pp_pg_n/sky130_fd_sc_lp__udp_dlatch_p_pp_pg_n.v"

`celldefine
module sky130_fd_sc_lp__inputisolatch (
    Q      ,
    D      ,
    SLEEP_B,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    input  D      ;
    input  SLEEP_B;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire buf_Q          ;
    wire SLEEP_B_delayed;
    wire D_delayed      ;

    //                                    Delay       Name     Output  Other arguments
    sky130_fd_sc_lp__udp_dlatch$P_pp$PG$N `UNIT_DELAY dlatch0 (buf_Q , D, SLEEP_B, , VPWR, VGND);
    buf                                               buf0    (Q     , buf_Q                   );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_LP__INPUTISOLATCH_FUNCTIONAL_PP_V
