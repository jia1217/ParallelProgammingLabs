#include "mvm_sa.hpp"


void mvm_sa(data_stream& x_stream, acc_stream& y_stream){
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
#pragma HLS INTERFACE mode=axis port=A_stream
#pragma HLS INTERFACE mode=axis port=x_stream
#pragma HLS INTERFACE mode=axis port=y_stream
	static const data_t A_local[N][N] = {
			0,1,2,3,
			4,5,6,7,
			8,9,10,11,
			12,13,14,15
	};
#pragma HLS ARRAY_PARTITION variable=A_local dim=1 type=complete
	static data_t x_local[N];
#pragma HLS ARRAY_PARTITION variable=x_local dim=1 type=complete
	static data_t acc[N];
#pragma HLS ARRAY_PARTITION variable=acc dim=1 type=complete

#pragma HLS DATAFLOW
read_x_loop:
	for (int i = 0; i < N;i++){
		data_axis_dp temp;
		x_stream >> temp;
		// shift_reg
		for (int j = N-1; j > 1;j--){
			x_local[j] = x_local[j - 1];
		}
		x_local[0] = temp.data;
		for (int j = 0; j < N; j++){
			acc_t last = (i == j)? 0:acc[j];
			data_t x = x_local[j];
			data_t a = (i >= j)?A_local[j][i - j]:0;
			acc[j] = last + a * x;
		}
	}

write_y_loop:
	for (int i = N; i < 2 * N;i++){
		// shift_reg
		for (int j = N-1; j > 1;j--){
			x_local[j] = x_local[j - 1];
		}
		for (int j = 0; j < N; j++){
			acc_t last = acc[j];
			data_t x = x_local[j];
			data_t a = (j > i - N)? A_local[j][i - j] : 0;
			acc[j] = last + a * x;
		}
		acc_axis_dp temp;
		temp.data = acc[i - N];
		temp.keep = -1;
		temp.last = (i == (2 * N-1));
		y_stream << temp;
	}
}
