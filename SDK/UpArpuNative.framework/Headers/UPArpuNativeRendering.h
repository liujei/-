//
//  UPArpuNativeRendering.h
//  UpArpuSDK
//
//  Created by Martin Lau on 09/04/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#ifndef UPArpuNativeRendering_h
#define UPArpuNativeRendering_h
#import <UIKit/UIKit.h>
@protocol UPArpuNativeRendering<NSObject>
@optional
/**
 * Return the UILabel that your view is using for the advertiser name.
 */
-(UILabel*)advertiserLabel;
/**
 * Return the UILabel that your view is using for the main text.
 *
 * @return a UILabel that is used for the main text.
 */
-(UILabel*)textLabel;

/**
 * Return the UILabel that your view is using for the title text.
 *
 * @return a UILabel that is used for the title text.
 */
-(UILabel*)titleLabel;

/**
 * Return a label for showing cta text.
 */
-(UILabel*)ctaLabel;

/**
 * Return a label for showing the rating text.
 */
-(UILabel*)ratingLabel;

/**
 * Return the UIImageView that your view is using for the icon image.
 *
 * @return a UIImageView that is used for the icon image.
 */
-(UIImageView*)iconImageView;

/**
 * Return the UIImageView that your view is using for the main image.
 *
 * @return a UIImageView that is used for the main image.
 */
-(UIImageView*)mainImageView;

/**
 *Return the UIImageView that your view is using for the sponsor image.
 */
-(UIImageView*)sponsorImageView;

/**
 * This is the view provided by third-pary network to render it's ad offer.
 *
 */
-(UIView*)mediaView;
@end

#endif /* UPArpuNativeRendering_h */
