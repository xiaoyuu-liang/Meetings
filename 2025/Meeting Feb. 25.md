# Meeting Feb. 25



## Noise Schedule 

$$
x_t &= \bar \gamma_tx_0+\bar\sigma_t\epsilon\\
$$

- simple cos
  $$
  \beta_t = \left(1 + \cos\left(\frac{t \cdot \pi}{T}\right)\right)
  $$

- tanh
  $$
  \beta=1+\tanh(2-t)
  $$

- power
  $$
  \beta_t=1-t^2
  $$

- lin
  $$
  \beta_t =\frac{t}{T}
  $$

- standard cos
  $$
  \bar \alpha_t=\frac{f(t)}{f(0)}， f(t) = \cos(\frac{t/T+s}{1+s}\cdot \frac{\pi}{2})^2\\
  \beta_t = 1-\frac{\bar \alpha_t}{\bar \alpha_{t-1}}
  $$
  ![image-20250115143957796](../assets/images/image-20250115143957796.png)

|   schedule   |  SSIM  |  FID   | Spec SSIM |
| :----------: | :----: | :----: | :-------: |
|  simple cos  | 0.7935 | 0.0503 |  0.8183   |
|     tanh     | 0.7335 | 0.0797 |  0.7787   |
|    power     | 0.6969 | 0.0546 |  0.7544   |
|     lin      | 0.7028 | 0.2071 |  0.7208   |
| standard cos | 0.6596 | 0.2973 |  0.6775   |



- **ACM MM**

  ddl: 4.12

- **AAAI**





## TODO

- 理论分析
- 实验
  - RF data
    - WiFi
    - FMCW
  - audio
  - image