//
//  RightFlowLayout.h
//  RightLayout
//
//  Created by hongweilong on 2017/9/27.
//  Copyright © 2017年 hongweilong. All rights reserved.
//

#import <UIKit/UIKit.h>

// 从左边合适的位置 尽量铺满右边
@interface RightLayout : UICollectionViewFlowLayout

+ (instancetype)flowLayoutWithItemSize:(CGSize)itemSize
                          sectionInset:(UIEdgeInsets)sectionInset
              minimumInterItemSpaceing:(CGFloat)minimumInterItemSpaceing;

@end
