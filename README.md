INSTRUCTIONS

- Run teredoFix.bat as administrator > Windows Defender might show up click on More informations and then Run (code is open-source so you can check that it is safe) > wait for it to say Press any key to continue... > press a key
- Computer will automatically reboot in 30 seconds, wait.
- Open settings > games > xbox networking > wait -> it will still say teredo unable to qualify > 
press Check again > wait > you should have NAT limited and Server Connected > if not start from the beginning of the guide
- If for some reson at this point you already have Open NAT you are done! Otherwise continue with the next step
- Search cmd on windows bar > open cmd > write ipconfig and hit enter > look for Predefined Gateway and Ipv4 address, save them for later
- Open web browser paste Predefined Gateway ip (ex. 192.168.1.1 or 192.168.0.1 etc...) on the top search bar and hit enter
- Access your wifi router using username and password (they usually are on the bottom of the wifi router), (the password is not the same that you use to connect to your wifi)
- Search for Port mapping > create a new rule<br>
<b>Under Traffic comming from:</b><br>
You set up your interface (If you can choose between interfaces choose the one that has your public ip address in it (ussualy set by default), if you don't know your public ip address search on google "what's my ip").<br>
If it asks any host = set yes<br>
If it ask any port = set no, than specify port 52586<br>
<b>Under Traffic directed to:</b><br>
Host name = select your computer if there is a list of all conected devices<br>
Host ip = paste Ipv4 you saved previously<br>
Port = Same port, 52586<br>
APPLY ALL MODIFICATIONS<br>
- Wait 5 to 10 minutes
- Reboot your computer
- Open settings > games > xbox networking > wait -> it will still say teredo unable to qualify > 
press Check again > wait > you should have NAT open and Server Connected > if not press Fix and than Check again
- If it still does not work try rebooting your wifi router and than your computer and try again to check if it worked
- It's very likely that you'll have to reboot your computer a few times before it starts working, but if it does not work after 2/3 reboot 5 minutes apart from each others, it probably wont even after 100
