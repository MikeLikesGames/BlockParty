//
//  ViewController.m
//  BlockParty
//
//  Created by Krishna Kumar on 6/26/15.
//  Copyright © 2015 Krishna Kumar. All rights reserved.
//

#import "ViewController.h"
#import <SafariServices/SafariServices.h>
#import "UIDeviceHelper.h"
#import "BlockPartyConstants.h"

@interface ViewController ()
- (IBAction)jsonTapped:(id)sender;

- (IBAction)settingsTapped:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *instructionLabel2;
@property (strong, nonatomic) IBOutlet UILabel *instructionLabel3;
- (IBAction)browserTapped:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UINavigationController *navigationController = (UINavigationController *)self.navigationController;
    UIFont *font = [UIFont fontWithName:@"Avenir Next" size:16];
    [navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                [UIColor blackColor],
                                                                NSForegroundColorAttributeName,
                                                                font,
                                                                NSFontAttributeName,
                                                                nil]];
    if (IS_IPHONE_4 || IS_IPHONE_5) {
        self.instructionLabel2.font = [UIFont fontWithName:@"Avenir Next" size:14];
        self.instructionLabel3.font = [UIFont fontWithName:@"Avenir Next" size:14];
    }
    
    [SFContentBlockerManager reloadContentBlockerWithIdentifier:APP_EXTENSION_NAME completionHandler:^(NSError *error) {
        if (error!=nil) {
            NSLog(@"RELOAD OF %@ FAILED WITH ERROR -%@", APP_EXTENSION_NAME,[error localizedDescription]);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)jsonTapped:(id)sender {
    [self performSegueWithIdentifier:@"showRules" sender:self];
}

- (IBAction)settingsTapped:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: UIApplicationOpenSettingsURLString]];
}


- (IBAction)browserTapped:(id)sender {

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://about:blank"]];
    
}
@end
