# Meeting Nov. 24



## MAESTRA

**Deep Learning Accelerator**

<img src="../assets/images/image-20231121104357210.png" alt="image-20231121104357210" style="zoom:67%;" />

**MAESTRO**

![image-20231119202029918](../assets/images/image-20231119202029918.png)

*receives* the DNN model description, hardware resources information, and mapping

*analyzes* various forms of data reuse in an accelerator based on inputs quickly and generates more than 20 statistics including total latency, energy, throughput, etc., as outputs

**Hardware**

<img src="../assets/images/image-20231119203220956.png" alt="image-20231119203220956" style="zoom:67%;" />

**Analysis Framework**

![image-20231121153652729](../assets/images/image-20231121153652729.png)



## Flexagon

**PSRAM**

* storing the psums
  * this structure stores blocks of elements (coordinate, value)
* sets corresponding to different rows
* each set into blocks for different K dimension within a row
* Each block has a valid bit

![image-20231123152925766](../assets/images/image-20231123152925766.png)

* PartialWrite(row, k, E)
* Consume(row, k)
* Write(offset, E)