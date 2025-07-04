# Meeting Nov. 11



## RF-Diffusion

### CSI data 

- Widar3.0 **id-a-b-c-d-Rx**.dat: '**id**': user's id; '**a**': gesture type, '**b**': torso location, '**c**': face orientation, *'**d**': repetition number,* '**Rx**': Wi-Fi receiver id, (room id)
- `[N, S*A]`: `S=30 A=3`

**test result on pre-trained model**

- `CSI/20181128/user6`
  - FID value: 26.18
    Average SSIM: 0.00244
- `CSI/20181109/user1`
  - FID value: 21.21
    Average SSIM: 0.00304

🤔️ cross-domain evaluation

🤔️ data preprocessing

each sample within the input sequence is normalized by average signal power `[N, S*A]`

==**TODO**==: train on Widar3.0 datasets



### Hierarchical Diffusion Transformer

<img src="../assets/images/image-20241111154453937.png" alt="image-20241111154453937" style="zoom:67%;" />

pre-trained model: DiT

==**TODO**==: use HDT on Widar3.0

CUDA OOM

- `batch_size = 32 -> 1`
- `sample_rate = 512 -> 64`



## Widar3.0

<img src="../assets/images/image-20241018164940239.png" alt="image-20241018164940239" style="zoom:50%;" />

| Rx id |  x   |  y   | Distance |
| :---: | :--: | :--: | :------: |
|   1   | 0.5  | 0.5  |  0.7071  |
|   4   | 0.5  | 0.5  |  0.7071  |
|   2   | 1.4  | 0.5  |  1.4866  |
|   5   | 1.4  | 0.5  |  1.4866  |
|   3   |  2   |  0   |  2.0000  |
|   6   |  0   |  2   |  2.0000  |

**distance sample**

- 距离d 正态分布 $\mathcal{N}(\mu, \sigma)$
- x y距离均匀分布 $\mathcal{U}(0, x)$,  $\mathcal{U}(0, y)$
- x y距离正态分布$\mathcal{N}(\mu, \sigma)$

距离采样 ratio of synthetic data volumn： $+0\% ~ +200\%$



**CSI data augmentation**
$$
[dB]: P_r-P_r' = 10 \gamma \lg(\frac{d'}{d}) - \epsilon
$$
生成数据$d'$，选取$d$作为参考：

- 选择最相近的$d$作为参考
- 选择三个$d$作为参考，取平均
- **加权** 均匀

==**TODO**==: data augmentation on Widar3.0



## TODO

- train on widar datasets
- use HDT on Widar3.0
- data augmentation on Widar3.0