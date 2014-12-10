AutoLatch
=========

This plugin is a modification of the current Latch app for Android, which adds new
features that streamline the use of the latches; Automating the locking and unlocking of said
latches by receiving events by geographic location or connection to a wireless network.
With it you can set an AutoLatch for applications that normally only used inside.
AutoLatch could automatically block your application when you exit, because when your
smartphone is disconnected from the wireless network in your home or gets gps coordinates
away from your residence we can expect you are out, and then you don't need enable access
to that application.

Compilation
===========

requirements for compilation are

➢ Download Github repository https://github.com/Joaneet/AutoLatch
➢ Android SDK
➢ dex2jar tool
➢ apktool tool
➢ Zip tool

Compile : You can use Android SDK directly or import the project into Eclipse to perform the compilation
Note: That step is optional since the apk compiled already is in the repository Github.
https://github.com/Joaneet/AutoLatch/blob/master/AutoLatchPluguin/bin/AutoLatchPluguin.apk

Join AutoLatch with Latch : Edit the file MakeAll.bat to put all paths correctly, run it,
and the apk that is the union of the two projects will be created.

Installation: To use the plugin, you should only install the application on an Android smartphone,
you can download the application from the following link.
It is important that during installation check the unknown sources (If it does not already
selected), since you do not are downloading the AutoLatch plugin from Google Play.

Using
======

Add a new AutoLatch : Login to Latch, In the screen where you can view the status of
their applications, click button top right and then "AutoLatchs menu", if you no have any
Autolatch created will go directly to the creation menu, otherwise you will be asked what do
you want to do, click "Create Autolatch".

Now you must select those operations who wants to change state automatically when
the event that you will configure later will be triggered, press "Select an event" for continue.

Wireless Event : After selecting "Wireless Event" you must select that wireless network
that you already securely connected and want to trigger the event.

Note: To see the list of wireless networks must have the wireless interface enabled

GPS Event GPS : After selecting "GPS Event", you must choose a radius in meters
(greater than 200 m) center where you currently are (can see where you are clicking on "View
position"), which delimit the geographical area of the event.
Note: You need to have the reception of GPS signals enabled on your SmartPhone
Here will be asked to put a name to your new Autolatch, so you can identify it later,
then asks what you want the Autolatch do with the above selected operations and finally when
you want to trigger the event.

Configuration examples :

➢ Event Type Wireless Network, Operation Lock, Event Exit : The operations are
blocked when you disconnect from the selected wireless network or connect to
another wireless network.

➢ Event Type GPS, Operation Unlock, Event In : The operations will unlock when your
smartphone receives gps coordinates within the selected geographic radius.

➢ Event type GPS, Operation Unlock when in, block when exit : The operations will
unlock when your smartphone receives gps coordinates within the selected
geographic radius and the operations are blocked when you receive coordinates gps
off the selected geographic radius.

View your AutoLatchs : In main menu Latch where you can view the status of their
applications, press the button top right and then "Menu AutoLatchs" then click on "View your
Autolatch" in this menu you can also select the Autolatchs you want and remove these by
clicking on "Remove selected".

Motivation
==========

Following the argument of the talks of Chema Alonso, explaining that aims to make
tools for that man who walked into the depths of the rem phase on his couch while holding
greedily her TV remote control. That man looks happy, because apparently has no concerns
with this plugin I'm trying to still remove more worries.
Why I have to worry lock / unlock the read of files from my computer when I only use
my computer when I I'm home and also carry a smartphone that knows when I am or am not
at home? Why would I want to check my email from work or connect it to my internal access
servers outside of work? Why the usb inputs of my secretary are enabling when she is going
for coffee? ¿Why my parking should open when I'm not near him?
With this plugin I attempt to automate the use of Latch for these situations that are
really very common.
Currently I collect wireless connection / disconnection events and GPS signals, which
give most clearly to smartphone an idea of where you are, but I have programmed this
thinking of an easy extension of other events.