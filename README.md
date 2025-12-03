# robosys2025 数字を見やすく
![test](https://github.com/MisonoToma/robosys2025/actions/workflows/test.yml/badge.svg)
ロボットシステム学課題1

## 内容

- 1000000などの長い数字を見やすくするために数字を打ち込んだ時に日本語で単位を表す.(例:入力を10000→ 出力が1万)

## インストールとコンパイルと実行方法

```bash
$ https://github.com/MisonoToma/robosys2025.git
$ cd robosys2025
$ gcc robosys1.c -o robosys1
$ echo 10000 | ./robosys1
```
＊これは入力が10000のときの場合です. 入力する値は1億未満で小数や負の値はなしでお願いします.

## 使用環境

- Ubuntu-24.04 LTS

## 必要なソフトウェア

- C言語
- バージョン: 13.3.0

## ライセンス

- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます.
- このパッケージのコードは、下記のスライド(CC-BY-SA 4.0 by Ryuichi Ueda) のものを、本人の許可を得て自身の著作としたものです.
    - [ryuichiueda/my_slides robosys_2025 ](https://github.com/ryuichiueda/my_slides/tree/master/robosys_2025)
- © 2025 Toma Misono

## 参考文献

- https://ryuichiueda.github.io/slides_marp/robosys2025/lesson5.html
- https://ryuichiueda.github.io/slides_marp/robosys2025/lesson6.html
- https://ryuichiueda.giyhub.io/slides_marp/robosys2025/lesson7.html
