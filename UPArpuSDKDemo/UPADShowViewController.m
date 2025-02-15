//
//  UPADShowViewController.m
//  UpArpuSDKDemo
//
//  Created by Martin Lau on 17/04/2018.
//  Copyright © 2018 Martin Lau. All rights reserved.
//

#import "UPADShowViewController.h"
#import "MTAutolayoutCategories.h"
@import UpArpuSDK;
#ifdef NATIVE_INTEGRATED
@import UpArpuNative;
#endif
NSString *const kMPPlacement = @"MobPower";
NSString *const kInmobiPlacement = @"Inmobi";
NSString *const kFacebookPlacement = @"Facebook";
NSString *const kAdMobPlacement = @"AdMob";
NSString *const kApplovinPlacement = @"Applovin";
NSString *const kFlurryPlacement = @"Flurry";
NSString *const kMintegralPlacement = @"Mintegral";
NSString *const kMopubPlacementName = @"Mopub";
NSString *const kMopubVideoPlacementName = @"Mopub Video Placement";
NSString *const kGDTPlacement = @"GDT";
NSString *const kGDTTemplatePlacement = @"GDT(Template)";
NSString *const kYeahmobiPlacement = @"Yeahmobi";
NSString *const kAppnextPlacement = @"Appnext";
NSString *const kTTFeedPlacementName = @"TT(Feed)";
NSString *const kTTDrawPlacementName = @"TT(Draw)";
NSString *const kAllPlacementName = @"All";
NSString *const kNendVideoPlacement = @"Nend(Video)";
NSString *const kSigmobPlacement = @"Sigmob";


static NSString *const kMintegralHeaderBiddingPlacementID = @"b5d1333d023691";
static NSString *const kPlacement0ID = @"b5ad9ba61dcb39";
static NSString *const kInmobiPlacementID = @"b5b0f553483724";
static NSString *const kMintegralPlacementID = @"b5b0f555698607";
static NSString *const kFacebookPlacementID = @"b5b0f551340ea9";
static NSString *const kAdMobPlacementID = @"b5b0f55228375a";
static NSString *const kApplovinPlacementID = @"b5b0f554ec9c4e";
static NSString *const kFlurryPlacementID = @"b5b0f554166ad1";
static NSString *const kMopubPlacementID = @"b5b0f55624527a";
static NSString *const kGDTPlacementID = @"b5bacac5f73476";
static NSString *const kGDTTemplatePlacementID = @"b5bacac780e03b";
static NSString *const kMopubVideoPlacementID = @"b5afbe325b1303";
static NSString *const kYeahmobiPlacementID = @"b5bc7fb1d0b02f";
static NSString *const kAppnextPlacementID = @"b5bc7fb2787f1e";
static NSString *const kMPPlacementID = @"b5c2084d12aca4";
static NSString *const kTTFeedPlacementID = @"b5c2c6d50e7f44";
static NSString *const kTTDrawPlacementID = @"b5c2c6d62b9d65";
static NSString *const kAllPlacementID = @"b5b0f5663c6e4a";
static NSString *const kNendPlacementID = @"b5cb96d44c0c5f";
static NSString *const kNendVideoPlacementID = @"b5cb96d5291e93";
static NSString *const kBaiduPlacementID = @"b5d36c4ad68a26";

#ifdef NATIVE_INTEGRATED
@interface DMADView:UPArpuNativeADView
@property(nonatomic, readonly) UILabel *advertiserLabel;
@property(nonatomic, readonly) UILabel *textLabel;
@property(nonatomic, readonly) UILabel *titleLabel;
@property(nonatomic, readonly) UILabel *ctaLabel;
@property(nonatomic, readonly) UILabel *ratingLabel;
@property(nonatomic, readonly) UIImageView *iconImageView;
@property(nonatomic, readonly) UIImageView *mainImageView;
@property(nonatomic, readonly) UIImageView *sponsorImageView;
@end

