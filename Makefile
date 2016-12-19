include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AnotherLockKeyboard
AnotherLockKeyboard_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 MobileSafari"

after-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/DEBIAN$(ECHO_END)
	$(ECHO_NOTHING)cp postrm $(THEOS_STAGING_DIR)/DEBIAN/postrm$(ECHO_END)
