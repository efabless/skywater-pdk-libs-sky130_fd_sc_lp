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


`ifndef SKY130_FD_SC_LP__SRSDFXTP_FUNCTIONAL_PP_V
`define SKY130_FD_SC_LP__SRSDFXTP_FUNCTIONAL_PP_V

/**
 * srsdfxtp: Scan flop with sleep mode, non-inverted clock,
 *           single output.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_mux_2to1/sky130_fd_sc_lp__udp_mux_2to1.v"
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_lp__udp_pwrgood_pp_pg.v"
`include "../../models/udp_dff_p_pp_pkg_sn/sky130_fd_sc_lp__udp_dff_p_pp_pkg_sn.v"

`celldefine
module sky130_fd_sc_lp__srsdfxtp (
    Q      ,
    CLK    ,
    D      ,
    SCD    ,
    SCE    ,
    SLEEP_B,
    KAPWR  ,
    VPWR   ,
    VGND   ,
    VPB    ,
    VNB
);

    // Module ports
    output Q      ;
    input  CLK    ;
    input  D      ;
    input  SCD    ;
    input  SCE    ;
    input  SLEEP_B;
    input  KAPWR  ;
    input  VPWR   ;
    input  VGND   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire buf_Q            ;
    wire mux_out          ;
    wire pwrgood_pp0_out_Q;

    //                                   Delay       Name         Output             Other arguments
    sky130_fd_sc_lp__udp_mux_2to1                    mux_2to10   (mux_out          , D, SCD, SCE                               );
    sky130_fd_sc_lp__udp_dff$P_pp$PKG$sN `UNIT_DELAY dff0        (buf_Q            , mux_out, CLK, SLEEP_B, , KAPWR, VGND, VPWR);
    sky130_fd_sc_lp__udp_pwrgood_pp$PG               pwrgood_pp0 (pwrgood_pp0_out_Q, buf_Q, VPWR, VGND                         );
    buf                                              buf0        (Q                , pwrgood_pp0_out_Q                         );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_LP__SRSDFXTP_FUNCTIONAL_PP_V
