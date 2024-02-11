---
sort: 25
---


# Tiling-based Convolution

<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    tex2jax: {
        inlineMath: [ ['$','$'], ["\\(","\\)"] ],
        displayMath: [ ['$$','$$'], ["\\[","\\]"] ],
        processEscapes: false,
    }
  });
</script>
     
<script type="text/javascript"
        src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>

## Convolution for Object Detection

At the core of almost every object detection model is a convolution neural network (CNN) such as VGG-16, ResNet50, Xception, YOLO, MobileNet, etc. These are essentailly feature extraction networks. They "look" at images and extract salient features such as edges, shapes, and so on. The convolutional layer in convolutional neural networks systematically applies filters to an input and creates output feature maps. Although the convolutional layer is very simple, it is capable of achieving sophisticated and impressive results. Nevertheless, it can be challenging to develop an intuition for how the shape of the filters impacts the shape of the output feature map and how related configuration hyperparameters such as padding and stride should be configured.

### Motivation - ResNet-50 for HD Inputs

ResNet-50 is a popular convolutional neural network (CNN) that is 50 layers deep. At its core, ResNet-50 is a feature extraction network. Based on how it is used in a deep learning model, ResNet-50 can act as an image classifier or as a feature extractor for object detection/tracking.

We are interested in implementing this convolution layer of ResNet-50 with the above HD input image. Suppose that the input image (feature map) is described by a 3D tensor ```X(ID, IH, IW)```. We use a filter ```W``` with 64 kernels, each of dimensions ```(ID, KH, KW)``` where ```KH``` and ```KW``` are kernel window heights and widths. The resulting output feature map can be described by another 3D tensor ```Y(OD, OH, OW)```. The output feature map dimesions are a function of the stride ```S``` and padding size ```P``` chosen. For the first layer of ResNet-50, the values of these parameters are described in the table below.

| Layer Parameters |  Layer Values |
| ---------------- | ----------------- |
| Kernel Size (KH x KW)  | 3 x 3 |
| Filter Size	(OD) | 64 |
| Input Feature Map (ID, IH, IW) | (64, 184, 320) |
| Stride (S) | 1 |
| Padding (P) | 1	|	
| Output Feature Map (OD, OH, OW) | (64, 184, 320) |

If these values do not make any sense to you in the first glance, don't worry. You can learn these concepts easily through this well-written [CNN cheatsheet](https://stanford.edu/~shervine/teaching/cs-230/cheatsheet-convolutional-neural-networks). 

