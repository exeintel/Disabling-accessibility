Instructions for Using the Windows Accessibility Features Management Script

What the Program Does
This is a command-line utility (batch script) designed to quickly enable or disable built-in Windows accessibility features. It modifies system settings through the registry, allowing you to manage functions such as Sticky Keys, Narrator, Magnifier, High Contrast, and Mouse Keys.

Requirements

Operating System: Windows (Windows 7, 8, 10, 11)

Permissions: Administrator rights are required (the script will automatically request them upon launch).

Encoding: UTF-8 (for correct display of text).

How to Use

Running the Program

Copy the code into a text file.

Save the file with the extension .bat (e.g., accessibility_settings.bat).

Important: When saving, select the UTF-8 encoding, otherwise the text may display incorrectly.

Double-click the file to run it.

Upon launch, the script will automatically check for administrator privileges. If it doesn't have them, a User Account Control (UAC) prompt will appear requesting elevation.

Main Menu
After launching, you will see a menu with three options:


==============================
     Accessibility Settings
==============================

0. Exit program
1. Disable accessibility features
2. Enable accessibility features
Enter your choice and press Enter:
0 — Exit the program

1 — Disable accessibility features (disables all the features listed below)

2 — Enable accessibility features (enables all the features listed below)

Which Features Are Managed by the Script

When you select the corresponding menu item, the following settings are changed:

Feature	When Disabling (1)	When Enabling (2)
Sticky Keys	Disabled	Enabled
Filter Keys	Disabled	Enabled
Toggle Keys	Disabled	Enabled
Keyboard Preferences	Standard mode	Accessibility mode
Magnifier	Hidden (not shown)	Shown (enabled)
Narrator	Disabled launch with Win+Enter	Enabled launch with Win+Enter
High Contrast	Disabled	Enabled
Mouse Keys	Disabled	Enabled
Important Notes

Applying Changes: After modifying the settings, the script automatically refreshes system parameters (via UpdatePerUserSystemParameters), but some changes may require a computer restart to take full effect.

Current User: Changes are applied only to the current user (registry hive HKCU — HKEY_CURRENT_USER).

Security:

This script modifies the system registry. It is recommended to create a system restore point before using it.

Do not run scripts from untrusted sources without reviewing the code first.

Individual Settings: The script works in a "batch" mode — it enables/disables all listed features at once. If you need to manage features individually, please use the standard Windows settings (Settings → Accessibility).

Example Usage

Situation: Accessibility features have been accidentally enabled (e.g., Sticky Keys pop up after repeatedly pressing Shift), and they are interfering with your work.

Solution:

Run the script.
Enter 1 (Disable accessibility features).
Press any key to continue (as prompted by pause).
Restart your computer if necessary.
Restoring Standard Settings

If you encounter problems after using the script:

Run the script again and select option 2 (Enable accessibility features) — this will revert the settings to the "enabled" state.

Or, use the standard Windows settings: Settings → Accessibility → Other options → Reset.

