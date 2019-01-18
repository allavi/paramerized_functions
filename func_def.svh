// a parameterized function

`define onehot2bin(vector)  func_pack::func_pkg #(.SIZE($size(vector)))::onehot2bin(vector)
`define bin2onehot(vector)  func_pack::func_pkg #(.SIZE($size(vector)))::bin2onehot(vector)
`define maj_func(vector)    func_pack::func_pkg #(.SIZE($size(vector)))::maj_func(vector)
`define bit_reverse(vector) func_pack::func_pkg #(.SIZE($size(vector)))::bit_reverse(vector)
`define bin2grey(vector)    func_pack::func_pkg #(.SIZE($size(vector)))::bin2grey(vector)
`define grey2bin(vector)    func_pack::func_pkg #(.SIZE($size(vector)))::grey2bin(vector)

module functions_use (
   input clk   ,
   input clk_en,
   input rst_n
);



endmodule