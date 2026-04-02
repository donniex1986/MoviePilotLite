#import "GeneratedPluginRegistrant.h"

@interface JPUSHService : NSObject
+ (void)registerDeviceToken:(NSData *)deviceToken;
+ (void)handleRemoteNotification:(NSDictionary *)userInfo;
@end

static inline void MPJPushRegisterDeviceToken(NSData *deviceToken) {
  [JPUSHService registerDeviceToken:deviceToken];
}

static inline void MPJPushHandleRemoteNotification(NSDictionary *userInfo) {
  [JPUSHService handleRemoteNotification:userInfo];
}