@implementation DMADView
-(void) initSubviews {
    [super initSubviews];
    _advertiserLabel = [UILabel autolayoutLabelFont:[UIFont boldSystemFontOfSize:15.0f] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft];
    [self addSubview:_advertiserLabel];
    
    _titleLabel = [UILabel autolayoutLabelFont:[UIFont boldSystemFontOfSize:18.0f] textColor:[UIColor blackColor] textAlignment:NSTextAlignmentLeft];
    [self addSubview:_titleLabel];
    
    _textLabel = [UILabel autolayoutLabelFont:[UIFont systemFontOfSize:15.0f] textColor:[UIColor blackColor]];
    [self addSubview:_textLabel];
    
    _ctaLabel = [UILabel autolayoutLabelFont:[UIFont systemFontOfSize:15.0f] textColor:[UIColor blackColor]];
    [self addSubview:_ctaLabel];
    
    _ratingLabel = [UILabel autolayoutLabelFont:[UIFont systemFontOfSize:15.0f] textColor:[UIColor blackColor]];
    [self addSubview:_ratingLabel];
    
    _iconImageView = [UIImageView autolayoutView];
    _iconImageView.layer.cornerRadius = 4.0f;
    _iconImageView.layer.masksToBounds = YES;
    _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_iconImageView];
    
    _mainImageView = [UIImageView autolayoutView];
    _mainImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_mainImageView];
    
    _sponsorImageView = [UIImageView autolayoutView];
    _sponsorImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_sponsorImageView];
}

-(NSArray<UIView*>*)clickableViews {
    NSMutableArray<UIView*> *clickableViews = [NSMutableArray<UIView*> arrayWithObjects:_iconImageView, _ctaLabel, nil];
    if (self.mediaView != nil) { [clickableViews addObject:self.mediaView]; }
    return clickableViews;
}

-(void) layoutMediaView {
    self.mediaView.frame = CGRectMake(0, 120.0f, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) - 120.0f);
}

