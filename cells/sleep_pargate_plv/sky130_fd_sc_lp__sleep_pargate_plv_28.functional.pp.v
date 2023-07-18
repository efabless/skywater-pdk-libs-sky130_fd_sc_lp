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


`ifndef SKY130_FD_SC_LP__SLEEP_PARGATE_PLV_28_FUNCTIONAL_PP_V
`define SKY130_FD_SC_LP__SLEEP_PARGATE_PLV_28_FUNCTIONAL_PP_V

/**
 * sleep_pargate_plv: ????.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_pwrgood_pp_pg/sky130_fd_sc_lp__udp_pwrgood_pp_pg.v"

`celldefine
module sky130_fd_sc_lp__sleep_pargate_plv_28 (
    VIRTPWR,
    SLEEP  ,
    VPWR   ,
    VPB    ,
    VNB
);

    // Module ports
    output VIRTPWR;
    input  SLEEP  ;
    input  VPWR   ;
    input  VPB    ;
    input  VNB    ;

    // Local signals
    wire vgnd                   ;
    wire pwrgood_pp0_out_VIRTPWR;

    //                                 Name         Output                   Other arguments
    pulldown                           pulldown0   (vgnd                   );
    sky130_fd_sc_lp__udp_pwrgood_pp$PG pwrgood_pp0 (pwrgood_pp0_out_VIRTPWR, VPWR, VPWR, vgnd              );
    bufif0                             bufif00     (VIRTPWR                , pwrgood_pp0_out_VIRTPWR, SLEEP);

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_LP__SLEEP_PARGATE_PLV_28_FUNCTIONAL_PP_V
