//
//  GDViewController.m
//  GraphWithSounds
//
//  Created by Gene De Lisa on 6/26/12.
//  Copyright (c) 2012 Rockhopper Technologies. All rights reserved.
//

#import "GDViewController.h"
#import "GDSoundEngine.h"

@interface GDViewController ()

@property (strong) id soundEngine;
@property (strong) NSArray* presetNames;

@end

@implementation GDViewController

@synthesize noteButton;
@synthesize patchPicker;
@synthesize soundEngine = _soundEngine;
@synthesize presetNames = _presetNames;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.soundEngine = [[GDSoundEngine alloc] init];
    // General MIDI names
    self.presetNames = [[NSArray alloc] initWithObjects:
                        @"1 Acoustic Grand Piano",
                        @"2 Bright Acoustic Piano",
                        @"3 Electric Grand Piano",
                        @"4 Honky-tonk Piano",
                        @"5 RhodesPiano",
                        @"6 ChorusPiano",
                        @"7 Harpsichord",
                        @"8 Clavinet",
                        @"9 Celesta",
                        @"10 Glockenspiel",
                        @"11 Music Box",
                        @"12 Vibraphone",
                        @"13 Marimba",
                        @"14 Xylophone",
                        @"15 TubularBells",
                        @"16 Dulcimer",
                        @"17 Hamnd Organ",
                        @"18 Perc Organ",
                        @"19 Rock Organ",
                        @"20 ChurchOrgan",
                        @"21 Reed Organ",
                        @"22 Accordion",
                        @"23 Harmonica",
                        @"24 Tango Acordn",
                        @"25 Nylon Guitar",
                        @"26 SteelStrGuitar",
                        @"27 Jazz Guitar",
                        @"28 CleanE.Guitar",
                        @"29 Mute E.Guitar",
                        @"30 OvrdrivGuitar",
                        @"31 DistortGuitar",
                        @"32 Harmonics",
                        @"33 Acou Bass",
                        @"34 FingerE.Bass",
                        @"35 PickedE.Bass",
                        @"36 FretlesBass",
                        @"37 Slap Bass 1",
                        @"38 Slap Bass 2",
                        @"39 Synth Bass1",
                        @"40 Synth Bass2",
                        @"41 Violin",
                        @"42 Viola",
                        @"43 Cello",
                        @"44 Contrabass",
                        @"45 Trem Strings",
                        @"46 Pizz Strings",
                        @"47 OrchHarp",
                        @"48 Timpani",
                        @"49 Str Ensmb 1",
                        @"50 Str Ensmb 2",
                        @"51 Synth Str 1",
                        @"52 Synth Str 2",
                        @"53 Choir Aahs",
                        @"54 Voice Oohs",
                        @"55 Synth Voice",
                        @"56 Orchestra Hit",
                        @"57 Trumpet",
                        @"58 Trombone",
                        @"59 Tuba",
                        @"60 Mute Trumpet",
                        @"61 French Horn",
                        @"62 Brass Section",
                        @"63 SynthBrass1",
                        @"64 SynthBrass2",
                        @"65 SopranoSax",
                        @"66 Alto Sax",
                        @"67 Tenor Sax",
                        @"68 Bari Sax",
                        @"69 Oboe",
                        @"70 EnglshHorn",
                        @"71 Bassoon",
                        @"72 Clarinet",
                        @"73 Piccolo",
                        @"74 Flute",
                        @"75 Recorder",
                        @"76 Pan Flute",
                        @"77 BottleBlow",
                        @"78 Shakuhachi",
                        @"79 Whistle",
                        @"80 Ocarina",
                        @"81 Square Wave",
                        @"82 SawTooth",
                        @"83 Caliope",
                        @"84 Chiff Lead",
                        @"85 Charang",
                        @"86 SoloSynthVox",
                        @"87 Brite Saw",
                        @"88 Brass&Lead",
                        @"89 FantasaPad",
                        @"90 Warm Pad",
                        @"91 Poly Synth Pad",
                        @"92 Space Vox Pad",
                        @"93 Bow Glass Pad",
                        @"94 Metal Pad",
                        @"95 Halo Pad",
                        @"96 Sweep Pad",
                        @"97 Ice Rain",
                        @"98 SoundTrack",
                        @"99 Crystal",
                        @"100 Atmosphere",
                        @"101 Brightness",
                        @"102 Goblin",
                        @"103 Echo Drops",
                        @"104 Star Theme",
                        @"105 Sitar",
                        @"106 Banjo",
                        @"107 Shamisen",
                        @"108 Koto",
                        @"109 Kalimba",
                        @"110 Bag Pipe",
                        @"111 Fiddle",
                        @"112 Shanai",
                        @"113 Tinkle Bell",
                        @"114 Agogo",
                        @"115 Steel Drums",
                        @"116 Woodblock",
                        @"117 Taiko Drum",
                        @"118 Melodic Tom",
                        @"119 Synth Drum",
                        @"120 Revrs Cymbal",
                        @"121 Gtr Fret Noise",
                        @"122 Breath Noise",
                        @"123 Sea Shore",
                        @"124 Bird Tweet",
                        @"125 Telephone Ring",
                        @"126 Helicopter",
                        @"127 Applause",
                        @"128 Gun Shot",
                        nil];

}

- (void)viewDidUnload
{
    [self setNoteButton:nil];
    [self setPatchPicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Note Actions
- (IBAction)noteOn:(UIButton *)sender {
    NSLog(@"on %d", [sender tag]);
    UInt32 velocity = 100;
    [self.soundEngine playNoteOn:[sender tag] :velocity ];

}

- (IBAction)noteOff:(id)sender {
    NSLog(@"off %d", [sender tag]);
    [self.soundEngine playNoteOff:[sender tag] ];
}

#pragma mark - UIPickerView
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    return ([self.presetNames count]);
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.presetNames objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString* s =[self.presetNames objectAtIndex:row];
    NSLog(@"picked %d", [s intValue]);
    UInt8 n = [s intValue] - 1;
    [self.soundEngine setPresetNumber:n];
}
@end