-(void) makeConstraintsForSubviews {
    [super makeConstraintsForSubviews];
    NSDictionary *viewsDict = nil;
    if (self.mediaView != nil) {
        viewsDict = @{@"titleLabel":self.titleLabel, @"textLabel":self.textLabel, @"ctaLabel":self.ctaLabel, @"ratingLabel":self.ratingLabel, @"iconImageView":self.iconImageView, @"mainImageView":self.mainImageView, @"mediaView":self.mediaView, @"advertiserLabel":self.advertiserLabel, @"sponsorImageView":self.sponsorImageView};
    } else {
        viewsDict = @{@"titleLabel":self.titleLabel, @"textLabel":self.textLabel, @"ctaLabel":self.ctaLabel, @"ratingLabel":self.ratingLabel, @"iconImageView":self.iconImageView, @"mainImageView":self.mainImageView, @"advertiserLabel":self.advertiserLabel, @"sponsorImageView":self.sponsorImageView};
    }
    [self addConstraintsWithVisualFormat:@"|[mainImageView]|" options:0 metrics:nil views:viewsDict];
    [self addConstraintsWithVisualFormat:@"V:[iconImageView][mainImageView]|" options:0 metrics:nil views:viewsDict];
    
    [self addConstraintWithItem:self.iconImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.iconImageView attribute:NSLayoutAttributeHeight multiplier:1.0f constant:.0f];
    
    [self.titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [self addConstraintsWithVisualFormat:@"|-15-[iconImageView(90)]-8-[titleLabel]-8-[sponsorImageView]-15-|" options:NSLayoutFormatAlignAllTop metrics:nil views:viewsDict];
    [self addConstraintsWithVisualFormat:@"V:|-15-[titleLabel]-8-[textLabel]-8-[ctaLabel]-8-[ratingLabel]-8-[advertiserLabel]" options:NSLayoutFormatAlignAllLeading | NSLayoutFormatAlignAllTrailing metrics:nil views:viewsDict];
}
@end
#endif

#ifdef NATIVE_INTEGRATED
@interface UPADShowViewController()<UPArpuNativeADDelegate>
#else
@interface UPADShowViewController()
#endif
@property(nonatomic, readonly) NSDictionary *placementIDs;
@property(nonatomic, readonly) NSString *name;
@property(nonatomic, readonly) UIActivityIndicatorView *loadingView;
@property(nonatomic, readonly) UIButton *reloadADButton;
@property(nonatomic, readonly) UIButton *clearAdButton;
@property(nonatomic, readonly) UIButton *showAdButton;
@property(nonatomic, readonly) UILabel *failureTipsLabel;
@property(nonatomic, readonly) UIButton *removeAdButton;
@end
@implementation UPADShowViewController
#ifdef NATIVE_INTEGRATED
-(instancetype) initWithPlacementName:(NSString*)name {
    self = [super initWithNibName:nil bundle:nil];
    if (self != nil) {
        _name = name;
        _placementIDs = [UPADShowViewController nativePlacementIDs];
    }
    return self;
}

+(NSDictionary<NSString*, NSString*>*)nativePlacementIDs {
    return @{
             kMPPlacement:kMPPlacementID,
             kMintegralPlacement:kMintegralPlacementID,
             kHeaderBiddingPlacement:kMintegralHeaderBiddingPlacementID,
             kAllPlacementName:kAllPlacementID,
             kInmobiPlacement:kInmobiPlacementID,
             kFacebookPlacement:kFacebookPlacementID,
             kAdMobPlacement:kAdMobPlacementID,
             kMopubPlacementName:kMopubPlacementID,
             kMopubVideoPlacementName:kMopubVideoPlacementID,
             kApplovinPlacement:kApplovinPlacementID,
             kFlurryPlacement:kFlurryPlacementID,
             kGDTPlacement:kGDTPlacementID,
             kGDTTemplatePlacement:kGDTTemplatePlacementID,
             kYeahmobiPlacement:kYeahmobiPlacementID,
             kAppnextPlacement:kAppnextPlacementID,
             kTTFeedPlacementName:kTTFeedPlacementID,
             kTTDrawPlacementName:kTTDrawPlacementID,
             kNendPlacement:kNendPlacementID,
             kNendVideoPlacement:kNendVideoPlacementID,
             kBaiduPlacement:kBaiduPlacementID
             };
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _name;
    self.view.backgroundColor = [UIColor whiteColor];
    
    _reloadADButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_reloadADButton addTarget:self action:@selector(reloadADButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [_reloadADButton setTitleColor:_reloadADButton.tintColor forState:UIControlStateNormal];
    [_reloadADButton setTitle:@"Reload AD" forState:UIControlStateNormal];
    _reloadADButton.frame = CGRectMake(.0f, CGRectGetMaxY(self.view.bounds) - 100.0f, (CGRectGetWidth(self.view.bounds) - 40) / 2.0f, 60.0f);
    [self.view addSubview:_reloadADButton];
    
    _showAdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_showAdButton addTarget:self action:@selector(showAD) forControlEvents:UIControlEventTouchUpInside];
    [_showAdButton setTitleColor:_showAdButton.tintColor forState:UIControlStateNormal];
    [_showAdButton setTitle:@"Show AD" forState:UIControlStateNormal];
    _showAdButton.frame = CGRectMake(CGRectGetMaxX(_reloadADButton.frame) + 40.0f, CGRectGetMinY(_reloadADButton.frame), (CGRectGetWidth(self.view.bounds) - 40) / 2.0f, 60.0f);
    [self.view addSubview:_showAdButton];
    
    _clearAdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_clearAdButton addTarget:self action:@selector(clearAdButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [_clearAdButton setTitleColor:_clearAdButton.tintColor forState:UIControlStateNormal];
    [_clearAdButton setTitle:@"clear cache" forState:UIControlStateNormal];
    _clearAdButton.frame = CGRectMake(.0f, CGRectGetMinY(_reloadADButton.frame) - 20.0f - 60.0f, (CGRectGetWidth(self.view.bounds) - 40) / 2.0f, 60.0f);
    [self.view addSubview:_clearAdButton];
    
    _removeAdButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_removeAdButton addTarget:self action:@selector(removeAdButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [_removeAdButton setTitleColor:_removeAdButton.tintColor forState:UIControlStateNormal];
    [_removeAdButton setTitle:@"Remove Ad" forState:UIControlStateNormal];
    _removeAdButton.frame = CGRectMake(CGRectGetMaxX(_clearAdButton.frame) + 40.0f, CGRectGetMinY(_clearAdButton.frame), (CGRectGetWidth(self.view.bounds) - 40) / 2.0f, 60.0f);
    [self.view addSubview:_removeAdButton];
    
    _failureTipsLabel = [[UILabel alloc] initWithFrame:CGRectMake(.0f, 64.0f, CGRectGetWidth(self.view.bounds), 400.0f)];
    _failureTipsLabel.text = @"Failed to load ad";
    _failureTipsLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_failureTipsLabel];
    _failureTipsLabel.hidden = YES;
    
    if ([[UPArpuAdManager sharedManager] nativeAdReadyForPlacementID:_placementIDs[_name]]) {
        [self showAD];
    } else {
        _loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _loadingView.center = _failureTipsLabel.center;
        [_loadingView startAnimating];
        [self.view addSubview:_loadingView];
        [[UPArpuAdManager sharedManager] loadADWithPlacementID:_placementIDs[_name] extra:@{kExtraInfoNativeAdTypeKey:@([@{kGDTPlacement:@(UPArpuGDTNativeAdTypeSelfRendering), kGDTTemplatePlacement:@(UPArpuGDTNativeAdTypeTemplate), kMintegralPlacement:@(UPArpuGDTNativeAdTypeSelfRendering)}[_name] integerValue]), kExtraInfoNativeAdSizeKey:[NSValue valueWithCGSize:CGSizeMake(CGRectGetWidth(self.view.bounds) - 30.0f, 400.0f)]} customData:@{@"network":@"facebook"} delegate:self];
    }
}

-(void) removeAdButtonTapped {
    [[self.view viewWithTag:adViewTag] removeFromSuperview];
}

-(void) clearAdButtonTapped {
    [[UPArpuAdManager sharedManager] clearCache];
}

-(void) dealloc {
    NSLog(@"dealloc");
}

static NSInteger adViewTag = 3333;
-(void) reloadADButtonTapped {
    _failureTipsLabel.hidden = YES;
    [self.view addSubview:_loadingView];
    [[UPArpuAdManager sharedManager] loadADWithPlacementID:_placementIDs[_name] extra:@{kExtraInfoNativeAdTypeKey:@([@{kGDTPlacement:@(UPArpuGDTNativeAdTypeSelfRendering), kGDTTemplatePlacement:@(UPArpuGDTNativeAdTypeTemplate)}[_name] integerValue]), kExtraInfoNativeAdSizeKey:[NSValue valueWithCGSize:CGSizeMake(CGRectGetWidth(self.view.bounds) - 30.0f, 400.0f)]} customData:nil delegate:self];
}

-(void) showAD {
    //Remove previously shown ad first.
    [self removeAdButtonTapped];
    UPArpuNativeADConfiguration *config = [[UPArpuNativeADConfiguration alloc] init];
    config.ADFrame = CGRectMake(.0f, 64.0f, CGRectGetWidth(self.view.bounds), 300.0f);
    config.mediaViewFrame = CGRectMake(0, 120.0f, CGRectGetWidth(self.view.bounds), 300.0f - 120.0f);
    config.context = @{kUPArpuNativeAdConfigurationContextAdOptionsViewFrameKey:[NSValue valueWithCGRect:CGRectMake(CGRectGetWidth(self.view.bounds) - 43.0f, .0f, 43.0f, 18.0f)], kUPArpuNativeAdConfigurationContextAdLogoViewFrameKey:[NSValue valueWithCGRect:CGRectMake(.0f, .0f, 54.0f, 18.0f)]};
    config.delegate = self;
    config.rootViewController = self;
    config.renderingViewClass = [DMADView class];
    UIView *adView = [[UPArpuAdManager sharedManager] retriveAdViewWithPlacementID:_placementIDs[_name] configuration:config];
    adView.tag = adViewTag;
    [self.view addSubview:adView];
    if (adView == nil) NSLog(@"retrive ad view failed");
}

-(void) didStartPlayingVideoInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID {
    NSLog(@"UPADShowViewController:: didStartPlayingVideoInAdView:placementID:%@", placementID);
}

-(void) didEndPlayingVideoInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID {
    NSLog(@"UPADShowViewController:: didEndPlayingVideoInAdView:placementID:%@", placementID);
}

-(void) didClickNativeAdInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID {
    NSLog(@"UPADShowViewController:: didClickNativeAdInAdView:placementID:%@", placementID);
}

-(void) didShowNativeAdInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID {
    NSLog(@"UPADShowViewController:: didShowNativeAdInAdView:placementID:%@", placementID);
    adView.mainImageView.hidden = [adView isVideoContents];
}

-(void) didFinishLoadingADWithPlacementID:(NSString *)placementID {
    NSLog(@"UPADShowViewController:: didFinishLoadingADWithPlacementID:%@", placementID);
    [_loadingView removeFromSuperview];
    _failureTipsLabel.hidden = YES;
    if ([self.view viewWithTag:adViewTag] == nil) {
        [self showAD];
    }
}

-(void) didFailToLoadADWithPlacementID:(NSString *)placementID error:(NSError *)error {
    NSLog(@"UPADShowViewController:: didFailToLoadADWithPlacementID:%@ error:%@", placementID, error);
    [_loadingView removeFromSuperview];
    _failureTipsLabel.hidden = NO;
}

#pragma mark - delegate with networkID and adsourceID
-(void) didStartPlayingVideoInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"UPADShowViewController:: didStartPlayingVideoInAdView:placementID:%@with extra: %@", placementID,extra);
}

