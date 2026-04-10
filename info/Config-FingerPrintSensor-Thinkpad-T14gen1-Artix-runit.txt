
# 1. install these packages (pacman & yay)
sudo pacman -S polkit dbus dbus-runit xdg-dbus-proxy fwupd fprintd 

# 2. check frimware update

fwupdmgr refresh
fwupdmgr get-updates
fwupdmgr update

#====================================================
# Mine is Prometheus (use lsusb command to find your finger print sensor)
# [ Bus 001 Device 004: ID 06cb:00bd Synaptics, Inc. Prometheus MIS Touch Fingerprint Reader ]
#
# Devices with the latest available firmware version:
# • Embedded Controller
# • System Firmware
# • UEFI Device Firmware
# • Prometheus
# • Prometheus (IOTA Config)
# • Thunderbolt host controller
#
# I got this output in console so I don't need to update but
# still tried updating (fwupdmgr update)
# (EFI error may occur just ignore)
#====================================================

# 3. Add/create rules in /etc/polkit-1/rules.d/

# You need to use root login [su] to create any file in this dir
# you may find 99-artix.rules file (i didnot add rule in this file)
# if it gets updated then I need to add the rules again so
# I did create [50-fprintd.rules] file

su
cd /etc/polkit-1/rules.d/ 

# use any one of this editor nano,nvim or helix

sudo hx /etc/polkit-1/rules.d/50-fprintd.rules

# add this rules in 50-fprintd.rules

polkit.addRule(function(action, subject) {
    if (action.id == "net.reactivated.fprint.device.enroll" ||
        action.id == "net.reactivated.fprint.device.verify") {
        if (subject.isInGroup("wheel")) {
            return polkit.Result.YES;
        }
    }
});

# save the file.
# polkit and dbus should be installed mostly polkit will be in system
# for dbus use dbus-runit and enable in /etc/runit/runsvdir/current
# check dbus is running in the system using htop or top 

# 4. Enroll finger print using this command.
# You need to touch index finger multiple times in fingerprint sensor

fprintd-enroll


# 5. Verify using this command and touch the sensor

fprintd-verify

# 6. Check available fingerprints list in the system for perticular user

fprintd-list $USER 

# 7. To use finger instead of typing password for sudo
# edit the PAM configuration in /etc/pam.d/sudo file

cd /etc/pam.d/

#use nano or nvim or hx

sudo hx sudo 

# add this line in top

auth    sufficient    pam_fprintd.so


# 8. To Enable Fingerprint for Login/TTY

cd /etc/pam.d/

#use nano or nvim or hx

sudo hx /etc/pam.d/system-auth

# add this line in top

auth    sufficient    pam_fprintd.so


#==================================================================
# Now on every sudo access you can use finger print. Its so funny
#==================================================================


#==========================================================================
#=======================    !!!   warning !!!     =========================
#==========================================================================
# If you have locked out while editing PAM files login to TTY2 (Ctrl+Alt+2)
# login as a root and currect/fix the PAM file...
# if system locked out then boot from Live USB and /mnt the drive and edit. 
#==========================================================================




