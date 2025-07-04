# Meeting Nov. 22



## CNN on GPU

**convolution strategies**

* direct convolution

  * 7 loop-nest

* unrolling based convolution ‼️

  * im2col
    $$
    Conv_{flops} = 2N_f\times S_f^2 N_c \times W_o H_o
    $$
    ![image-20231122105019412](../assets/images/image-20231122105019412.png)

  * GPU MM kernels

    ![image-20231122151501018](../assets/images/image-20231122151501018.png)

* FFT based convolution

  * a discrete convolution in the spatial domain can be converted into the product of the Fourier domain

**hot spot layer**

Conv

**performance prediction**

a gray box *per layer* approach where modeling is performed layer by layer and the only explanatory variable is computational complexity

![image-20231122122022975](../assets/images/image-20231122122022975.png)

线性模型

![image-20231122122400118](../assets/images/image-20231122122400118.png)

将计算复杂度作为输入，运行时间作为输出，构造线性回归模型，实验收集数据得到预测回归线



## CNN on DNN Accelerator

<img src="../assets/images/image-20231121104357210.png" alt="image-20231121104357210" style="zoom:67%;" />

**MAESTRO** (**M**odeling **A**ccelerator **E**fficiency via **S**patio-**T**emporal **R**esource **O**ccupancy)

![image-20231119202029918](../assets/images/image-20231119202029918.png)

💡 data-centric：将CNN layer的操作描述为PE上的dataflow（包括schedual/tiling/mapping），通过dataflow分析data reuse