-(void) didEndPlayingVideoInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"UPADShowViewController:: didEndPlayingVideoInAdView:placementID:%@", placementID);
}

-(void) didClickNativeAdInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"UPADShowViewController:: didClickNativeAdInAdView:placementID:%@ with extra: %@", placementID,extra);
}

-(void) didShowNativeAdInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"UPADShowViewController:: didShowNativeAdInAdView:placementID:%@ with extra: %@", placementID,extra);
    adView.mainImageView.hidden = [adView isVideoContents];
}

-(void) didFinishLoadingADWithPlacementID:(NSString *)placementID extra:(NSDictionary *)extra{
    NSLog(@"UPADShowViewController:: didFinishLoadingADWithPlacementID:%@", placementID);
    [_loadingView removeFromSuperview];
    _failureTipsLabel.hidden = YES;
    if ([self.view viewWithTag:adViewTag] == nil) {
        [self showAD];
    }
}

-(void) didFailToLoadADWithPlacementID:(NSString *)placementID extra:(NSDictionary *)extra error:(NSError *)error {
    NSLog(@"UPADShowViewController:: didFailToLoadADWithPlacementID:%@ error:%@", placementID, error);
    [_loadingView removeFromSuperview];
    _failureTipsLabel.hidden = NO;
}

-(void) didEnterFullScreenVideoInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"UPADShowViewController:: didEnterFullScreenVideoInAdView:placementID:%@", placementID);
}

-(void) didExitFullScreenVideoInAdView:(UPArpuNativeADView*)adView placementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"UPADShowViewController:: didExitFullScreenVideoInAdView:placementID:%@", placementID);
}
#endif
@end

