#import "UDPTransmit.h"

@implementation UDPTransmit
{
	// Regular C implementation:
	char * messageToSend;
	struct sockaddr_in broadcastAddr;
	int DatagramSocketC;
}

// Constructor
- (id)init
{
}

// Destructor
- (void)dealloc{
}

// Initializer for the packet and socket, takes a desination IP address and socket number
- (void) initialize:(CDVInvokedUrlCommand*)command
{
	// Creates a packet and socket
	CDVPluginResult* pluginResult = nil;

	// Create the packet

    // Allocate the memory
	memset(&broadcastAddr, 0, sizeof broadcastAddr);
    broadcastAddr.sin_family = AF_INET;

	// Set the destination IP address
	const char * ip_address = ((NSString *)[command.arguments objectAtIndex:0]).cString;
	inet_pton(AF_INET, ip_address, &broadcastAddr.sin_addr); // Set the broadcast IP address

	// Set the destination port #
	NSUInteger thePort = [[command.arguments objectAtIndex:1] integerValue];
	broadcastAddr.sin_port = htons(thePort); // Set port 4445

	// 	Create the socket

	DatagramSocketC = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
    int broadcastEnable=1;
    int ret=setsockopt(DatagramSocketC, SOL_SOCKET, SO_BROADCAST, &broadcastEnable, sizeof(broadcastEnable));
 }

// Sends a message to the IP and port set up in the initializer
- (void) sendMessage:(CDVInvokedUrlCommand*)command
{
	messageToSend = ((NSString *)[command.arguments objectAtIndex:0]).cString;
	int ret = sendto(DatagramSocketC, messageToSend, strlen(messageToSend), 0, (struct sockaddr*)&broadcastAddr, sizeof broadcastAddr);
}


- (void)createDatagramPacket:(CDVInvokedUrlCommand*)command
{
	CDVPluginResult* pluginResult = nil;
	
	// Regular C implementation:
	messageToSend = ((NSString *)[command.arguments objectAtIndex:0]).cString;
	
    memset(&broadcastAddr, 0, sizeof broadcastAddr);
    broadcastAddr.sin_family = AF_INET;
	const char * ip_address = ((NSString *)[command.arguments objectAtIndex:1]).cString;
	inet_pton(AF_INET, ip_address, &broadcastAddr.sin_addr); // Set the broadcast IP address
	
	NSUInteger thePort = [[command.arguments objectAtIndex:2] integerValue];
	broadcastAddr.sin_port = htons(thePort); // Set port 4445
}

- (void)setDatagramPacketAddress:(CDVInvokedUrlCommand*)command
{
	const char * ip_address = ((NSString *)[command.arguments objectAtIndex:0]).cString;
	inet_pton(AF_INET, ip_address, &broadcastAddr.sin_addr); // Set the broadcast IP address
}

- (void)getDatagramPacketAddress:(CDVInvokedUrlCommand*)command
{
	
}

- (void)setDatagramPacketPort:(CDVInvokedUrlCommand*)command
{
	NSUInteger thePort = [[command.arguments objectAtIndex:2] integerValue];
	broadcastAddr.sin_port = htons(thePort); // Set port 4445
}

- (void)getDatagramPacketPort:(CDVInvokedUrlCommand*)command
{
	
}

- (void)setDatagramPacketData:(CDVInvokedUrlCommand*)command
{
	messageToSend = ((NSString *)[command.arguments objectAtIndex:0]).cString;
}

- (void)getDatagramPacketData:(CDVInvokedUrlCommand*)command
{
	
}

- (void)createDatagramSocket:(CDVInvokedUrlCommand*)command
{
	// pure C
	DatagramSocketC = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP);
    int broadcastEnable=1;
    int ret=setsockopt(DatagramSocketC, SOL_SOCKET, SO_BROADCAST, &broadcastEnable, sizeof(broadcastEnable));
	
}

- (void)sendDatagramPacket:(CDVInvokedUrlCommand*)command
{
	int ret = sendto(DatagramSocketC, messageToSend, strlen(messageToSend), 0, (struct sockaddr*)&broadcastAddr, sizeof broadcastAddr);
}




@end