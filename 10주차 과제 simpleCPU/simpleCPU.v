module simpleCPU(
    input   clk,
    input   reset,
    input   halt,
    output  [3:0] write_addr,
    output  [7:0] write_data
);

wire [15:0] instruction;
wire [3:0]  write_address, opcode_decode, opcode_execute, dest_addr_decode, dest_addr_execute, src_addr1, src_addr2;
wire [7:0]  alu_result, data1, data2;
wire        write_enable;
wire [11:0] pc;

fetch fetch_unit(
    .i_clk(clk),
    .i_reset(reset),
    .i_stop(halt),
    .o_pc(pc)
);

decode decode_unit(
    .i_instruction(instruction),
    .o_srcadd1(src_addr1),
    .o_srcadd2(src_addr2),
    .o_opcode(opcode_decode),
    .o_destadd(dest_addr_decode)
);

execute execute_unit(
    .i_clk(clk),
    .i_reset(reset),
    .i_opcode(opcode_execute),
    .i_srcdata1(data1),
    .i_srcdata2(data2),
    .i_destadd(dest_addr_execute),
    .o_write_en(write_enable),
    .o_write_add(write_address),
    .o_write_data(alu_result)
);

InstMem inst_mem(
    .i_clk(clk),
    .i_reset(reset),
    .i_stop(halt),
    .i_pc(pc),
    .o_instruction(instruction)
);

register_file reg_file(
    .i_clk(clk),
    .i_reset(reset),
    .i_write_en(write_enable),
    .i_opcode(opcode_decode),
    .i_destadd(dest_addr_decode),
    .i_read_reg1(src_addr1),
    .i_read_reg2(src_addr2),
    .i_write_reg(write_address),
    .i_write_data(alu_result),
    .o_read_data1(data1),
    .o_read_data2(data2),
    .o_opcode(opcode_execute),
    .o_destadd(dest_addr_execute)
);

assign write_addr = write_address;
assign write_data = alu_result;

endmodule
