# Meeting Dec. 2



## RF-Diffusion

| model |      dataset      |  FID   |  SSIM  |
| :---: | :---------------: | :----: | :----: |
|  DiT  | Widar3.0/20181128 | 0.2225 | 0.8816 |
|  DiT  |     Widar3.0      | 0.2351 | 0.7249 |
|  HDT  | Widar3.0/20181128 | 0.2586 | 0.6267 |

- HDT训练参数设置



## RF-Diffusion with Distance

将distance代替receiver id作为condition

|      dataset      |  condition  |  FID   |  SSIM  |
| :---------------: | :---------: | :----: | :----: |
| Widar3.0/20181128 | receiver ID | 0.1922 | 0.7716 |
| Widar3.0/20181128 |  distance   | 0.3548 | 0.9332 |
| Widar3.0/20181208 | receiver ID | 0.2310 | 0.7649 |
| Widar3.0/20181208 |  distance   | 0.2087 | 0.7427 |



### Method - Online data augementation

在加载数据时，对每一个数据进行随机变换：随机采样距离$d'$，计算对应的信号强度，对CSI数据进行放缩
$$
\text{CSI:}\quad |H'| = |H|(\frac{d}{d'})^\gamma
$$
🤔 数据standardization导致CSI放缩没有效果 => 其他normalization

不进行数据增强，仅修改normalization的结果：

|      dataset      |      norm       |  FID   |  SSIM  |
| :---------------: | :-------------: | :----: | :----: |
| Widar3.0/20181128 | standardization | 0.1922 | 0.7716 |
| Widar3.0/20181128 |      None       | 0.1385 | 0.6444 |
| Widar3.0/20181128 |     min-max     | 3.8488 | 0.5255 |

进行数据增强，不使用normalization，训练不收敛



### Method - Offline data augementation

提前对数据进行增强处理，信号强度为多个reference信号强度的加权平均
$$
\text{CSI:}\quad |H'| = |H|(\frac{d}{d'})^\gamma
$$

$$
H^\prime = \sum_{i=1}^m w_iH^\prime_i
$$

🤔 数据包长度 => 截断

|      dataset      |       condition       |  FID   |  SSIM  |
| :---------------: | :-------------------: | :----: | :----: |
| Widar3.0/20181128 |      receiver ID      | 0.1922 | 0.7716 |
| Widar3.0/20181128 |       distance        | 0.3548 | 0.9332 |
| Widar3.0/20181128 | distance+augmentation | 0.4724 | 0.8124 |
| Widar3.0/20181208 |      receiver ID      | 0.2310 | 0.7649 |
| Widar3.0/20181208 |       distance        | 0.2087 | 0.7427 |
| Widar3.0/20181208 | distance+augmentation | 0.3136 | 0.7532 |



## TODO

- offline data augmentation with distance on Widar3.0
- conditional inference