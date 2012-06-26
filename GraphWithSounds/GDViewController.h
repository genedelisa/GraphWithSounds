//
//  GDViewController.h
//  GraphWithSounds
//
//  Created by Gene De Lisa on 6/26/12.
//  Copyright (c) 2012 Rockhopper Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GDViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *noteButton;
@property (weak, nonatomic) IBOutlet UIPickerView *patchPicker;
- (IBAction)noteOn:(UIButton *)sender;
- (IBAction)noteOff:(id)sender;
@end
