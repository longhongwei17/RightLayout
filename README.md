## RightLayout
- 一种尽量先铺满右边的布局 譬如UICollectionView占满整个屏幕 内容只有一个Cell 或者2个cell (ConentSize < frame.size) 这时候RightLayout 会尽量满足右边铺满 。当conentSize>frame.size 和正常的布局一样。
- 手动引起的 直接拖RightLayout.h RightLayout.m 就好 
- pod引进的话可以使用 pod 'RightLayout'。