There are a few caveats in handling border pixels that you would need to keep in mind while writing your convolution code. This [article](https://sharc-knowledgebase.netlify.app/articles/cnn/tiling-based_convolution_for_hls/) from last year's assignment explaining 3 x 3 convolution may be useful. Most of the concepts are extensible to 7 x 7 convolution. 

### Convolution Layer

In a convolutional neural network, a convolutional layer is responsible for the systematic application of one or more filters to an input.

The multiplication of the filter to the input image results in a single output. The input is typically three-dimensional images (e.g. rows, columns and channels), and in turn, the filters are also three-dimensional with the same number of channels and fewer rows and columns than the input image. As such, the filter is repeatedly applied to each part of the input image, resulting in a two-dimensional output map of activations, called a feature map.

Keras provides an implementation of the convolutional layer called a Conv2D.

It requires that you specify the expected shape of the input images in terms of rows (height), columns (width), and channels (depth) or [rows, columns, channels].

The filter contains the weights that must be learned during the training of the layer. The filter weights represent the structure or feature that the filter will detect, and the strength of the activation indicates the degree to which the feature was detected.

The layer requires that both the number of filters and the shape of the filters be specified.

We can demonstrate this with a small example. In this example, we define a single input image or sample that has one channel and is an eight-pixel by eight-pixel square with all 0 values and a two-pixel wide vertical line in the center.

```python
# define input data
data =  [[0, 0, 0, 1, 1, 0, 0, 0],
		[0, 0, 0, 1, 1, 0, 0, 0],
		[0, 0, 0, 1, 1, 0, 0, 0],
		[0, 0, 0, 1, 1, 0, 0, 0],
		[0, 0, 0, 1, 1, 0, 0, 0],
		[0, 0, 0, 1, 1, 0, 0, 0],
		[0, 0, 0, 1, 1, 0, 0, 0],
		[0, 0, 0, 1, 1, 0, 0, 0]]
data = asarray(data)
data = data.reshape(1, 8, 8, 1)

```

Next, we can define a model that expects input samples to have the shape (8, 8, 1) and has a single hidden convolutional layer with a single filter with the shape of three pixels by three pixels.

```python

# create model
model = Sequential()
model.add(Conv2D(1, (3,3), input_shape=(8, 8, 1)))
# summarize model
model.summary()

```
The filter is initialized with random weights as part of the initialization of the model. We will overwrite the random weights and hard code our own 3×3 filter that will detect vertical lines.

That is the filter will strongly activate when it detects a vertical line and weakly activate when it does not. By applying this filter across the input image, we expect that the output feature map will show that the vertical line was detected.

```python
# define a vertical line detector
detector = [[[[0]],[[1]],[[0]]],
            [[[0]],[[1]],[[0]]],
            [[[0]],[[1]],[[0]]]]
weights = [asarray(detector), asarray([0.0])]
# store the weights in the model
model.set_weights(weights)

```
Next, we can apply the filter to our input image by calling the predict() function on the model.

```python
# apply filter to input data
yhat = model.predict(data)
```
The result is a four-dimensional output with one batch, several rows and columns, and one filter, or [batch, rows, columns, filters].
Of note is that the single hidden convolutional layer will take the 8×8 pixel input image and will produce a feature map with the dimensions of 6×6. We will go into why this is the case in the next section.

### Problem of Border Effects

In the previous section, we defined a single filter with a size of three pixels high and three pixels wide (rows, columns).
We saw that applying the 3×3 filter, referred to as the kernel size in Keras, to the 8×8 input image resulted in a feature map with the size of 6×6.
The input image with 64 pixels was reduced to a feature map with 36 pixels. Where did the other 28 pixels go?
The filter is applied systematically to the input image. It starts at the top left corner of the image and is moved from left to right one-pixel column at a time until the filter's edge reaches the edge.
For a 3×3 pixel filter applied to an 8×8 input image, we can see that it can only be applied six times, resulting in a width of six in the output feature map.
For example, let’s work through each of the six patches of the input image (left) dot product (“.” operator) the filter (right):

```
0, 0, 0   0, 1, 0
0, 0, 0 . 0, 1, 0 = 0
0, 0, 0   0, 1, 0
```
Moved right one pixel:
```
0, 0, 1   0, 1, 0
0, 0, 1 . 0, 1, 0 = 0
0, 0, 1   0, 1, 0
```
Moved right one pixel:
```
0, 1, 1   0, 1, 0
0, 1, 1 . 0, 1, 0 = 3
0, 1, 1   0, 1, 0

```
Moved right one pixel:
```
1, 1, 0   0, 1, 0
1, 1, 0 . 0, 1, 0 = 3
1, 1, 0   0, 1, 0
```
Moved right one pixel:
```
1, 0, 0   0, 1, 0
1, 0, 0 . 0, 1, 0 = 0
1, 0, 0   0, 1, 0
```
Moved right one pixel:
```
0, 0, 0   0, 1, 0
0, 0, 0 . 0, 1, 0 = 0
0, 0, 0   0, 1, 0

```

That gives us the first row and each column of the output feature map:

```
0.0, 0.0, 3.0, 3.0, 0.0, 0.0
```

The reduction in the size of the input to the feature map is referred to as border effects. It is caused by the interaction of the filter with the border of the image.
This is often not a problem for large images and small filters but can be a problem with small images. It can also become a problem once a number of convolutional layers are stacked.
For example, if the size of the input feature image is 8×8 and it has two stacked convolutional layers, this means that a 3×3 filter is applied to the 8×8 input image to result in a 6×6 feature map as in the previous section. A 3×3 filter is then applied to the 6×6 feature map.


### Effect of Filter Size (Kernel Size)

Different-sized filters will detect different-sized features in the input image and, in turn, will result in differently-sized feature maps.
It is common to use 3×3 sized filters, and perhaps 5×5 or even 7×7 sized filters, for larger input images.
For example, it is an example of a model with a single filter updated to use a filter size of 5×5 pixels. The 5×5 filter can only be applied to the 8×8 input image 4 times, resulting in a 4×4 feature map output. It may help to develop further the intuition of the relationship between filter size and the output feature map to look at two extreme cases.
The first is a filter with the size of 1×1 pixels, and the output feature map has the same size as the input, specifically 8×8. This is because the filter only has a single weight (and a bias).


### Fix the Border Effect Problem with Padding

By default, a filter starts at the left of the image with the left-hand side of the filter sitting on the far left pixels of the image. The filter is then stepped across the image one column at a time until the right-hand side of the filter is sitting on the far right pixels of the image.
An alternative approach to applying a filter to an image is to ensure that each pixel in the image is given an opportunity to be at the center of the filter.
By default, this is not the case, as the pixels on the edge of the input are only ever exposed to the filter's edge. By starting the filter outside the frame of the image, it gives the pixels on the border of the image more of an opportunity for interacting with the filter, more of an opportunity for features to be detected by the filter, and in turn, an output feature map that has the same shape as the input image.

For example, when applying a 3×3 filter to the 8×8 input image, we can add a border of one pixel around the outside of the image. This has the effect of artificially creating a 10×10 input image. When the 3×3 filter is applied, it results in an 8×8 feature map. The added pixel values could have the value zero value that has no effect on the dot product operation when the filter is applied.

```
x, x, x   0, 1, 0
x, 0, 0 . 0, 1, 0 = 0
x, 0, 0   0, 1, 0
```

The addition of pixels to the edge of the image is called padding.
In Keras, this is specified via the “padding” argument on the Conv2D layer, which has the default value of ‘valid‘ (no padding). This means that the filter is applied only to valid ways to the input.
The ‘padding‘ value of ‘same‘ calculates and adds the padding required to the input image (or feature map) to ensure that the output has the same shape as the input.

### Downsample Input With Stride

The filter is moved across the image from left to right, top to bottom, with a one-pixel column change on the horizontal movements, and then a one-pixel row change on the vertical movements.
The amount of movement between applications of the filter to the input image is referred to as the stride, and it is almost always symmetrical in height and width dimensions.
The default stride or strides in two dimensions is (1,1) for the height and the width movement, performed when needed. And this default works well in most cases.

The stride can be changed, which has an effect both on how the filter is applied to the image and, in turn, the size of the resulting feature map.
For example, the stride can be changed to (2,2). This has the effect of moving the filter two pixels right for each horizontal movement of the filter and two pixels down for each vertical movement of the filter when creating the feature map.

We can demonstrate this with an example using the 8×8 image with a vertical line (left) dot product (“.” operator) with the vertical line filter (right) with a stride of two pixels:
```
0, 0, 0   0, 1, 0
0, 0, 0 . 0, 1, 0 = 0
0, 0, 0   0, 1, 0

```

Moved right two pixels:
```
0, 1, 1   0, 1, 0
0, 1, 1 . 0, 1, 0 = 3
0, 1, 1   0, 1, 0
```
Moved right two pixels:
```
1, 0, 0   0, 1, 0
1, 0, 0 . 0, 1, 0 = 0
1, 0, 0   0, 1, 0
```

We can see that there are only three valid applications of the 3×3 filters to the 8×8 input image with a stride of two. This will be the same in the vertical dimension.
This has the effect of applying the filter in such a way that the normal feature map output (6×6) is down-sampled so that the size of each dimension is reduced by half (3×3), resulting in 1/4 the number of pixels (36 pixels down to 9).

And we can also get the height and the width of the output feature map according to the size of the input feature map and stride. For example, if the kernel size is 3×3, and the input feature map is 3×27×21, and the stride is 2, then we can see the output size is (27-3)/2+1 and (21-3)/2+1, which is 13×10. And it is (input_height-kernel_size)/stride+1.


The values of these parameters are described in the table below for our example:

<div align=center><img src="Images/21/7.png" alt="drawing" width="600"/></div>



**gradient.h**
```c++
#ifndef __GRADIENT_H__
#define __GRADIENT_H__

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <ap_fixed.h>

//--------------------------------------------------------------------------
// Compiler Defines
//--------------------------------------------------------------------------
#ifdef HLS_SIM
    #include "config.h"
#endif

//--------------------------------------------------------------------------
// Type Conversions
//--------------------------------------------------------------------------
#ifdef  CSIM_DEBUG
    typedef float fm_t;
    typedef float wt_t;
    typedef float fm_t;
    typedef float mk_t;
    
#else
    typedef ap_fixed<16,2> fm_t;
    typedef ap_fixed<16,2> wt_t;
    typedef ap_fixed<16,2> fm_t;
    typedef ap_int<2>  mk_t; // mask bits
#endif
//--------------------------------------------------------------------------
// Function Declarations
//--------------------------------------------------------------------------

#define IM_SIZE 32

#define IN_BUF_DEPTH 8
#define OUT_BUF_DEPTH 8

#define OUT_BUF_HEIGHT 8
#define OUT_BUF_WIDTH 8
#define IN_BUF_HEIGHT OUT_BUF_HEIGHT + 2
#define IN_BUF_WIDTH OUT_BUF_WIDTH + 2

void tiled_conv(
    fm_t fixp_layer1_ifmap[3][IM_SIZE][IM_SIZE],        // input image
    fm_t fixp_layer2_ifmap[32][IM_SIZE][IM_SIZE],       // output of conv1
    wt_t fixp_conv1_weights[32][3][3][3],
    wt_t fixp_conv1_bias[32]


);
void model_conv(
    fm_t input_feature_map[3][IM_SIZE][IM_SIZE],
    wt_t layer_weights[32][3][3][3],
    wt_t layer_bias[32],
    fm_t output_feature_map[32][32][32]
);



#endif

```

**utils.h**
```c++
#include "gradient.h"

//--------------------------------------------------------------------------
// Function to load input feature map tile block from DRAM to on-chip BRAM.
//--------------------------------------------------------------------------
template <int inp_channel, int inp_height, int inp_width>
void load_input_tile_block_from_DRAM (
    fm_t in_fm_buf[IN_BUF_DEPTH][IN_BUF_HEIGHT][IN_BUF_WIDTH], 
    fm_t in_fm[inp_channel][inp_height][inp_width], 
    int  ti, 
    int  tj, 
    int  d
)
{
    #pragma HLS inline off
    
    int IN_BUF_DEPTH_MUX;
    if (inp_channel < IN_BUF_DEPTH)
        IN_BUF_DEPTH_MUX = inp_channel;
    else
        IN_BUF_DEPTH_MUX = IN_BUF_DEPTH;

    const int depth_offset  =  d * IN_BUF_DEPTH;
    const int height_offset = ti * OUT_BUF_HEIGHT; // OUT_BUF is intended, not a typo. 
    const int width_offset  = tj * OUT_BUF_WIDTH;
        
    INPUT_BUFFER_DEPTH:
    for(int c = 0; c < IN_BUF_DEPTH_MUX; c++)
    {
        INPUT_BUFFER_HEIGHT:
        for(int i = 0; i < IN_BUF_HEIGHT; i++)
        {
            INPUT_BUFFER_WIDTH:
            for(int j = 0; j < IN_BUF_WIDTH; j++)
            {
                // TODO: Handle border features here
		        if ( height_offset+i-1 >= 0 && height_offset+i-1 < inp_height    &&    width_offset + j -1 >=0 && width_offset + j -1 < inp_width )
                {
                    in_fm_buf[c][i][j] = in_fm[depth_offset + c][height_offset + i - 1][width_offset + j - 1];
                }
                else
                    in_fm_buf[c][i][j]  = 0;
            }
        }
    }
}

//--------------------------------------------------------------------------
// Function to load layer parameters (weights and bias) for convolution.
//--------------------------------------------------------------------------
template <int out_channel, int inp_channel>
void load_conv_layer_params_from_DRAM(
    wt_t weight_buf[OUT_BUF_DEPTH][IN_BUF_DEPTH][3][3],
    wt_t bias_buf[OUT_BUF_DEPTH],
    wt_t weights[out_channel][inp_channel][3][3],
    wt_t bias[out_channel],
    int b,
    int d
)
{
    #pragma HLS inline off

    int IN_BUF_DEPTH_MUX;
    if (inp_channel < IN_BUF_DEPTH)
        IN_BUF_DEPTH_MUX = inp_channel;
    else
        IN_BUF_DEPTH_MUX = IN_BUF_DEPTH;

    const int kernel_offset  = b * OUT_BUF_DEPTH;
    const int channel_offset = d * IN_BUF_DEPTH;

    WEIGHT_KERNEL_NUM:
    for(int f = 0; f < OUT_BUF_DEPTH; f++)
    {
        WEIGHT_KERNEL_DEPTH:
        for(int c = 0; c < IN_BUF_DEPTH_MUX; c++)
        {
            WEIGHT_KERNEL_HEIGHT:
            for(int kh = 0; kh < 3; kh++)
	        {
                WEIGHT_KERNEL_WIDTH:
	            for(int kw = 0; kw < 3; kw++)
	            {
	                weight_buf[f][c][kh][kw] = weights[kernel_offset + f][channel_offset + c][kh][kw];
                }
            }
        }
    }
    
    BIAS:
    for(int f = 0; f < OUT_BUF_DEPTH; f++)
    {
        bias_buf[f] = bias[kernel_offset + f];
    }
}


void conv_3x3 (
    fm_t Y_buf[OUT_BUF_DEPTH][OUT_BUF_HEIGHT][OUT_BUF_WIDTH], 
    fm_t X_buf[IN_BUF_DEPTH][IN_BUF_HEIGHT][IN_BUF_WIDTH],
    wt_t W_buf[OUT_BUF_DEPTH][IN_BUF_DEPTH][3][3],
    wt_t bias_buf[OUT_BUF_DEPTH],
    int  d,
    int inp_channel,
    int out_channel
)
{
    if(d==0){ 
        init:
        for(int oh=0; oh<OUT_BUF_HEIGHT; oh++){
            // #pragma HLS pipeline
                
            for(int ow=0; ow<OUT_BUF_WIDTH; ow++){
                // #pragma HLS unroll
        
                for(int oc=0; oc<OUT_BUF_DEPTH; oc++){
                    // #pragma HLS unroll
                    Y_buf[oc][oh][ow]   = bias_buf[oc];
                }
            }
        }
    }

    int IN_BUF_DEPTH_MUX;
    if (inp_channel < IN_BUF_DEPTH)
        IN_BUF_DEPTH_MUX = inp_channel;
    else
        IN_BUF_DEPTH_MUX = IN_BUF_DEPTH;

    int OUT_BUF_DEPTH_MUX;
    if (out_channel < OUT_BUF_DEPTH)
        OUT_BUF_DEPTH_MUX = out_channel;
    else
        OUT_BUF_DEPTH_MUX = OUT_BUF_DEPTH;

    ip_chan:
    for(int ic=0; ic<IN_BUF_DEPTH_MUX; ic++){
        fh:
        for(int fh=0; fh<3; fh++){
            fw:
            for(int fw=0; fw<3; fw++){
                
                op_chan:
                for(int oc=0; oc<OUT_BUF_DEPTH_MUX; oc++){
                    // #pragma HLS pipeline
                    
                    op_h:
                    for(int oh=0; oh<OUT_BUF_HEIGHT; oh++){
                        // #pragma HLS unroll  
                        #pragma HLS pipeline

                        op_w:
                        for(int ow=0; ow<OUT_BUF_WIDTH; ow++){
                            // #pragma HLS unroll
                            Y_buf[oc][oh][ow]   += X_buf[ic][oh+1+fh-1][ow+1+fw-1] * W_buf[oc][ic][fh][fw];
                        }
                    }
                }
            }
        }
    }

}
//--------------------------------------------------------------------------
// Function to store complete output tile block from BRAM to DRAM.
//--------------------------------------------------------------------------
template <int out_channel, int inp_height, int inp_width>
void store_output_tile_to_DRAM (
    fm_t out_fm[out_channel][inp_height][inp_width], 
    fm_t out_fm_buf[OUT_BUF_DEPTH][OUT_BUF_HEIGHT][OUT_BUF_WIDTH], 
    int  ti,
    int  tj,
    int  b,
    bool relu_enable
)
{
    #pragma HLS inline
    const int depth_offset  =  b * OUT_BUF_DEPTH;
    const int height_offset = ti * OUT_BUF_HEIGHT;
    const int width_offset  = tj * OUT_BUF_WIDTH;

    int OUT_BUF_DEPTH_MUX = OUT_BUF_DEPTH;
    
    if(out_channel < OUT_BUF_DEPTH)
        OUT_BUF_DEPTH_MUX = out_channel;


    OUTPUT_BUFFER_DEPTH:
    for(int f = 0; f < OUT_BUF_DEPTH_MUX; f++)
    {
        OUTPUT_BUFFER_HEIGHT:
        for(int i = 0; i < OUT_BUF_HEIGHT; i++)
        {
            OUTPUT_BUFFER_WIDTH:
            for(int j = 0; j < OUT_BUF_WIDTH; j++)
            {
                // ReLU in-place
                if(out_fm_buf[f][i][j] < (fm_t) 0 && relu_enable)
                {
                    out_fm[depth_offset + f][height_offset + i][width_offset + j] = (fm_t) 0;
                }
                else
                {
                    out_fm[depth_offset + f][height_offset + i][width_offset + j] = out_fm_buf[f][i][j];
                }
            }
        }
    }
}

```

**io.h**
```c++
#include "gradient.h"
#include <string>
#include <iostream>
#include <fstream>
#include <cmath>

using namespace std;

template <int inp_channel, int inp_height, int inp_width>
void read_input_feature(float ifmap[inp_channel][inp_height][inp_width]){

    for(int ic=0; ic<inp_channel; ic++){
        for(int ih=0; ih<inp_height; ih++){
            for(int iw=0; iw<inp_width; iw++){
                ifmap[ic][ih][iw] = 1;
            }
        }
    }
}

template <int out_channel, int inp_channel, int k_height, int k_width>
void read_conv_weight(const string& file, float conv_weight[out_channel][inp_channel][k_height][k_width]){
    int size = out_channel*inp_channel*k_height*k_width;
    
    ifstream ifs_conv_input(file, ios::in | ios::binary);
    ifs_conv_input.read((char*)(***conv_weight), size*sizeof(float));
    ifs_conv_input.close();
}

template <int out_channel>
void read_conv_bias(const string& file, float conv_bias[out_channel]){

    ifstream ifs_conv_bias(file, ios::in | ios::binary);
    ifs_conv_bias.read((char*)(conv_bias), out_channel*sizeof(float));
    ifs_conv_bias.close();
}

template <int inp_channel, int inp_height, int inp_width>
void convert_input_3d(
    float conv_feature_map[inp_channel][inp_height][inp_width],
    fm_t fixp_conv_feature_map[inp_channel][inp_height][inp_width]
)
{
    for(int c = 0; c < inp_channel; c++)
        for(int i = 0; i < inp_height; i++)
            for(int j = 0; j < inp_width; j++)
                fixp_conv_feature_map[c][i][j] = (fm_t) conv_feature_map[c][i][j];
}

template <int length>
void convert_input_1d(
    float fc_feature_map[length],
    fm_t fixp_fc_feature_map[length]
)
{
    for(int i=0; i<length; i++){
        fixp_fc_feature_map[i] = (fm_t) fc_feature_map[i];
    }
}

template <int inp_channel, int out_channel>
void convert_conv_layer_params(
    float conv_layer_weights[out_channel][inp_channel][3][3],
    float conv_layer_bias[out_channel],
    wt_t fixp_conv_layer_weights[out_channel][inp_channel][3][3],
    wt_t fixp_conv_layer_bias[out_channel]
)
{
    for(int oc=0; oc<out_channel; oc++){
        fixp_conv_layer_bias[oc] = (wt_t) conv_layer_bias[oc];

        for(int ic=0; ic<inp_channel; ic++){
            for(int kh=0; kh<3; kh++){
                for(int kw=0; kw<3; kw++){
                    fixp_conv_layer_weights[oc][ic][kh][kw] = (wt_t) conv_layer_weights[oc][ic][kh][kw];
                }
            }
        }
    }
}

```

**tile_conv.cpp**
```c++
#include "gradient.h"
#include "utils.h"

// using namespace std;

void tiled_conv(
    fm_t fixp_layer1_ifmap[3][IM_SIZE][IM_SIZE],        // input image
    fm_t fixp_layer2_ifmap[32][IM_SIZE][IM_SIZE],       // output of conv1
    wt_t fixp_conv1_weights[32][3][3][3],
    wt_t fixp_conv1_bias[32]


)
{
    //--------------------------------------------------------------------------
    // Defines interface IO ports for HLS. 
    // You should NOT modify these pragmas.
    //--------------------------------------------------------------------------
    #pragma HLS INTERFACE m_axi depth=3*32*32   port=fixp_layer1_ifmap   bundle=fm
    #pragma HLS INTERFACE m_axi depth=32*32*32  port=fixp_layer2_ifmap   bundle=fm
    #pragma HLS INTERFACE m_axi depth=32*3*3*3    port=fixp_conv1_weights  bundle=wt
    #pragma HLS INTERFACE m_axi depth=32    port=fixp_conv1_bias  bundle=wt
    #pragma HLS INTERFACE s_axilite port=return


    std::cout <<"------------------------------\n";
    std::cout << "Entered tiled_conv function\n" ;

    //--------------------------------------------------------------------------
    // On-chip buffers
    // You should NOT modify the buffer dimensions!
    //--------------------------------------------------------------------------
    fm_t conv_in_buf[IN_BUF_DEPTH][IN_BUF_HEIGHT][IN_BUF_WIDTH];
    wt_t conv_wt_buf[OUT_BUF_DEPTH][IN_BUF_DEPTH][3][3];
    wt_t conv_bias_buf[OUT_BUF_DEPTH];
    fm_t conv_out_buf[OUT_BUF_DEPTH][OUT_BUF_HEIGHT][OUT_BUF_WIDTH];

    fm_t vecB_buf[BLOCK_SIZE_N];
    fm_t vecC_buf[BLOCK_SIZE_M];
    wt_t matA_buf[BLOCK_SIZE_M][BLOCK_SIZE_N];
    wt_t fc_bias_buf[BLOCK_SIZE_M];

    fm_t layer2_ifmap[32][IM_SIZE][IM_SIZE];
    // ------------------------ PRAGMAS ------------------------------ 

     #pragma HLS array_partition variable=conv_out_buf dim=1 complete
     #pragma HLS array_partition variable=conv_wt_buf  dim=1 complete

     #pragma HLS array_partition variable=conv_out_buf dim=2  complete
     #pragma HLS array_partition variable=conv_in_buf  dim=2  complete

    #pragma HLS array_partition variable=conv_out_buf dim=3  complete
    #pragma HLS array_partition variable=conv_in_buf  dim=3  complete

     #pragma HLS array_partition variable=conv_bias_buf  complete

    // #pragma HLS array_partition variable=vecC_buf complete
    // #pragma HLS array_partition variable=matA_buf dim=1 complete

    // ------------------------ LAYERS ------------------------------- 

    std::cout << "----------------FORWARD PASS---------------------\n";

    std::cout << "----------------Layer 1: Conv1---------------------\n";

    fp_conv1:
    for(int ti = 0; ti < IM_SIZE/OUT_BUF_HEIGHT; ti++)
    {
        for(int tj = 0; tj < IM_SIZE/OUT_BUF_WIDTH; tj++)
        {
            std::cout << "Processing Tile " << ti*IM_SIZE/OUT_BUF_WIDTH + tj + 1;
            std::cout << "/" << IM_SIZE/OUT_BUF_HEIGHT * IM_SIZE/OUT_BUF_WIDTH << std::endl;    

            for(int b=0; b<32/OUT_BUF_DEPTH; b++){

                for(int d=0; d<1; d++){

                    load_input_tile_block_from_DRAM <3,IM_SIZE,IM_SIZE>(
                        conv_in_buf,
                        fixp_layer1_ifmap,
                        ti,
                        tj,
                        d
                    );

                    load_conv_layer_params_from_DRAM <32,3> (
                        conv_wt_buf,
                        conv_bias_buf,
                        fixp_conv1_weights,
                        fixp_conv1_bias,
                        b,
                        d
                    );

                    conv_3x3(
                        conv_out_buf,
                        conv_in_buf,
                        conv_wt_buf,
                        conv_bias_buf,
                        d,
                        3,
                        32
                    );
                }

                store_output_tile_to_DRAM <32, IM_SIZE, IM_SIZE> (
                	fixp_layer2_ifmap,
                    conv_out_buf,
                    ti,
                    tj,
                    b,
                    0
                );
            }
        }
    }
   
void model_conv(
    fm_t input_feature_map[3][IM_SIZE][IM_SIZE],
    wt_t layer_weights[32][3][3][3],
    wt_t layer_bias[32],
    fm_t output_feature_map[32][32][32]
)
{
//--------------------------------------------------------------------------
// Performs convolution with padding along with adding bias
// No activation function at the end
//--------------------------------------------------------------------------

    fm_t current_ip;

    for(int oc=0; oc<32; oc++){
        for(int oh=0; oh<IM_SIZE; oh++){
            for(int ow=0; ow<IM_SIZE; ow++){
                for(int ic=0; ic<3; ic++){
                    for(int fh=0; fh<3; fh++){
                        for(int fw=0; fw<3; fw++){

                            // PADDING
                            if( (oh+fh-1) < 0 || \
                                (ow+fw-1) < 0 || \
                                (oh+fh) > 32 || \
                                (ow+fw) > 32){
                                    current_ip = 0;
                                }

                            else{
                                current_ip = input_feature_map[ic][oh+fh-1][ow+fw-1];
                            }

                            // MAC operation
                            if(ic == 0 && fh == 0 && fw == 0)
                                output_feature_map[oc][oh][ow]  =   current_ip * layer_weights[oc][ic][fh][fw] + layer_bias[oc];
                            else
                                output_feature_map[oc][oh][ow]  +=  current_ip * layer_weights[oc][ic][fh][fw];

                        }
                    }
                }
            }
        }
    }

}


}


```
We need to change the ```Uncertainty``` like below:

<div align=center><img src="Images/21/2.png" alt="drawing" width="400"/></div>


The synthesis report is shown below：

<div align=center><img src="Images/21/5.png" alt="drawing" width="1000"/></div>

**sim.cpp**
```c++
//--------------------------------------------------------------------------
// Test bench for your convolution codes.
//
// You should not need to modify this, except for debugging.
//
// Remove any print statements in your submission codes!
//--------------------------------------------------------------------------
#include <iostream>
#include <fstream>
#include <cmath>

#include "gradient.h"
#include "io.h"
#include "cmodel/fp.h"
#include "cmodel/bp_single_class.h"

using namespace std;

//--------------------------------------------------------------------------
// Set up the global variables for all the layers
//--------------------------------------------------------------------------

// float versions for csim

float layer1_ifmap[3][IM_SIZE][IM_SIZE];        // input image

fm_t fixp_layer1_ifmap[3][IM_SIZE][IM_SIZE];        // input image
fm_t fixp_layer2_ifmap[32][IM_SIZE][IM_SIZE];       // output of conv1
                       // output of fc2

// fixed point versions of above variables

float conv1_weights[32][3][3][3];
float conv1_bias[32];


wt_t fixp_conv1_weights[32][3][3][3];
wt_t fixp_conv1_bias[32];


//--------------------------------------------------------------------------
// Read the reference files into test bench arrays
//--------------------------------------------------------------------------

void read_bin_files()
{
    read_input_feature <3,IM_SIZE,IM_SIZE> (layer1_ifmap);

    read_conv_weight <32,3,3,3> ("conv_layer1_weights.bin", conv1_weights);
    read_conv_bias <32> ("conv_layer1_bias.bin", conv1_bias);

}

//--------------------------------------------------------------------------
// Convert the data types of every array element for specified 
// configuration.
//--------------------------------------------------------------------------

void convert_type()
{
    convert_input_3d <3,IM_SIZE,IM_SIZE> (layer1_ifmap, fixp_layer1_ifmap);

    convert_conv_layer_params <3,32> (
        conv1_weights,
        conv1_bias,
        fixp_conv1_weights,
        fixp_conv1_bias
    );


}   


//--------------------------------------------------------------------------
// This is where fun begins.
//--------------------------------------------------------------------------
int main ()
{
    read_bin_files();
    
    convert_type();

    cout << "Beginning HLS tiled-convolution simulation..." << std::endl;
        tiled_conv(
            fixp_layer1_ifmap,
            fixp_layer2_ifmap,
            fixp_conv1_weights,
            fixp_conv1_bias

        );
    cout << "Tiled-convolution simulation complete!\n" << std::endl;

    return 0;
}





```


We can first see the effect of one convolution of the ```tile_conv``` function by implementing it on the PYNQ-Z2 board.

#### Create the Vivado project

The configure block design can use reference materials [here](https://uri-nextlab.github.io/ParallelProgammingLabs/HLS_Labs/Lab1.html). And we need to choose the number of the DMA according to the number of the interface.

<div align=center><img src="Images/21/1.png" alt="drawing" width="1200"/></div>

#### Run synthesis,  Implementation, and generate bitstream

It may show some errors about I/O Ports, please fix them.

#### Download the bitstream file to PYNQ

<div align=center><img src="Images/21/6.png" alt="drawing" width="400"/></div>


```python

from pynq import (allocate, Overlay)
import numpy as np
import pynq
import struct
ol = Overlay('design_1.bit')

top_ip = ol.tiled_conv_0
top_ip.signature

in_buffer = pynq.allocate((3,32,32), np.int16)
w_buffer = pynq.allocate((32,3,3,3), np.int16)
b_buffer = pynq.allocate((32), np.int16)
out_buffer = pynq.allocate((32,32,32), np.int16)
# initialize input

for i in range (3):
    for j in range (32):
        for k in range (32):
            in_buffer[i][j][k]=1

```

```python
#read data from bin file
# Weights
with open("conv_layer1_weights.bin", "rb") as f:
    conv_layer_weights = struct.unpack("{}f".format(32*3*3*3), f.read())

# Bias
with open("conv_layer1_bias.bin", "rb") as f:
    conv_layer_bias = struct.unpack("{}f".format(32), f.read())


```


```python
#define functions that can convert between the fixed-point and float
def to_fixed_point(dst, src, *, width=None, iwidth, signed=True):
    if width is None:
        width = dst.dtype.itemsize * 8

    fwidth = width - iwidth
    epsilon = 1.0 / (2.0 ** fwidth)
    min_ = -1.0 * (2.0 ** (iwidth - 1)) if signed else 0.0
    max_ = (2.0 ** (iwidth - (1 if signed else 0))) - epsilon

    src = np.copy(src)
    src = src.reshape(dst.shape)
    src[src < min_] = min_
    src[src > max_] = max_
    if signed:
        src[src < 0] += (2 ** iwidth)
    dst[:] = np.around(src * (2.0 ** fwidth)).astype(dst.dtype)
    
# Convert fixed-point array back to floating point
# Sample Usage:
# B_float = from_fixed_point(B_fixp, iwidth=3)
def from_fixed_point(src, *, width=None, iwidth, signed=True):
    if width is None:
        width = src.dtype.itemsize * 8

    fwidth = width - iwidth
    src = np.array(src, dtype=np.int64)
    if signed:
        src[src >= (2 ** (width - 1))] -= (2 ** width)
    return src / (2.0 ** fwidth)

#Perform data type conversion
to_fixed_point(w_buffer,conv_layer_weights,iwidth=3)
to_fixed_point(b_buffer,conv_layer_bias,iwidth=3)

```

```python
#start the data transfer process
inptr = in_buffer.physical_address
wptr = w_buffer.physical_address
bptr = b_buffer.physical_address
outptr = out_buffer.physical_address

top_ip.write(0x10, inptr)
top_ip.write(0x1c, outptr)
top_ip.write(0x28, wptr)
top_ip.write(0x34, bptr)

top_ip.write(0x00, 1)
isready = top_ip.read(0x00)


out_float= from_fixed_point(out_buffer,iwidth=3)
print(out_float.shape)
```

```python
#by painting the image we can see the difference between the ideal and output
import matplotlib.pyplot as plt
import numpy as np
plt.imshow(out_float[0])

# Add a descriptive title to the plot
plt.title("Image from conv_tile_output_feature_map.bin")

# Optionally, adjust color scaling if needed
# plt.clim(vmin=0, vmax=255)  # Example: scale values between 0 and 255

# Display the plot
plt.show()

```

We will see the input image:

<div align=center><img src="Images/21/3.png" alt="drawing" width="400"/></div>


And the input   image:
```python
plt.imshow(in_buffer[0])

# Add a descriptive title to the plot
plt.title("Image from conv_tile_input_feature_map.bin")

# Optionally, adjust color scaling if needed
# plt.clim(vmin=0, vmax=255)  # Example: scale values between 0 and 255

# Display the plot
plt.show()

```
<div align=center><img src="Images/21/4.png" alt="drawing" width="400"/></div>


And we can have the second stacked convolutional layers on the basis of the previous one like below:

<div align=center><img src="Images/21/11.png" alt="drawing" width="400"/></div>





**tile_conv.cpp**
```c++
#include "gradient.h"
#include "utils.h"

// using namespace std;

void tiled_conv(
    fm_t fixp_layer1_ifmap[3][IM_SIZE][IM_SIZE],        // input image
    fm_t fixp_layer2_ifmap[32][IM_SIZE][IM_SIZE],       // output of conv1
    wt_t fixp_conv1_weights[32][3][3][3],
    wt_t fixp_conv1_bias[32],
    wt_t fixp_conv2_weights[32][32][3][3],
	wt_t fixp_conv2_bias[32]

)
{
    //--------------------------------------------------------------------------
    // Defines interface IO ports for HLS. 
    // You should NOT modify these pragmas.
    //--------------------------------------------------------------------------
    #pragma HLS INTERFACE m_axi depth=3*32*32   port=fixp_layer1_ifmap   bundle=fm
    #pragma HLS INTERFACE m_axi depth=32*32*32  port=fixp_layer2_ifmap   bundle=fm
    #pragma HLS INTERFACE m_axi depth=32*3*3*3    port=fixp_conv1_weights  bundle=wt
	#pragma HLS INTERFACE m_axi depth=32*32*3*3   port=fixp_conv2_weights  bundle=wt
	#pragma HLS INTERFACE m_axi depth=32    port=fixp_conv2_bias  bundle=wt
    #pragma HLS INTERFACE m_axi depth=32    port=fixp_conv1_bias  bundle=wt
    #pragma HLS INTERFACE s_axilite port=return


    std::cout <<"------------------------------\n";
    std::cout << "Entered tiled_conv function\n" ;

    //--------------------------------------------------------------------------
    // On-chip buffers
    // You should NOT modify the buffer dimensions!
    //--------------------------------------------------------------------------
    fm_t conv_in_buf[IN_BUF_DEPTH][IN_BUF_HEIGHT][IN_BUF_WIDTH];
    wt_t conv_wt_buf[OUT_BUF_DEPTH][IN_BUF_DEPTH][3][3];
    wt_t conv_bias_buf[OUT_BUF_DEPTH];
    fm_t conv_out_buf[OUT_BUF_DEPTH][OUT_BUF_HEIGHT][OUT_BUF_WIDTH];

    fm_t vecB_buf[BLOCK_SIZE_N];
    fm_t vecC_buf[BLOCK_SIZE_M];
    wt_t matA_buf[BLOCK_SIZE_M][BLOCK_SIZE_N];
    wt_t fc_bias_buf[BLOCK_SIZE_M];

    fm_t layer2_ifmap[32][IM_SIZE][IM_SIZE];
    // ------------------------ PRAGMAS ------------------------------ 

     #pragma HLS array_partition variable=conv_out_buf dim=1 complete
     #pragma HLS array_partition variable=conv_wt_buf  dim=1 complete

     #pragma HLS array_partition variable=conv_out_buf dim=2  complete
     #pragma HLS array_partition variable=conv_in_buf  dim=2  complete

    #pragma HLS array_partition variable=conv_out_buf dim=3  complete
    #pragma HLS array_partition variable=conv_in_buf  dim=3  complete

     #pragma HLS array_partition variable=conv_bias_buf  complete

    // #pragma HLS array_partition variable=vecC_buf complete
    // #pragma HLS array_partition variable=matA_buf dim=1 complete

    // ------------------------ LAYERS ------------------------------- 

    std::cout << "----------------FORWARD PASS---------------------\n";

    std::cout << "----------------Layer 1: Conv1---------------------\n";

    fp_conv1:
    for(int ti = 0; ti < IM_SIZE/OUT_BUF_HEIGHT; ti++)
    {
        for(int tj = 0; tj < IM_SIZE/OUT_BUF_WIDTH; tj++)
        {
            std::cout << "Processing Tile " << ti*IM_SIZE/OUT_BUF_WIDTH + tj + 1;
            std::cout << "/" << IM_SIZE/OUT_BUF_HEIGHT * IM_SIZE/OUT_BUF_WIDTH << std::endl;    

            for(int b=0; b<32/OUT_BUF_DEPTH; b++){

                for(int d=0; d<1; d++){

                    load_input_tile_block_from_DRAM <3,IM_SIZE,IM_SIZE>(
                        conv_in_buf,
                        fixp_layer1_ifmap,
                        ti,
                        tj,
                        d
                    );

                    load_conv_layer_params_from_DRAM <32,3> (
                        conv_wt_buf,
                        conv_bias_buf,
                        fixp_conv1_weights,
                        fixp_conv1_bias,
                        b,
                        d
                    );

                    conv_3x3(
                        conv_out_buf,
                        conv_in_buf,
                        conv_wt_buf,
                        conv_bias_buf,
                        d,
                        3,
                        32
                    );
                }

                store_output_tile_to_DRAM <32, IM_SIZE, IM_SIZE> (
                	layer2_ifmap,
                    conv_out_buf,
                    ti,
                    tj,
                    b,
                    0
                );
            }
        }
    }
    std::cout << "----------------Layer 2: Conv2---------------------\n";

        fp_conv2:
        for(int ti = 0; ti < IM_SIZE/OUT_BUF_HEIGHT; ti++)
        {
            for(int tj = 0; tj < IM_SIZE/OUT_BUF_WIDTH; tj++)
            {
                std::cout << "Processing Tile " << ti*IM_SIZE/OUT_BUF_WIDTH + tj + 1;
                std::cout << "/" << IM_SIZE/OUT_BUF_HEIGHT * IM_SIZE/OUT_BUF_WIDTH << std::endl;

                for(int b=0; b<32/OUT_BUF_DEPTH; b++){

                    for(int d=0; d<32/IN_BUF_DEPTH; d++){

                        load_input_tile_block_from_DRAM <32,IM_SIZE,IM_SIZE>(
                            conv_in_buf,
							layer2_ifmap,
                            ti,
                            tj,
                            d
                        );

                        load_conv_layer_params_from_DRAM <32,32> (
                            conv_wt_buf,
                            conv_bias_buf,
                            fixp_conv2_weights,
                            fixp_conv2_bias,
                            b,
                            d
                        );

                        conv_3x3(
                            conv_out_buf,
                            conv_in_buf,
                            conv_wt_buf,
                            conv_bias_buf,
                            d,
                            32,
                            32
                        );
                    }

                    store_output_tile_to_DRAM <32, IM_SIZE, IM_SIZE> (
                    	fixp_layer2_ifmap,
                        conv_out_buf,
                        ti,
                        tj,
                        b,
                        0
                    );
                }
            }
        }


}


```

The synthesis report is shown below:

<div align=center><img src="Images/21/8.png" alt="drawing" width="1000"/></div>


**sim.cpp**

```c++
#include <iostream>
#include <fstream>
#include <cmath>

#include "gradient.h"
#include "io.h"
#include "cmodel/fp.h"
#include "cmodel/bp_single_class.h"

using namespace std;

//--------------------------------------------------------------------------
// Set up the global variables for all the layers
//--------------------------------------------------------------------------

// float versions for csim

float layer1_ifmap[3][IM_SIZE][IM_SIZE];        // input image

fm_t fixp_layer1_ifmap[3][IM_SIZE][IM_SIZE];        // input image
fm_t fixp_layer2_ifmap[32][IM_SIZE][IM_SIZE];       // output of conv1
                       // output of fc2
fm_t fixp_layer3_ifmap[32][IM_SIZE][IM_SIZE]; 
// fixed point versions of above variables

float conv1_weights[32][3][3][3];
float conv1_bias[32];

float conv2_weights[32][32][3][3];
float conv2_bias[32];

wt_t fixp_conv1_weights[32][3][3][3];
wt_t fixp_conv1_bias[32];

wt_t fixp_conv2_weights[32][32][3][3];
wt_t fixp_conv2_bias[32];
//--------------------------------------------------------------------------
// Read the reference files into test bench arrays
//--------------------------------------------------------------------------

void read_bin_files()
{
    read_input_feature <3,IM_SIZE,IM_SIZE> (layer1_ifmap);

    read_conv_weight <32,3,3,3> ("conv_layer1_weights.bin", conv1_weights);
    read_conv_bias <32> ("conv_layer1_bias.bin", conv1_bias);

    read_conv_weight <32,32,3,3> ("conv_layer2_weights.bin", conv2_weights);
    read_conv_bias <32> ("conv_layer2_bias.bin", conv2_bias);

}

//--------------------------------------------------------------------------
// Convert the data types of every array element for specified 
// configuration.
//--------------------------------------------------------------------------

void convert_type()
{
    convert_input_3d <3,IM_SIZE,IM_SIZE> (layer1_ifmap, fixp_layer1_ifmap);

    convert_conv_layer_params <3,32> (
        conv1_weights,
        conv1_bias,
        fixp_conv1_weights,
        fixp_conv1_bias
    );
    convert_conv_layer_params <32,32> (
        conv2_weights,
        conv2_bias,
        fixp_conv2_weights,
        fixp_conv2_bias
    );

}   


//--------------------------------------------------------------------------
// This is where fun begins.
//--------------------------------------------------------------------------
int main ()
{
    read_bin_files();
    
    convert_type();

    model_conv(
        fixp_layer1_ifmap,
        fixp_conv1_weights,
        fixp_conv1_bias,
        fixp_layer3_ifmap
    );

    cout << "Beginning HLS tiled-convolution simulation..." << std::endl;
        tiled_conv(
            fixp_layer1_ifmap,
            fixp_layer2_ifmap,
            fixp_conv1_weights,
            fixp_conv1_bias,
            fixp_conv2_weights,
            fixp_conv2_bias

        );
    cout << "Tiled-convolution simulation complete!\n" << std::endl;
    long double mse = 0.0;
       for(int f = 0; f < 32; f++)
        {
            for(int i = 0; i < 32; i++)
            {
                for(int j = 0; j < 32; j++)
                {
                    mse += std::pow((float(fixp_layer3_ifmap[f][i][j])
                                     -float(fixp_layer2_ifmap[f][i][j])), 2);
                }
            }
        }
       mse = mse / (32 * 32 * 32);

         std::cout << "\nOutput MSE:  " << mse << std::endl;
    return 0;
}

```
#### Create the Vivado project

The configure block design can use reference materials [here](https://uri-nextlab.github.io/ParallelProgammingLabs/HLS_Labs/Lab1.html). And we need to choose the number of the DMA according to the number of the interface.

<div align=center><img src="Images/21/1.png" alt="drawing" width="1200"/></div>

#### Run synthesis,  Implementation, and generate bitstream

It may show some errors about I/O Ports, please fix them.

#### Download the bitstream file to PYNQ

<div align=center><img src="Images/21/9.png" alt="drawing" width="300"/></div>

```python
from pynq import (allocate, Overlay)
import numpy as np
import pynq
import struct
ol = Overlay('design_1.bit')

top_ip = ol.tiled_conv_0
top_ip.signature

in_buffer = pynq.allocate((3,32,32), np.int16)
w_buffer_1 = pynq.allocate((32,3,3,3), np.int16)
b_buffer_1 = pynq.allocate((32), np.int16)
w_buffer_2 = pynq.allocate((32,32,3,3), np.int16)
b_buffer_2 = pynq.allocate((32), np.int16)
out_buffer = pynq.allocate((32,32,32), np.int16)
# initialize input
for i in range (3):
    for j in range (32):
        for k in range (32):
            in_buffer[i][j][k]=1

```

```python
# Weights
with open("conv_layer1_weights.bin", "rb") as f:
    conv_layer_weights_1 = struct.unpack("{}f".format(32*3*3*3), f.read())

# Bias
with open("conv_layer1_bias.bin", "rb") as f:
    conv_layer_bias_1 = struct.unpack("{}f".format(32), f.read())
    # Weights
with open("conv_layer2_weights.bin", "rb") as f:
    conv_layer_weights_2 = struct.unpack("{}f".format(32*32*3*3), f.read())

# Bias
with open("conv_layer2_bias.bin", "rb") as f:
    conv_layer_bias_2 = struct.unpack("{}f".format(32), f.read())
```


```python
def to_fixed_point(dst, src, *, width=None, iwidth, signed=True):
    if width is None:
        width = dst.dtype.itemsize * 8

    fwidth = width - iwidth
    epsilon = 1.0 / (2.0 ** fwidth)
    min_ = -1.0 * (2.0 ** (iwidth - 1)) if signed else 0.0
    max_ = (2.0 ** (iwidth - (1 if signed else 0))) - epsilon

    src = np.copy(src)
    src = src.reshape(dst.shape)
    src[src < min_] = min_
    src[src > max_] = max_
    if signed:
        src[src < 0] += (2 ** iwidth)
    dst[:] = np.around(src * (2.0 ** fwidth)).astype(dst.dtype)
    
# Convert fixed-point array back to floating point
# Sample Usage:
# B_float = from_fixed_point(B_fixp, iwidth=3)
def from_fixed_point(src, *, width=None, iwidth, signed=True):
    if width is None:
        width = src.dtype.itemsize * 8

    fwidth = width - iwidth
    src = np.array(src, dtype=np.int64)
    if signed:
        src[src >= (2 ** (width - 1))] -= (2 ** width)
    return src / (2.0 ** fwidth)

to_fixed_point(w_buffer_1,conv_layer_weights_1,iwidth=3)
to_fixed_point(b_buffer_1,conv_layer_bias_1,iwidth=3)
to_fixed_point(w_buffer_2,conv_layer_weights_2,iwidth=3)
to_fixed_point(b_buffer_2,conv_layer_bias_2,iwidth=3)
```

```python

inptr = in_buffer.physical_address
wptr1 = w_buffer_1.physical_address
bptr1 = b_buffer_1.physical_address
wptr2 = w_buffer_2.physical_address
bptr2 = b_buffer_2.physical_address
outptr = out_buffer.physical_address


top_ip.write(0x10, inptr)
top_ip.write(0x1c, outptr)
top_ip.write(0x28, wptr1)
top_ip.write(0x34, bptr1)
top_ip.write(0x40, wptr2)
top_ip.write(0x4c, bptr2)

top_ip.write(0x00, 1)
isready = top_ip.read(0x00)
```

```python
import matplotlib.pyplot as plt
import numpy as np
plt.imshow(out_float[0])

# Add a descriptive title to the plot
plt.title("Image from conv_tile_output_feature_map.bin")

# Optionally, adjust color scaling if needed
# plt.clim(vmin=0, vmax=255)  # Example: scale values between 0 and 255

# Display the plot
plt.show()

```

We can see the image like below:

<div align=center><img src="Images/21/10.png" alt="drawing" width="400"/></div>

We can also see the input image:

```python
plt.imshow(in_buffer[0])

# Add a descriptive title to the plot
plt.title("Image from conv_tile_input_feature_map.bin")

# Optionally, adjust color scaling if needed
# plt.clim(vmin=0, vmax=255)  # Example: scale values between 0 and 255

# Display the plot
plt.show()

```

<div align=center><img src="Images/21/4.png" alt="drawing" width="400"/></div>
