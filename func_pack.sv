// a parameterized functions
// package will be complemented by

package func_pack;

	virtual class func_pkg #(parameter SIZE=32,MASTERS=9,SLAVES=8);

		static function logic [$clog2(SIZE)-1:0] onehot2bin(logic [SIZE-1:0] one_hot_vector,bit prior=0);
			if(prior) begin // MSB priority
				for (int i = SIZE-1; i >= 0; i--)
					if(one_hot_vector[i]) return SIZE-i;
				return 0;
			end
			else begin // LSB priority
				for (int i = 0; i < SIZE; i++)
					if(one_hot_vector[i]) return i;
				return 0;
			end
		endfunction

      static function logic [(2*SIZE)-1:0] bin2onehot(logic [SIZE-1:0] bin_vector, bit hot_one = 1);
         if(hot_one)
            bin_to_one_hot = 1<<bin_vector+1;
         else
            bin_vector = ~(1<<bin_vector+1);
      endfunction

		static function logic [MASTERS*SLAVES-1:0] transponse (logic [SLAVES-1:0][MASTERS-1:0] bit_vector);
			logic [MASTERS-1:0][SLAVES-1:0] vector;
			for (int i = 0; i < MASTERS; i++)
				for (int j = 0; j < SLAVES; j++)
					vector[i][j] = bit_vector[j][i];
			return vector;
		endfunction

      static function logic maj_func ([SIZE-1:0]vector);
         int sum=0;
         for (int i = 0; i < SIZE; i++)
            sum += vector[i];
         return sum>((SIZE%2)?((SIZE-1)/2):(SIZE/2));
      endfunction

      static function logic [SIZE-1:0] bit_reverse ([SIZE-1:0]vector);
         logic [SIZE-1:0] rev;
         for (int i = 0; i < SIZE; i++)
            rev[SIZE-i] += vector[i];
         return rev;
      endfunction

      static function logic [SIZE-1:0] bin2grey ([SIZE-1:0]bin_vector);
         logic [SIZE-1:0] grey_vector;
         grey_vector[SIZE-1] = bin_vector[SIZE-1];
         for (int i = 0; i < SIZE-1; i++) begin
            grey_vector[i] = bin_vector[i]^bin_vector[i+1];
         end
      endfunction

      static function logic [SIZE-1:0] grey2bin ([SIZE-1:0]grey_vector);
         logic [SIZE-1:0] bin_vector;
         bin_vector[SIZE-1] = grey_vector[SIZE-1];
         for (int i = 0; i < SIZE-1; i++) begin
            bin_vector[i] = bin_vector[i+1]^grey_vector[i];
         end
      endfunction

	endclass

endpackage