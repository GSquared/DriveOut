@protocol SettingsViewControllerDelegate <NSObject>
- (void)signOutImmediately;
- (id)userManager;
@end

//@protocol SettingsViewControllerDelegate;
@interface SettingsViewController
{

}
@property(assign, nonatomic) id<SettingsViewControllerDelegate> delegate;	// @synthesize=delegate_
- (void)viewDidUnload;
- (void)signOutConfirmationPressed;
- (void)signOutImmediately;
@end

@interface DriveAppDelegate
{
}
- (void)signOutImmediately;
- (id)signedInUsername;
@end

%hook DriveAppDelegate

- (void)applicationDidBecomeActive:(id)application {

	if ([self signedInUsername] == nil) {

	}
	else {
		[self signOutImmediately];
		UIAlertView *alert = [[UIAlertView alloc]
			initWithTitle: @"Google Drive"
			message: @"The Previous Session Has Timed Out, Please Sign In Again."
			delegate: nil
			cancelButtonTitle:@"OK"
			otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	%orig;
}

%end
