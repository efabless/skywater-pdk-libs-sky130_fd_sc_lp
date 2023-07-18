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


`ifndef SKY130_FD_SC_LP__SRDLSTP_1_FUNCTIONAL_V
`define SKY130_FD_SC_LP__SRDLSTP_1_FUNCTIONAL_V

/**
 * srdlstp: ????.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dlatch_psa_pp_pkg_s/sky130_fd_sc_lp__udp_dlatch_psa_pp_pkg_s.v"

`celldefine
module sky130_fd_sc_lp__srdlstp_1 (
    Q      ,
    SET_B  ,
    D      ,
    GATE   ,
    SLEEP_B
);

    // Module ports
    output Q      ;
    input  SET_B  ;
    input  D      ;
    input  GATE   ;
    input  SLEEP_B;

    // Local signals
    wire buf_Q;
    wire kapwr;
    wire vgnd ;
    wire vpwr ;

    //                                       Delay       Name     Output  Other arguments
    sky130_fd_sc_lp__udp_dlatch$PSa_pp$PKG$s `UNIT_DELAY dlatch0 (buf_Q , D, GATE, SET_B, SLEEP_B, kapwr, vgnd, vpwr);
    bufif1                                               bufif10 (Q     , buf_Q, vpwr                               );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_LP__SRDLSTP_1_FUNCTIONAL_V
