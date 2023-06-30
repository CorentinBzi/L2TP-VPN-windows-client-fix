# VPN Connection Addition and L2TP Protocol Activation Script
This PowerShell script adds a VPN connection to your computer using the Layer 2 Tunneling Protocol (L2TP) and also makes a modification in the Windows registry to enable the L2TP protocol.
 
 
## How it works
The script uses the Add-VpnConnection command to create a new VPN connection with the specified parameters. Here's an explanation of the parameters used:
 
 
-  Name "VPN": Specifies the name of the VPN connection. You can modify it according to your needs.
-  ServerAddress YOUR_PUBLIC_IP: Replace YOUR_PUBLIC_IP with the public IP address or domain name of your VPN server.
-  TunnelType L2tp: Sets the VPN tunnel type to use (L2TP in this case).
-  RememberCredential: Instructs the computer to remember the credentials for this VPN connection.
-  L2tpPsk YOUR_PRIVATE_KEY: Replace YOUR_PRIVATE_KEY with the pre-shared private key (PSK) for L2TP authentication.
-  AuthenticationMethod MSChapv2: Specifies the authentication method to use (MSChapv2 in this case).
-  EncryptionLevel Maximum: Sets the encryption level of the VPN connection to "Maximum".
-  Force: Forces the addition of the VPN connection even if a connection with the same name already exists.
 
 
After adding the VPN connection, the script uses Windows registry commands to activate the L2TP protocol. It first checks if the registry key AssumeUDPEncapsulationContextOnSendRule exists.
If it doesn't exist, the script creates the key and sets its value to 00000002.
Otherwise, it updates the value of the key to 00000002.
This modification allows the L2TP protocol to function properly across the network.
 
 
Finally, the script displays a message indicating that the VPN connection has been successfully added and the registry modification has been completed.
 
 
## Why this script is necessary
This script is necessary when you're using the built-in VPN client of Windows and your L2TP VPN server is located behind a modem.
In this scenario, some modems may block outgoing L2TP VPN traffic, preventing the VPN connection from establishing correctly.
 
 
By running this script, the L2TP VPN connection is added with the appropriate parameters, and the script also makes a modification in the Windows registry to enable the L2TP protocol.
This modification helps bypass the restrictions imposed by some modems, allowing L2TP VPN traffic to pass through the modem and reach the VPN server.
