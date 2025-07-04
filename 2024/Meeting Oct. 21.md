# Meeting Oct. 21



## RF-Diffusion Demo

**pre-trained model result**

FID value: 7.83
Average SSIM: 0.81

> the pre-trained model was trained on Widar3.0



**CSI dat => CSI mat with condition**

- demo data: `(N, S*A) = (N, 90)`

  - `user3-1-1-5-8-r5.mat`

    `cond = [1, 1, 1, 5, 5, 3]`

- CSI data `CSI/20181128.zip`

  - Widar3.0 **id-a-b-c-d-Rx**.dat: '**id**': user's id; '**a**': gesture type, '**b**': torso location, '**c**': face orientation, *'**d**': repetition number,* '**Rx**': Wi-Fi receiver id, (room id)

  - `(N, S, A, L)`

  - $S = 30$ indicates the number of subcarriers

  - $A$ indicates the number of antenna pairs 🤔️

    - RF-Diffusion: 1Tx, 3Rx

    - Widar3.0: 1Tx, 6Rx
  
  <img src="../assets/images/image-20241018164940239.png" alt="image-20241018164940239" style="zoom:50%;" />



**pre-trained model on test sample**

convert CST.dat to mat using *csiread.get_scaled_csi()*

- `nrxnum = 3`
  - FID value: 13.30
    Average SSIM: 0.00244

`get_scaled_csi()`通过接收信号的强度（RSSI）、噪声水平、量化误差等因素，对 CSI 数据进行缩放和标准化



**train model on Widar3.0 samples**

- `nrxnum = 6`
  - FID value: 2.75
    Average SSIM: 0.47
  - <img src="../assets/images/image-20241021112926056.png" alt="image-20241021112926056" style="zoom: 67%;" />



### TODO

- read and convert CSI data

- 'd' as data condition

  - Tx-Rx 直线距离作为d，代替Rx作为cond生成

    - `cond = [1, 1, 1, 5, 5, 3]`
  
  - 变换d，根据经验计算，得到新的data sample，扩充diffusion训练数据集
    $$
    P_r = P_t+G_t+G_r+20\lg(\frac{\lambda}{4\pi d_0})+10\gamma\lg(\frac{d_0}{d})-\psi^{[\text{dB}]}
    $$
  
    $$
    [dB]: P_r-P_r' = 10 \gamma \lg(\frac{d'}{d}) - \epsilon
    $$
  
    🤔️ $P_r$  & `csi` & `rssi`



## Supplement

### [csiread](https://github.com/citysu/csiread/tree/master)

```python
def get_scaled_csi(self):
        """Converts CSI to channel matrix H"""
        csi = self.csi
        csi_sq = (csi * csi.conj()).real
        csi_pwr = np.sum(csi_sq, axis=(1, 2, 3))
        rssi_pwr = self.__dbinv(self.get_total_rss())

        scale = rssi_pwr / (csi_pwr / 30)

        noise_db = self.noise
        thermal_noise_pwr = self.__dbinv(noise_db)
        thermal_noise_pwr[noise_db == -127] = self.__dbinv(-92)

        quant_error_pwr = scale * (self.Nrx * self.Ntx)
        total_noise_pwr = thermal_noise_pwr + quant_error_pwr

        ret = self.csi * np.sqrt(scale / total_noise_pwr).reshape(-1, 1, 1, 1)
        ret[self.Ntx == 2] *= np.sqrt(2)
        ret[self.Ntx == 3] *= np.sqrt(self.__dbinv(4.5))
        return ret

```

### [CSI Tool](https://dhalperi.github.io/linux-80211n-csitool/)

**Intel 5300 NIC**

