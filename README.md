## What is this?
- This is a batch script that fixes Teredo issues with multiplayer for xbox games on windows.

## How do i run the fix?
- Disable any VPN software, also if you have an antivirus, disable the firewall protection in your antivirus.
- [Download](https://html-preview.github.io/?url=https://github.com/usedToBeTomas/teredoFix/blob/main/download.html) and run.
 
https://github.com/usedToBeTomas/teredoFix/assets/85880657/2b6a66d9-1e57-4b34-b472-139ea00d6368



<br><br><br>

## Still not working, i think i need to port-forward on my router, how do i do it?
- How do i know if i need to port-forward? You kinda dont, so if you already did run the teredoFix.bat and followed all the suggestion that it gave you, then the only remaining problem colud be your router.
- This thing is called port-forwarding, the process it's quite easy and safe, let's start!
- Write "cmd" on the windows search bar > open cmd > write ```ipconfig``` and hit enter > look for ```Predefined Gateway``` and ```Ipv4 address```, save them for later (ex. 192.168.1.1 , 192.168.1.45)
- Open web browser and paste the ```Predefined Gateway``` ip (ex. 192.168.1.1 or 192.168.0.1 etc...) on the top search bar and hit enter (not the google search-bar, the browser bar, the one where you can usually see the website address)
- You should now see the login page for your router settings
- Access using username and password (they usually are on the bottom of the wifi router), (the password is not the same that you use to connect to your wifi). 
- Once you logged in search for Port mapping and than create a new rule, some routers have the option *port mapping for known applications*, that's the preferred option.
- If you have port mapping for known applications than select it and select xbox live for windows application, than select your PC as local host, (if it asks for the ip address paste the ```Ipv4``` you saved previously)
- If you don't have port mapping for known applications than create your own custom rule:<br>
:white_medium_small_square: Under Traffic comming from:<br>
You set up your interface (If you can choose between interfaces choose the one that has your public ip address in it (ussualy set by default), if you don't know your public ip address search on google "what's my ip").<br>
If it asks: Any host = set yes<br>
If it ask: Any port = set no, than specify port 3074<br>
:white_medium_small_square: Under Traffic directed to:<br>
Host name = select your computer if there is a list of all conected devices<br>
Host ip = paste ```Ipv4``` you saved previously (It's the local ip address of your computer)<br>
Port = Same port, 3074<br>
- APPLY ALL MODIFICATIONS
- Wait 5 minutes (Sometimes router will take some time to apply modifications), then check teredo using teredoFix.bat
- If it still does not work try rebooting your wifi router, wait 5 minutes and check again
- Waiting and rebooting can sometimes do magic things with port-forwarding, it seems that some routers apply the new rules just when they feel like it.
