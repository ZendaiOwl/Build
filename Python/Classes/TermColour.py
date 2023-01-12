#!/usr/bin/env python3
# Victor-ray, S <12261439+ZendaiOwl@users.noreply.github.com>
class TermColour:
  description        = "ANSI Terminal Colours"
  normal             = '\033[0m' # Reset
  bold               = '\033[1m'
  light              = '\033[2m'
  cursive            = '\033[3m'
  underscore         = '\033[4m'
  blink              = '\033[5m'
  blinking           = '\033[6m' # The same as blink
  highlight          = '\033[7m' # Also called "film" in some places/docs/aticles
  blank              = '\033[8m' # Makes the text invisible
  strikethrough      = '\0339m'
  double_underscore  = '\033[21m'
  black_light        = '\033[30m'
  red_light          = '\033[31m'
  green_light        = '\033[32m'
  yellow_light       = '\033[33m'
  blue_light         = '\033[34m'
  purple_light       = '\033[35m'
  cyan_light         = '\033[36m'
  gray_light         = '\033[37m'
  white_light        = '\033[38m'
  black              = '\033[90m'
  red                = '\033[91m'
  green              = '\033[92m'
  yellow             = '\033[93m'
  blue               = '\033[94m'
  purple             = '\033[95m'
  cyan               = '\033[96m'
  gray               = '\033[2;97m' # Without light(2) code this one is white
  white              = '\033[98m'
  
  def __init__(self):
    self = self
    
  def BlackLight(self, text: str):
    return print(f"{self.black_light + text + self.normal}")
    
  def Black(self, text: str):
    return print(f"{self.black + text + self.normal}")
    
  def BlackBold(self, text: str):
    return print(f"{self.bold + self.black + text + self.normal}")
    
  def RedLight(self, text: str):
    return print(f"{self.red_light + text + self.normal}")
    
  def Red(self, text: str):
    return print(f"{self.red + text + self.normal}")
    
  def RedBold(self, text: str):
    return print(f"{self.bold + self.red + text + self.normal}")
    
  def GreenLight(self, text: str):
    return print(f"{self.green_light + text + self.normal}")
    
  def Green(self, text: str):
    return print(f"{self.green + text + self.normal}")
    
  def GreenBold(self, text: str):
    return print(f"{self.bold + self.green + text + self.normal}")
    
  def YellowLight(self, text: str):
    return print(f"{self.yellow_light + text + self.normal}")
    
  def Yellow(self, text: str):
    return print(f"{self.yellow + text + self.normal}")
    
  def YellowBold(self, text: str):
    return print(f"{self.bold + self.yellow + text + self.normal}")
    
  def BlueLight(self, text: str):
    return print(f"{self.blue_light + text + self.normal}")
    
  def Blue(self, text: str):
    return print(f"{self.blue + text + self.normal}")
    
  def BlueBold(self, text: str):
    return print(f"{self.bold + self.blue + text + self.normal}")
    
  def PurpleLight(self, text: str):
    return print(f"{self.purple_light + text + self.normal}")
    
  def Purple(self, text: str):
    return print(f"{self.purple + text + self.normal}")
    
  def PurpleBold(self, text: str):
    return print(f"{self.bold + self.purple + text + self.normal}")
    
  def CyanLight(self, text: str):
    return print(f"{self.cyan_light + text + self.normal}")
    
  def Cyan(self, text: str):
    return print(f"{self.cyan + text + self.normal}")
    
  def CyanBold(self, text: str):
    return print(f"{self.bold + self.cyan + text + self.normal}")
    
  def GrayLight(self, text: str):
    return print(f"{self.gray_light + text + self.normal}")
    
  def Gray(self, text: str):
    return print(f"{self.gray_light + text + self.normal}")
    
  def GrayBold(self, text: str):
    return print(f"{self.bold + self.gray_light + text + self.normal}")
    
  def WhiteLight(self, text: str):
    return print(f"{self.white_light + text + self.normal}")
    
  def White(self, text: str):
    return print(f"{self.white + text + self.normal}")
    
  def WhiteBold(self, text: str):
    return print(f"{self.bold + self.white + text + self.normal}")
