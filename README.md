# What is this?
- This is a batch script that fixes Teredo issues with multiplayer for xbox games on windows.

# How do i run the fix?
- Disable any VPN software
- If you have an antivirus, disable the firewall protection in your antivirus.
- [Download](https://html-preview.github.io/?url=https://github.com/usedToBeTomas/teredoFix/blob/main/download.html) and run.
 
https://github.com/usedToBeTomas/teredoFix/assets/85880657/2b6a66d9-1e57-4b34-b472-139ea00d6368

# It does not work i'm stuck here!
You already run the script and this is what it says?<br>
<div align="left">
<img src="https://github.com/usedToBeTomas/teredoFix/assets/85880657/c0ff6aa1-b56e-422b-bb1b-12a24c461a8d" width="60%" height="auto"/><br>
</div>

The problems might be one of the following:
- __VPN__ = You have to disable any kind of vpn running on your computer
- __Antivirus firewall__ = Some third-party antivirus like avast, northon, etc... have an additional firewall protection, this will most likely create problems with teredo, you need to disable the firewall protection in your antivirus. (not the entire antivirus, only the firewall protection)
- __WiFi Router settings__ = Most routers can manage teredo without any problems using a tecnology called UPnP, you can try to simply activate that in your router, but for reasons i'm still not really able to understand this will sometimes not work. So? how can i fix this? you can setup a port-forwarding rule on your router, more specifically you need to port-forward port 3074 and 3544 (TCP/UDP) from your router to your pc.
