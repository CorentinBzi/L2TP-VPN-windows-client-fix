# Script d'ajout de connexion VPN et activation du protocole L2TP
Ce script PowerShell permet d'ajouter une connexion VPN à votre ordinateur en utilisant le protocole L2TP (Layer 2 Tunneling Protocol). Il effectue également une modification dans le registre de Windows pour activer le protocole L2TP.

## Fonctionnement
Le script utilise la commande Add-VpnConnection pour créer une nouvelle connexion VPN avec les paramètres spécifiés. Voici une explication des paramètres utilisés :

-  Name "VPN" : spécifie le nom de la connexion VPN. Vous pouvez le modifier selon vos besoins.
-  ServerAddress YOUR_PUBLIC_IP : remplacez YOUR_PUBLIC_IP par l'adresse IP publique ou le nom de domaine de votre serveur VPN.
-  TunnelType L2tp : définit le type de tunnel VPN à utiliser (L2TP dans ce cas).
-  RememberCredential : indique à l'ordinateur de mémoriser les informations d'identification pour cette connexion VPN.
-  L2tpPsk YOUR_PRIVATE_KEY : remplacez YOUR_PRIVATE_KEY par la clé privée pré-partagée (PSK) pour l'authentification L2TP.
-  AuthenticationMethod MSChapv2 : spécifie la méthode d'authentification à utiliser (MSChapv2 dans ce cas).
-  EncryptionLevel Maximum : définit le niveau de chiffrement de la connexion VPN à "Maximum".
-  Force : force l'ajout de la connexion VPN même si une connexion portant le même nom existe déjà.

Après l'ajout de la connexion VPN, le script utilise les commandes du registre Windows pour activer le protocole L2TP. Il vérifie d'abord si la clé de registre AssumeUDPEncapsulationContextOnSendRule existe. Si elle n'existe pas, le script crée la clé et lui attribue la valeur 00000002. Sinon, il met à jour la valeur de la clé à 00000002. Cette modification permet au protocole L2TP de fonctionner correctement à travers le réseau.

Enfin, le script affiche un message indiquant que l'ajout de la connexion VPN et la modification du registre ont été effectués avec succès.

## Pourquoi ce script est nécessaire
Ce script est nécessaire lorsque vous utilisez le client VPN intégré de Windows et que votre serveur VPN L2TP se trouve derrière le modem. Dans ce scénario, certains modems peuvent bloquer le trafic VPN L2TP sortant, ce qui empêche la connexion VPN de s'établir correctement.

En exécutant ce script, la connexion VPN L2TP est ajoutée avec les paramètres appropriés, et le script effectue également une modification dans le registre de Windows pour activer le protocole L2TP. Cette modification permet de contourner les restrictions imposées par certains modems et de permettre au trafic VPN L2TP de passer à travers le modem et d'atteindre le serveur VPN.

Ainsi, en utilisant ce script, vous pouvez configurer facilement et automatiquement la connexion VPN L2TP lorsque vous utilisez le client VPN intégré de Windows avec un serveur VPN situé derrière un modem, assurant ainsi le fonctionnement de votre connexion VPN.
