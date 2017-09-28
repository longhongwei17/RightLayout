//
//  RightFlowLayout.m
//  RightLayout
//
//  Created by hongweilong on 2017/9/27.
//  Copyright © 2017年 hongweilong. All rights reserved.
//

#import "RightLayout.h"

#define MainSize [UIScreen mainScreen].bounds.size
@interface RightLayout()

@property (nonatomic, strong) NSMutableArray<UICollectionViewLayoutAttributes *> *attributesList;

@property (nonatomic, assign) NSInteger counter;

@end

@implementation RightLayout

+ (instancetype)flowLayoutWithItemSize:(CGSize)itemSize
                          sectionInset:(UIEdgeInsets)sectionInset
              minimumInterItemSpaceing:(CGFloat)minimumInterItemSpaceing
{
    RightLayout *layout = [[RightLayout alloc] init];
    layout.itemSize = itemSize;
    layout.sectionInset = sectionInset;
    layout.minimumInteritemSpacing = minimumInterItemSpaceing;
    return layout;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    self.sectionInset = UIEdgeInsetsZero;
    self.itemSize = CGSizeMake(75, 75);
    self.minimumInteritemSpacing = 10;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

- (void)prepareLayout
{
    [super prepareLayout];
    
    self.counter = [self.collectionView numberOfItemsInSection:0];
    
    self.attributesList = [NSMutableArray array];
    for (NSInteger index = 0; index != self.counter; index ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
        UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attributesList addObject:attribute];
    }
}

- (CGSize)collectionViewContentSize
{
    CGFloat contentViewSizeWidth = self.itemSize.width * self.counter + self.minimumInteritemSpacing * (self.counter - 1);
    return CGSizeMake(contentViewSizeWidth, self.itemSize.height);
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attributesList.copy;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attribute = [super layoutAttributesForItemAtIndexPath:indexPath];
    
    CGFloat uicollectionViewWidth = self.collectionView.frame.size.width;
    CGFloat contentSizeWidth = [self collectionViewContentSize].width;
    CGFloat beginX ;
    if (uicollectionViewWidth > contentSizeWidth) {
        beginX = uicollectionViewWidth - contentSizeWidth;
    } else {
        beginX = 0.f;
    }
    attribute.frame = CGRectMake(beginX + (self.itemSize.width + self.minimumInteritemSpacing) * indexPath.item, 0, self.itemSize.width, self.itemSize.height);
    return attribute;
}


@end
