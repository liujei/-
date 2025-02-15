//
//  UPADShowViewController.h
//  UpArpuSDKDemo
//
//  Created by Martin Lau on 17/04/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString *const kMPPlacement;
extern NSString *const kInmobiPlacement;
extern NSString *const kFacebookPlacement;
extern NSString *const kAdMobPlacement;
extern NSString *const kApplovinPlacement;
extern NSString *const kFlurryPlacement;
extern NSString *const kMopubPlacementName;
extern NSString *const kMopubVideoPlacementName;
extern NSString *const kMintegralPlacement;
extern NSString *const kGDTPlacement;
extern NSString *const kGDTTemplatePlacement;
extern NSString *const kYeahmobiPlacement;
extern NSString *const kAppnextPlacement;
extern NSString *const kTTFeedPlacementName;
extern NSString *const kTTDrawPlacementName;
extern NSString *const kAllPlacementName;
extern NSString *const kNendPlacement;
extern NSString *const kBaiduPlacement;
extern NSString *const kNendVideoPlacement;
extern NSString *const kMaioPlacement;
extern NSString *const kHeaderBiddingPlacement;
extern NSString *const kSigmobPlacement;
@interface UPADShowViewController : UIViewController
-(instancetype) initWithPlacementName:(NSString*)name;
+(NSDictionary<NSString*, NSString*>*)nativePlacementIDs;
@end
