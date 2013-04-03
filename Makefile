export TARGET=:clang
include theos/makefiles/common.mk

TWEAK_NAME = DriveOut
DriveOut_FILES = Tweak.xm
DriveOut_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
