# :open_book: INSTRUCTIONS
- Disable any VPN software, disable firewall protection in thirdparty antiviruses and keep windows firewall on standard settings.
- On this github page, on the top right, press the green button "Code" and than "Download zip" to download the fix script. Unzip the folder, run teredoFix.bat, windows defender will show up, click on ```More informations``` and then Run (code is open-source so you can check that it is safe), when it asks ```Do you want to allow this app to make changes to your device?``` select yes.
- The new version of the script automatically checks the teredo status and helps you figure out what to do by giving you instruction. The ui helps you understand the status of your teredo connection, follow the suggestions of the script and enjoy :)
<div align="center">
<img src="https://github.com/usedToBeTomas/teredoFix/assets/85880657/730eb14a-1c55-4282-b34b-6c2bd14ebb2e" width=70% height=auto>
</div>

# :pushpin: EXTRAS
## Disable teredo (fix Rainbow Six Siege)
- Some games like Rainbow Six Siege, don't like teredo connection enabled, here's an easy fix, keep in mind that disabling teredo will make games that request the use of teredo not work anymore (Astroneer, Forza Horizon ...)
- Run teredoFix.bat but select option ```2 - DISABLE TEREDO AND REVERT ALL CHANGES```
## Set-up Port Forwarding :twisted_rightwards_arrows:
- Search cmd on windows bar > open cmd > write ```ipconfig``` and hit enter > look for ```Predefined Gateway``` and ```Ipv4 address```, save them for later (ex. 192.168.1.1 , 192.168.1.45)
- Open web browser and paste the ```Predefined Gateway``` ip (ex. 192.168.1.1 or 192.168.0.1 etc...) on the top search bar and hit enter
- Access your wifi router using username and password (they usually are on the bottom of the wifi router), (the password is not the same that you use to connect to your wifi). 
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
- Wait 5 minutes (Sometimes router will take some time to apply modifications)
- Reboot your computer
- Open settings > games > xbox networking > wait -> it will still say teredo unable to qualify > 
press Check again > wait > you should have NAT open and Server Connected > if not press Fix and than Check again
- If it still does not work try rebooting your wifi router and than your computer and try again to check if it worked
- If it still does not work run teredoFix.bat an other time, wait for the computer to reboot and check again

___

If you think i skipped some informations or you found an other solution not included here, you can create an issue or a pull request here on github and i'll try to implement it inside the teredoFix.bat, the ultimate goal is to create a general fix for every teredo/openNAT-related problem in the xbox app / microsoft multiplayer.
