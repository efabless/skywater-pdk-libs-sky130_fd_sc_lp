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


`ifndef SKY130_FD_SC_LP__A221O_1_TIMING_V
`define SKY130_FD_SC_LP__A221O_1_TIMING_V

/**
 * a221o: 2-input AND into first two inputs of 3-input OR.
 *
 *        X = ((A1 & A2) | (B1 & B2) | C1)
 *
 * Verilog simulation timing model.
 */

`timescale 1ns / 1ps
`default_nettype none

`celldefine
module sky130_fd_sc_lp__a221o_1 (
    X ,
    A1,
    A2,
    B1,
    B2,
    C1
);

    // Module ports
    output X ;
    input  A1;
    input  A2;
    input  B1;
    input  B2;
    input  C1;

    // Module supplies
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    // Local signals
    wire and0_out ;
    wire and1_out ;
    wire or0_out_X;

    //  Name  Output     Other arguments
    and and0 (and0_out , B1, B2                );
    and and1 (and1_out , A1, A2                );
    or  or0  (or0_out_X, and1_out, and0_out, C1);
    buf buf0 (X        , or0_out_X             );

specify
if ((A2&!B1&!B2&!C1)) (A1 +=> X) = (0:0:0,0:0:0);
if ((A2&!B1&B2&!C1)) (A1 +=> X) = (0:0:0,0:0:0);
if ((A2&B1&!B2&!C1)) (A1 +=> X) = (0:0:0,0:0:0);
if ((A1&!B1&!B2&!C1)) (A2 +=> X) = (0:0:0,0:0:0);
if ((A1&!B1&B2&!C1)) (A2 +=> X) = (0:0:0,0:0:0);
if ((A1&B1&!B2&!C1)) (A2 +=> X) = (0:0:0,0:0:0);
if ((!A1&!A2&B2&!C1)) (B1 +=> X) = (0:0:0,0:0:0);
if ((!A1&A2&B2&!C1)) (B1 +=> X) = (0:0:0,0:0:0);
if ((A1&!A2&B2&!C1)) (B1 +=> X) = (0:0:0,0:0:0);
if ((!A1&!A2&B1&!C1)) (B2 +=> X) = (0:0:0,0:0:0);
if ((!A1&A2&B1&!C1)) (B2 +=> X) = (0:0:0,0:0:0);
if ((A1&!A2&B1&!C1)) (B2 +=> X) = (0:0:0,0:0:0);
if ((!A1&!A2&!B1&!B2)) (C1 +=> X) = (0:0:0,0:0:0);
if ((!A1&!A2&!B1&B2)) (C1 +=> X) = (0:0:0,0:0:0);
if ((!A1&!A2&B1&!B2)) (C1 +=> X) = (0:0:0,0:0:0);
if ((!A1&A2&!B1&!B2)) (C1 +=> X) = (0:0:0,0:0:0);
if ((!A1&A2&!B1&B2)) (C1 +=> X) = (0:0:0,0:0:0);
if ((!A1&A2&B1&!B2)) (C1 +=> X) = (0:0:0,0:0:0);
if ((A1&!A2&!B1&!B2)) (C1 +=> X) = (0:0:0,0:0:0);
if ((A1&!A2&!B1&B2)) (C1 +=> X) = (0:0:0,0:0:0);
if ((A1&!A2&B1&!B2)) (C1 +=> X) = (0:0:0,0:0:0);
endspecify
endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_LP__A221O_1_TIMING_V
